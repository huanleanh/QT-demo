import QtQuick 2.0
import QtQuick.Controls 2.5
import "variables.js" as VARIABLES
Item {
    width: 150;
    height: 50;
    property string icon: VARIABLES.SRC_IMG_THREATS
    property int fileNumber: 0
    property string fileStyle: VARIABLES.STR_UNKNOWN
    Image {
        id: resultStyleIcon
        width: 50;
        height: parent.height;
        source: icon;
        fillMode: Image.PreserveAspectFit
        anchors.right: parent.right;
    }
    Text {
        id: resultNumber
        text: Number(fileNumber).toString();
        font.pointSize: 20;
        anchors.right: resultStyleIcon.left;
        anchors.rightMargin: 15;
        anchors.top: parent.top;
        anchors.topMargin: -5;
    }
    Text {
        id: resultDescription;
        text: fileStyle;
        font.pointSize: 10;
        anchors.right: resultStyleIcon.left;
        anchors.rightMargin: 15;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 5;
    }
}
