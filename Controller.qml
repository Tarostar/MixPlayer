import QtQuick 2.3
import QtMultimedia 5.4
import FileIO 1.0
import "utils.js" as Utils

Rectangle {
    property string fullMusicPath
    property string fullEffectPath
    property bool updateMusicSlider: true
    property bool updateEffectSlider: true

    property bool writeMode: true

    width: parent.width
    height: parent.height

    function removeSuffixFromPath(path)
    {
        var newPath = path.substring(0, path.length - 4);
        if (newPath[newPath.length - 1] === ".")
        {
            newPath = newPath.substring(0, newPath.length-1);
        }

        return newPath;
    }

    Connections {
        target: ImageHandler
        onMusicImagePath: {
            if (path.length > 0)
            {
                musicImage.visible = true;
                musicImage.source = path;
            }
            else
            {
                musicImage.visible = false;
            }
        }

        onEffectImagePath: {
            if (path.length > 0)
            {
                effectImage.visible = true;
                effectImage.source = path;
            }
            else
            {
                effectImage.visible = false;
            }
        }
    }

    Rectangle {
        id: music
        anchors.top: parent.top
        width: parent.width
        height: parent.height / 2
        color: "black"

        ControllerDisplay {
            id: musicDisplay
            playerList: musicList
            title: removeSuffixFromPath(fullMusicPath.substring(fullMusicPath.substring(0, fullMusicPath.length-1).lastIndexOf("/") + 1, fullMusicPath.length));
            anchors.top: parent.top
            width: parent.width
            onTitleChanged: {
                ImageHandler.newMusicImage(useLocalStoragePath ? localStoragePath + title : fullMusicPath);
                musicTextFile.source = useLocalStoragePath ? localStoragePath + title + ".txt" : removeSuffixFromPath(fullMusicPath) + ".txt";
                console.log(musicTextFile.source);
                writeMode = false;
                musicText.text =  musicTextFile.read();
                writeMode = true;
            }
        }
        ControllerInterface {
            id: musicInterface
            playerList: musicList
            anchors.top: musicDisplay.bottom
        }
        PositionSlider {
            id: musicSlider
            anchors.top: musicInterface.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: mmItemMargin
            maximumValue: musicList.mediaPlayer.duration / 1000
            value: updateMusicSlider ? musicList.mediaPlayer.position / 1000 : musicSlider.value
            onPressedChanged: {
                if (!musicSlider.pressed)
                {
                    musicList.mediaPlayer.seek(musicSlider.value * 1000);
                }

                updateMusicSlider = !musicSlider.pressed;
            }
        }
        Image {
            id: musicImage
            visible: true
            anchors.left: parent.left
            anchors.top: musicSlider.bottom
            anchors.bottom: parent.bottom
            width: parent.width
            fillMode: Image.PreserveAspectFit
        }
        Flickable {
             id: musicFlick
             anchors.left: parent.left
             anchors.top: musicSlider.bottom
             anchors.bottom: parent.bottom
             anchors.margins: mmItemMargin
             width: parent.width - (mmItemMargin * 2)
             contentWidth: musicText.paintedWidth
             contentHeight: musicText.paintedHeight
             clip: true

             function ensureVisible(r)
             {
                 if (contentX >= r.x)
                     contentX = r.x;
                 else if (contentX+width <= r.x+r.width)
                     contentX = r.x+r.width-width;
                 if (contentY >= r.y)
                     contentY = r.y;
                 else if (contentY+height <= r.y+r.height)
                     contentY = r.y+r.height-height;
             }

             TextEdit {
                 id: musicText
                 focus: true
                 color: "yellow"
                 width: musicFlick.width
                 height: musicFlick.height
                 wrapMode: Text.WordWrap
                 onCursorRectangleChanged: musicFlick.ensureVisible(cursorRectangle)
                 onTextChanged: {
                     if (writeMode)
                     {
                         musicTextFile.write(text);
                     }
                 }
             }
         }
        FileIO {
            id: musicTextFile
            onError: musicText.text =  "";
        }
    }
    Rectangle {
        id: effect
        anchors.top: music.bottom
        width: parent.width
        height: parent.height / 2
        color: "black"

        ControllerDisplay {
            id: effectDisplay
            playerList: effectList
            title: fullEffectPath.substring(fullEffectPath.substring(0, fullEffectPath.length-1).lastIndexOf("/") + 1, fullEffectPath.length - 4);
            anchors.top: parent.top
            width: parent.width
            onTitleChanged: {
                ImageHandler.newEffectImage(useLocalStoragePath ? localStoragePath + title : fullEffectPath);
                effectTextFile.source = useLocalStoragePath ? localStoragePath + title + ".txt" : removeSuffixFromPath(fullEffectPath) + ".txt";
                effectText.text =  effectTextFile.read();
            }
        }
        ControllerInterface {
            id: effectInterface
            playerList: effectList
            anchors.top: effectDisplay.bottom
        }
        PositionSlider {
            id: effectSlider
            anchors.top: effectInterface.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: mmItemMargin
            maximumValue: effectList.mediaPlayer.duration / 1000
            value: updateEffectSlider ? effectList.mediaPlayer.position / 1000 : effectSlider.value
            onPressedChanged: {
                if (!effectSlider.pressed)
                {
                    effectList.mediaPlayer.seek(effectSlider.value * 1000);
                }

                updateEffectSlider = !effectSlider.pressed;
            }
        }

        Image {
            id: effectImage
            visible: true
            anchors.left: parent.left
            anchors.top: effectSlider.bottom
            width: parent.width
            height: parent.height - effectInterface.height - effectDisplay.height - effectSlider.height
            fillMode: Image.PreserveAspectFit
        }
        Flickable {
             id: effectFlick
             anchors.left: parent.left
             anchors.top: effectSlider.bottom
             anchors.bottom: parent.bottom
             anchors.margins: mmItemMargin
             width: parent.width - (mmItemMargin * 2)
             contentWidth: effectText.paintedWidth
             contentHeight: effectText.paintedHeight
             clip: true

             function ensureVisible(r)
             {
                 if (contentX >= r.x)
                     contentX = r.x;
                 else if (contentX+width <= r.x+r.width)
                     contentX = r.x+r.width-width;
                 if (contentY >= r.y)
                     contentY = r.y;
                 else if (contentY+height <= r.y+r.height)
                     contentY = r.y+r.height-height;
             }

             TextEdit {
                 id: effectText
                 focus: true
                 color: "yellow"
                 width: effectFlick.width
                 height: effectFlick.height
                 wrapMode: Text.WordWrap
                 onCursorRectangleChanged: effectFlick.ensureVisible(cursorRectangle)
                 onTextChanged: {
                     if (writeMode)
                     {
                         effectTextFile.write(text);
                     }
                 }
             }
         }
        FileIO {
            id: effectTextFile
            onError: effectText.text =  "";
        }
    }

}
