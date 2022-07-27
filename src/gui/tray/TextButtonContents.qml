import QtQuick 2.15
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.2

import Style 1.0

Label {
    property bool hovered: false
    property color textColor: Style.ncTextColor
    property color textColorHovered: Style.ncSecondaryTextColor
    property bool bold: false

    font.underline: true
    font.bold: bold
    color: hovered ? textColorHovered : textColor

    horizontalAlignment: Text.AlignLeft
    verticalAlignment: Text.AlignVCenter

    elide: Text.ElideRight
}

