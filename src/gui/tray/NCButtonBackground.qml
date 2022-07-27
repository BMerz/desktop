import QtQuick 2.15

Rectangle {
    property bool hovered: false
    property real normalOpacity: 0.3
    property real hoverOpacity: 1.0

    color: "transparent"
    opacity: hovered ? hoverOpacity : normalOpacity
    radius: width / 2
}
