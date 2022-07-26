import QtQuick 2.15
import QtQuick.Controls 2.15

import com.nextcloud.desktopclient 1.0 as NC
import Style 1.0

ScrollView {
    id: controlRoot
    property alias model: activityList.model

    property bool isFileActivityList: false

    signal showFileActivity(string objectName, int objectId)
    signal activityItemClicked(int index)

    contentWidth: availableWidth
    padding: 1
    focus: false

    ScrollBar.horizontal.policy: ScrollBar.AlwaysOff

    data: NC.WheelHandler {
        target: controlRoot.contentItem
    }

    ListView {
        id: activityList

        Accessible.role: Accessible.List
        Accessible.name: qsTr("Activity list")

        clip: true
        spacing: 0
        currentIndex: -1
        interactive: true

        highlight: Rectangle {
            id: activityHover
            width: activityList.currentItem.width
            height: activityList.currentItem.height
            color: activityList.currentItem.enabled ? Style.lightHover : "transparent"
            border.color: Style.menuBorder
            border.width: activityList.currentItem.enabled ? 0 : 2
            visible: activityList.activeFocus
        }
        highlightFollowsCurrentItem: true
        highlightMoveDuration: 0
        highlightResizeDuration: 0
        highlightRangeMode: ListView.ApplyRange
        preferredHighlightBegin: 0
        preferredHighlightEnd: controlRoot.height

        delegate: ActivityItem {
            isFileActivityList: controlRoot.isFileActivityList
            width: activityList.contentWidth
            flickable: activityList
            onEntered: {
                // When we set the currentIndex the list view will scroll...
                // unless we tamper with the preferred highlight points to stop this.
                const cachedPreferredHighlightBegin = activityList.preferredHighlightBegin;
                const cachedPreferredHighlightEnd = activityList.preferredHighlightEnd;
                // Set overkill values to make sure no scroll happens when we hover with mouse
                activityList.preferredHighlightBegin = -controlRoot.height;
                activityList.preferredHighlightEnd = controlRoot.height * 2;

                activityList.currentIndex = index

                // Reset original values so keyboard navigation makes list view scroll
                activityList.preferredHighlightBegin = cachedPreferredHighlightBegin;
                activityList.preferredHighlightEnd = cachedPreferredHighlightEnd;

                forceActiveFocus();
            }
            onClicked: {
                if (model.isCurrentUserFileActivity) {
                    showFileActivity(model.objectName, model.objectId)
                } else {
                    activityItemClicked(model.index)
                }
            }
        }
    }
}
