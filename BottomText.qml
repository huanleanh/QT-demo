import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3
import QtQuick.Controls.Styles 1.4
import "variables.js" as VARIABLES

Item{
    visible: true
    width: mainWindow.width
    height: lbConnect.height
    Item{
        id: itemDelegate
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        Label {
            id: lbConnect
            text: VARIABLES.STR_CONNECT;
            anchors.left: parent.left
            anchors.leftMargin: 30
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
        }

    }
    Item {
        id: itemDelegate1
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        Label {
            id: lbAbout
            text: VARIABLES.STR_ABOUT;
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 30
        }
        Label {
            id: lbPrivacy
            text: VARIABLES.STR_PRIVACY;
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.right: lbAbout.left
            anchors.rightMargin: 30
        }
    }

}


