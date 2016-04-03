import QtQuick 2.0
import "utils.js" as Utils

Rectangle {
    color: "burlywood"

    property int counter: 0

    Timer {
        interval: 1000; running: true; repeat: true
        onTriggered:
        {
            counter += 1000;
            timerText.text = Date().toString() + " [" + Utils.geTimeStringFromPosition(counter) + "]";
        }
    }
    Text {
        id: timerText
        anchors.verticalCenter: parent.verticalCenter
        anchors.centerIn: parent
        text: "MIX PLAYER"
        font.pointSize: 10
        color: "black"
    }
    MouseArea {
        anchors.fill: parent
        onPressed:  {
            if (main.widthStep < 3)
            {
                switch (screens.state) {
                    case "effectPlayer": screens.state = "";
                        return;
                    case "centralController": main.widthStep == 2 ? screens.state = "" : screens.state = "effectPlayer";
                        return;
                    default: screens.state = "centralController";
                        return;
                }
            }
        }
    }
}
