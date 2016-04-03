import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Controls 1.2
//import QtQuick.Controls.Styles 1.3

Slider {
    value: 0
    stepSize: 1
    minimumValue: 0
    updateValueWhileDragging: false
    tickmarksEnabled: false
    /*style: SliderStyle {
        groove: Rectangle {
            color: "white"
            border.color: "gray"
            border.width: Screen.pixelDensity / 4
            implicitHeight: Screen.pixelDensity * main.scale
            radius: Screen.pixelDensity / 2 * main.scale
        }
        handle: Rectangle {
            anchors.centerIn: parent
            color: control.pressed ? "lightgray" : "white"
            border.color: "gray"
            border.width: Screen.pixelDensity / 4
            implicitWidth: Screen.pixelDensity * 5 * main.scale
            implicitHeight: Screen.pixelDensity * 5 * main.scale
            radius: Screen.pixelDensity * 4 * main.scale
        }
    }*/
}
