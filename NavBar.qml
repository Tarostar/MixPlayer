import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Controls 1.2

Rectangle {
    id: navBar
    width: parent.width
    color: "turquoise"
    property int sortIndex: 0

    function canGoUp() {
        return listPlayer.currentFolder.substring(0,listPlayer.currentFolder.length-1).lastIndexOf("/") > 0;
    }

    Text {
        id: navPath
        anchors.verticalCenter: navBar.verticalCenter
        anchors.left: navBar.left
        anchors.leftMargin: main.mmItemMargin
        text: listPlayer.currentFolder
        font.pointSize: 10
        font.bold: true
    }
    Search {
        id: search
        visible: main.widthStep >= 3
        anchors.top: parent.top
        anchors.right: upAction.left
        anchors.rightMargin: main.mmItemMargin
        width: main.mmItemMargin * 10
        height: parent.height / 2
    }
    ComboBox {
        id: sort
        visible: main.widthStep >= 3
        editable: false
        anchors.bottom: parent.bottom
        anchors.right: upAction.left
        anchors.rightMargin: main.mmItemMargin
        width: main.mmItemMargin * 10
        height: parent.height / 2
        model: [ "Name", "Time", "Size", "Type", "Ascending", "Descending" ]
        onCurrentIndexChanged: {
            if (currentIndex === 4)
            {
                listPlayer.model.sortReversed = false;
            }
            else if (currentIndex === 5)
            {
                listPlayer.model.sortReversed = true;
            }
            else
            {
                switch (currentIndex)
                {
                    case 0: listPlayer.model.sortField = "Name";
                        break;
                    case 1: listPlayer.model.sortField = "Time";
                        break;
                    case 2: listPlayer.model.sortField = "Size";
                        break;
                    case 3: listPlayer.model.sortField = "Type";
                        break;
                }
            }
        }
    }
    Rectangle {
        id: upAction
        visible: canGoUp()
        anchors.right: navBar.right
        width: upText.contentWidth + main.mmItemMargin * 2
        height: main.mmItemHeight + main.mmItemMargin
        color: "springgreen"
        Text {
            id: upText
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: main.mmItemMargin
            anchors.rightMargin: main.mmItemMargin
            text: "up"
            font.pointSize: 10
            font.bold: true
        }
        MouseArea {
            id: upArea
            anchors.fill: parent
            onClicked:  {
                if (canGoUp()) {
                    listPlayer.currentIndex = -1;
                    listPlayer.currentFolder = listPlayer.currentFolder.substring(0, listPlayer.currentFolder.substring(0, listPlayer.currentFolder.length-1).lastIndexOf("/") + 1);
                }
            }
        }
    }
    Rectangle {
        id: driveLetter
        visible: !canGoUp()
        anchors.right: navBar.right
        width: navPath.contentWidth + main.mmItemMargin * 2
        height: main.mmItemHeight + main.mmItemMargin
        color: "springgreen"
        TextInput {
            id: driveText
            color: "white"
            anchors.verticalCenter: parent.verticalCenter
            anchors.fill: parent
            anchors.leftMargin: main.mmItemMargin / 2
            anchors.rightMargin: main.mmItemMargin / 2
            anchors.topMargin: main.mmItemMargin
            text: listPlayer.currentFolder
            font.pointSize: 12
            font.bold: false
            onEditingFinished: {
                listPlayer.currentFolder = text;
            }
        }
    }
    Separator {
        id: separator
        anchors.bottom: parent.bottom
        width: parent.width
        topColor: "#03A89E"
        bottomColor: "#03A89E"
        middleColor: "darkgreen"
    }

}
