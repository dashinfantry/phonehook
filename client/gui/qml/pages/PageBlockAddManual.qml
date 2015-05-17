import QtQuick 2.0
import Sailfish.Silica 1.0

Dialog {
    id: root

    property string number
    property string name

    acceptDestinationAction: PageStackAction.Pop

    onAccepted: {
        _blocks.addManualBlock(blockName.text,blockNumber.text);
    }

    canAccept: blockName.text != '' && blockNumber.text != ''

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: clmn.height+header.height+50

        DialogHeader {
            id: header
            acceptText: "Add Block"
        }

        Column {
            id: clmn
            spacing: Theme.paddingLarge
            anchors.fill: parent
            anchors.topMargin: header.height
            anchors.leftMargin: Theme.paddingLarge
            anchors.rightMargin: Theme.paddingLarge

            Text {
                color: Theme.secondaryColor
                text: "Add a number to be blocked. Number may be either local or international variety. Use * for wildcard matching."
                font.pixelSize: Theme.fontSizeSmall
                width: parent.width
                wrapMode: Text.Wrap
            }

            Item {
                height: 50
                width: parent.width
            }

            TextField {
                id: blockName
                width: parent.width
                placeholderText: "Name"
                text: name
                anchors.horizontalCenter: parent.horizontalCenter
            }

            TextField {
                id: blockNumber
                width: parent.width
                placeholderText: "Phone Number"
                text: number
                anchors.horizontalCenter: parent.horizontalCenter
                inputMethodHints: Qt.ImhDialableCharactersOnly
            }
        }
    }
}
