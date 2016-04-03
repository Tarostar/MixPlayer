import QtQuick 2.3
import Qt.labs.folderlistmodel 2.1
import QtMultimedia 5.4
import QtQml 2.2

ListView {
    id: listView
    width: parent.width
    clip: true
    boundsBehavior: Flickable.StopAtBounds
    property alias mediaPlayer: thePlayer
    property alias playerSource: thePlayer.source
    property alias currentIndex: listView.currentIndex

    property bool loop: true
    property real volume: 1.0

    onLoopChanged: thePlayer.loops = loop ? MediaPlayer.Infinite : 1
    onVolumeChanged: thePlayer.volume = volume

    function next()
    {
        if (listView.currentIndex < 0)
            return;

        listView.incrementCurrentIndex();

        while (listView.currentItem.isDir && listView.currentIndex < listView.count)
        {
            listView.incrementCurrentIndex();
        }

        if (listView.currentItem.isDir)
            return;

        thePlayer.source = listView.currentItem.source;
        thePlayer.play();
    }

    function previous()
    {
        if (listView.currentIndex < 0)
            return;

        listView.decrementCurrentIndex();

        while (listView.currentItem.isDir && listView.currentIndex > 0)
        {
            listView.decrementCurrentIndex();
        }

        if (listView.currentItem.isDir)
            return;

        thePlayer.source = listView.currentItem.source;
        thePlayer.play();
    }

    MediaPlayer {
        id: thePlayer
        loops: MediaPlayer.Infinite
    }

    FolderListModel {
        id: folderModel
        nameFilters: ["*.mp3", "*.MP3", "*.wav", "*.WAV", "*.Wav", "*.flac", "*.FLAC", "*.ogg", "*.OGG"]
        showFiles: true
        showDirsFirst: true
        folder : "file:///" + listPlayer.currentFolder
    }

    Component {
        id: fileDelegate

        Rectangle {
            width: parent.width
            height: main.mmItemHeight + main.mmItemMargin
            color: index === listView.currentIndex ? "yellow" : (model.fileIsDir ? index%2 == 0 ? "skyblue" : "powderblue" : index%2 == 0 ? "goldenrod" : "gold")

            property bool isDir: model.fileIsDir
            property string source: Qt.platform.os === "windows" ? listPlayer.currentFolder + model.fileName :  "file:///" + listPlayer.currentFolder + model.fileName;

            Text {
                id: itemText
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: main.mmItemMargin
                text: (model.fileSuffix === "mp3" || model.fileIsDir) ? model.fileBaseName : model.fileBaseName + " (" + model.fileSuffix + ")"
                font.pointSize: 10
            }
            MouseArea {
                id: playArea
                anchors.fill: parent
                onClicked:  {
                    if (isDir) {
                        currentIndex = -1;
                        listPlayer.currentFolder += model.fileName + "/";
                        return;
                    }

                    currentIndex = index;

                    thePlayer.source = source;
                    if (thePlayer.playbackState === MediaPlayer.PlayingState)
                    {
                        thePlayer.pause();
                    }
                    else {
                        thePlayer.play();
                    }
                }
            }
        }
    }
    model: folderModel
    delegate: fileDelegate
}
