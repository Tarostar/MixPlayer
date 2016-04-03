import QtQuick 2.0
import QtMultimedia 5.4

Rectangle {
    property ListPlayer playerList
    height: playNext.height

    ControllerButton {
        id: playPrevious
        width: mmViewWidth / 11
        playerInterface: playerList
        imageSource: "ic_action_previous.png"
        onButtonClicked: playerList.previous();
    }
    ControllerButton {
        id: playNext
        playerInterface: playerList
        width: mmViewWidth / 11
        anchors.left: playPrevious.right
        imageSource: "ic_action_next.png"
        onButtonClicked: playerList.next();
    }
    ControllerButton {
        id: playStop
        playerInterface: playerList
        width: mmViewWidth / 11
        anchors.left: playNext.right
        imageSource: "ic_action_stop.png"
        onButtonClicked: {
            playerList.mediaPlayer.stop();
        }
    }
    ControllerButton {
        id: playMusic
        playerInterface: playerList
        width: mmViewWidth / 11
        anchors.left: playStop.right
        imageSource: "ic_action_play.png"
        imageSourcePlaying: "ic_action_pause.png"
        onButtonClicked: {

            if (playerList.mediaPlayer.playbackState === MediaPlayer.PlayingState)
            {
                playerList.mediaPlayer.pause();
            }
            else {                
                playerList.mediaPlayer.play();
            }
        }
    }
    ControllerButton {
        id: playMute
        playerInterface: playerList
        width: mmViewWidth / 11
        anchors.left: playMusic.right
        imageSource: playerList.mediaPlayer.muted ? "ic_action_volume_muted.png" : "ic_action_volume_on.png"
        onButtonClicked: playerList.mediaPlayer.muted = !playerList.mediaPlayer.muted;
    }
    ControllerButton {
        id: playVolume1
        playerInterface: playerList
        width: mmViewWidth / 22
        anchors.left: playMute.right
        imageSource: playerList.volume >= 0.1 ? "ic_action_vol_on.png" : "ic_action_vol.png"
        onButtonClicked: playerList.volume == 0.1 ? playerList.volume = 0 : playerList.volume = 0.1
    }
    ControllerButton {
        id: playVolume2
        playerInterface: playerList
        width: mmViewWidth / 22
        anchors.left: playVolume1.right
        imageSource: playerList.volume >= 0.2 ? "ic_action_vol_on.png" : "ic_action_vol.png"
        onButtonClicked: playerList.volume == 0.2 ? playerList.volume = 0.1 : playerList.volume = 0.2
    }
    ControllerButton {
        id: playVolume3
        playerInterface: playerList
        anchors.left: playVolume2.right
        width: mmViewWidth / 22
        imageSource: playerList.volume >= 0.3 ? "ic_action_vol_on.png" : "ic_action_vol.png"
        onButtonClicked: playerList.volume == 0.3 ? playerList.volume = 0.2 : playerList.volume = 0.3
    }
    ControllerButton {
        id: playVolume4
        playerInterface: playerList
        width: mmViewWidth / 22
        anchors.left: playVolume3.right
        imageSource: playerList.volume >= 0.4 ? "ic_action_vol_on.png" : "ic_action_vol.png"
        onButtonClicked: playerList.volume == 0.4 ? playerList.volume = 0.3 : playerList.volume = 0.4
    }
    ControllerButton {
        id: playVolume5
        playerInterface: playerList
        width: mmViewWidth / 22
        anchors.left: playVolume4.right
        imageSource: playerList.volume >= 0.5 ? "ic_action_vol_on.png" : "ic_action_vol.png"
        onButtonClicked: playerList.volume == 0.5 ? playerList.volume = 0.4 : playerList.volume = 0.5
    }
    ControllerButton {
        id: playVolume6
        playerInterface: playerList
        width: mmViewWidth / 22
        anchors.left: playVolume5.right
        imageSource: playerList.volume >= 0.6 ? "ic_action_vol_on.png" : "ic_action_vol.png"
        onButtonClicked: playerList.volume == 0.6 ? playerList.volume = 0.5 : playerList.volume = 0.6
    }
    ControllerButton {
        id: playVolume7
        playerInterface: playerList
        width: mmViewWidth / 22
        anchors.left: playVolume6.right
        imageSource: playerList.volume >= 0.7 ? "ic_action_vol_on.png" : "ic_action_vol.png"
        onButtonClicked: playerList.volume == 0.7 ? playerList.volume = 0.6 : playerList.volume = 0.7
    }
    ControllerButton {
        id: playVolume8
        playerInterface: playerList
        width: mmViewWidth / 22
        anchors.left: playVolume7.right
        imageSource: playerList.volume >= 0.8 ? "ic_action_vol_on.png" : "ic_action_vol.png"
        onButtonClicked: playerList.volume == 0.8 ? playerList.volume = 0.7 : playerList.volume = 0.8
    }
    ControllerButton {
        id: playVolume9
        playerInterface: playerList
        width: mmViewWidth / 22
        anchors.left: playVolume8.right
        imageSource: playerList.volume >= 0.9 ? "ic_action_vol_on.png" : "ic_action_vol.png"
        onButtonClicked: playerList.volume == 0.9 ? playerList.volume = 0.8 : playerList.volume = 0.9
    }
    ControllerButton {
        id: playVolume10
        playerInterface: playerList
        width: mmViewWidth / 22
        anchors.left: playVolume9.right
        imageSource: playerList.volume >= 1.0 ? "ic_action_vol_on.png" : "ic_action_vol.png"
        onButtonClicked: playerList.volume == 1.0 ? playerList.volume = 0.9 : playerList.volume = 1.0
    }
    ControllerButton {
        id: playLoop
        playerInterface: playerList
        width: mmViewWidth / 11
        anchors.left: playVolume10.right
        imageSource: playerList.loop ? "ic_action_replay.png" : "ic_action_no_replay.png"
        onButtonClicked: playerList.loop = !playerList.loop
    }
}
