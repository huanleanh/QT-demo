import QtQuick 2.0
import QtQuick.Controls 2.5
import "../variables.js" as VARIABLES
Item {
    width: 100;
    height: 50;
    Image {
        id: resultStyleIcon
        width: 30;
        height: parent.height;
        source: "../src/ic_encrypt_good.png";
    }
    Column {
        id: detailResult
        width: 70;
        height: parent.height;
        anchors.right: parent.right
        anchors.rightMargin: 10;
        Text {
            id: resultNumber
            text: qsTr(20);
        }
        Text {
            id: resultDescription;
            text:VARIABLES.STR_THREATS_DETECTED;
        }
    }
}
