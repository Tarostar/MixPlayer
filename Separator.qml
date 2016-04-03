import QtQuick 2.3

Rectangle {
    // Acccess to override default colours.
    property alias topColor: topLine.color
    property alias middleColor: middleLine.color
    property alias bottomColor: bottomLine.color

    height: 3

    Rectangle { id: topLine; color: "black"; width: parent.width; height: 1; anchors.top: parent.top }
    Rectangle { id: middleLine; color: "white"; width: parent.width; height: 1; anchors.top: topLine.bottom}
    Rectangle { id: bottomLine; color: "black"; width: parent.width; height: 1; anchors.top: middleLine.bottom }
}
