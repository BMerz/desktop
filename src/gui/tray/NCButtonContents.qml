import QtQuick 2.15
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.2

import Style 1.0

RowLayout {
    id: root

    property bool hovered: false
    property string imageSourceHover: ""
    property string imageSource: ""
    property string text: ""

    property color textColor: Style.ncTextColor
    property color textColorHovered: textColor
    property bool bold: false

    Image {
        id: icon

        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

        source: root.hovered ? root.imageSourceHover : root.imageSource
        fillMode: Image.PreserveAspectFit
    }

    Label {
        Layout.maximumWidth: icon.width > 0 ? parent.width - icon.width - parent.spacing : parent.width
        Layout.fillWidth: icon.status !== Image.Ready

        text: root.text
        font.bold: root.bold

        visible: root.text !== ""

        color: root.hovered ? root.textColorHovered : root.textColor

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        elide: Text.ElideRight
    }
}
