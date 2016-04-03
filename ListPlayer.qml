import QtQuick 2.3

Rectangle {
    id: listPlayer
    property string currentFolder
    property alias currentSource: audioList.playerSource
    property alias mediaPlayer: audioList.mediaPlayer
    property alias currentIndex: audioList.currentIndex
    property alias loop: audioList.loop
    property alias volume: audioList.volume
    property alias model: audioList.model

    function next()
    {
        audioList.next();
    }

    function previous()
    {
        audioList.previous();
    }

    NavBar {
        id: navBar
        height: main.mmItemHeight + main.mmItemMargin
        anchors.top: parent.top
    }

    AudioList {
        id: audioList
        height: parent.height - navBar.height
        anchors.top: navBar.bottom
    }
}
