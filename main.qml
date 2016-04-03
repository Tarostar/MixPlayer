import QtQuick 2.3
import QtQuick.Window 2.2
import Qt.labs.settings 1.0
import "utils.js" as Utils

Window {
    id: main
    visible: true
    width: Screen.width
    height: Screen.height
    property int divider: 100 * Screen.pixelDensity
    property int widthStep: width / divider

    // Save settings.
    Settings {
        // Galaxy API settings.
        property alias width: main.width
        property alias height: main.height
        property alias musicPlayerSource: musicList.currentSource
        property alias effectPlayerSource: effectList.currentSource
        property alias musicPlayerFolder: musicList.currentFolder
        property alias effectPlayerFolder: effectList.currentFolder
        property alias currentMusicIndex: musicList.currentIndex
        property alias currentEffectIndex: effectList.currentIndex
        property alias musicListLoop: musicList.loop
        property alias effectListLoop: effectList.loop
        property alias musicListVolume: musicList.volume
        property alias effectListVolume: effectList.volume
        property alias useLocalStoragePath: main.useLocalStoragePath
        property alias localStoragePath: main.localStoragePath
    }

    // User set size multiplier.
    property real scale: 1.0

    // List item in millimetre (pixelDensity is number of pixels per mm).
    property int mmItemHeight: Screen.pixelDensity * 10 * scale;
    property int mmItemMargin: Screen.pixelDensity * 3 * scale;
    property int mmViewWidth: widthStep < 1 ? main.width : widthStep > 3 ? (main.width / 3) : (main.width / widthStep)

    // Graphic elements
    readonly property var res: ["mdpi","hdpi","xhdpi", "xxhdpi"]
    readonly property int resIndex: Utils.getResolutionIndex(Screen.pixelDensity)
    readonly property string gfxDark: "qrc:/gfx/dark/" + res[resIndex] + "/"
    readonly property string gfxLight: "qrc:/gfx/light/" + res[resIndex] + "/"

    property bool useLocalStoragePath : true
    // best path on PC, does not work on my Android - good alternative is appPath
    //property string localStoragePath: appDataPath + "/data/"
    // works on Android
    property string localStoragePath: docPath + "/data/"

    onWidthChanged: screens.state = "";

    Rectangle {
        id: screens
        anchors.fill: parent
        Column {
            TopBar {
                id: topBar
                visible: true
                width: main.width
                height: mmItemHeight
            }
            Row {
                id: screenlayout
                ListPlayer {
                    id: musicList
                    width: mmViewWidth
                    height: main.height - mmItemHeight
                    currentFolder: musicPath
                }
                Controller {
                    id: centralController
                    width: mmViewWidth
                    height: main.height - mmItemHeight
                    fullMusicPath: musicList.currentSource
                    fullEffectPath: effectList.currentSource
                }
                ListPlayer {
                    id: effectList
                    width: mmViewWidth
                    height: main.height - mmItemHeight
                    currentFolder: musicPath
                }

            }
        }
        transitions: Transition {
            NumberAnimation {
                target: screenlayout
                easing.type: Easing.OutCubic
                property: "x"
                duration: 1000.0
            }
        }
        states: [
            State {
                name: "centralController"
                PropertyChanges {
                    target: screenlayout
                    x: main.widthStep == 2 ? -main.width / 2 : -main.width
                }
            },
            State {
                name: "effectPlayer"
                PropertyChanges {
                    target: screenlayout
                    x: (-main.width) * 2
                }
            }
        ]
    }
}

