import QtQuick 2.3
import QtQuick.Window 2.2

Rectangle {
    height: parent.height
    width: parent.width
    color: "white"

    TextInput {
        id: searchField
        anchors.fill: parent
        font.pointSize: 10
        anchors.leftMargin: main.mmItemMargin
        anchors.rightMargin: main.mmItemMargin
        anchors.topMargin: main.mmItemMargin / 2
        onTextChanged: {
            var searchText = searchField.text;
            searchText.toLowerCase()
            if (searchText === "")
            {
                listPlayer.model.nameFilters = ["*.mp3", "*.MP3", "*.wav", "*.WAV", "*.Wav", "*.flac", "*.FLAC", "*.ogg", "*.OGG"];
            }
            else
            {
                // listPlayer.model.nameFilters = ["*" + searchText + "*"]
                var filter = "*";
                for(var i = 0; i<text.length; i++)
                {
                     filter += "[%1%2]".arg(searchText[i].toUpperCase()).arg(searchText[i].toLowerCase());
                }
                filter += "*";
                listPlayer.model.nameFilters = [filter];
            }
        }
    }
}
