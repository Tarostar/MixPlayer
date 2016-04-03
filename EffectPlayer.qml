import QtQuick 2.3

EffectPlayer {
    id: effectPlayer
    width: parent.width
    height: main.height
    anchors.top: topBar.visible ? topBar.bottom : parent.top
    anchors.left: musicPlayer.right
    currentFolder: userPath
}
