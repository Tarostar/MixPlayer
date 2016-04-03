import QtQuick 2.0
import QtMultimedia 5.4
import "utils.js" as Utils

Rectangle {
    property ListPlayer playerList
    height: title.height + details.height
    property alias title: musicSource.text

    Rectangle {
        id: title
        anchors.top: parent.top
        width: parent.width
        height: musicSource.contentHeight + main.mmItemMargin
        color: "black"

        Text {
            id: musicSource
            anchors.centerIn: parent
            font.pointSize: 10
            color: "yellow"
        }
    }
    Rectangle {
        id: details
        anchors.top: title.bottom
        width: parent.width
        height: musicTime.contentHeight + main.mmItemMargin
        color: "black"

        Text {
            id: musicTime
            anchors.centerIn: parent
            property string position: Utils.geTimeStringFromPosition(playerList.mediaPlayer.position)
            property string duration: Utils.geTimeStringFromPosition(playerList.mediaPlayer.duration)
            property string looped: playerList.mediaPlayer.loops === MediaPlayer.Infinite ? " (loops)" : ""
            //property string metadata: playerList.mediaPlayer.metaData.albumArtist.toString()

            text: "duration: " + duration + " position: " + position + " volume: " + playerList.mediaPlayer.volume * 100 + "%" + looped // + " title: " + playerList.mediaPlayer.metaData.albumTitle.
            font.pointSize: 10
            color: "yellow"
        }
    }
}
