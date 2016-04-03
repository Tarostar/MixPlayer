import QtQuick 2.0
import QtMultimedia 5.4

Rectangle {
    id: button
    property ListPlayer playerInterface
    property string imageSource: ""
    property string imageSourcePlaying: ""
    property bool darkTheme: true

    signal buttonClicked

    color: darkTheme ? "black" : "ivory"
    width: main.mmItemHeight + main.mmItemMargin
    height: main.mmItemHeight + main.mmItemMargin

    function drawButton()
    {
        var source = imageSource;
        if (imageSourcePlaying.length > 0 && playerInterface.mediaPlayer.playbackState === MediaPlayer.PlayingState)
        {
            source = imageSourcePlaying;
        }

        var imagePathPressed = darkTheme ? gfxDark + source : gfxLight + source;
        var imagePath = darkTheme ? gfxLight + source : gfxDark + source;

        return imageMouseArea.pressed ? imagePathPressed : imagePath;
    }

    Image {
        id: image
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
        source: drawButton()
        MouseArea {
            id: imageMouseArea
            hoverEnabled: true
            anchors.fill: parent
            onClicked: button.buttonClicked()
        }
    }
}
