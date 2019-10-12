import QtQuick 2.0
import QtQuick.Controls 2.5
import "variables.js" as VARIABLES
Rectangle {
    width: 150;
    height: 50;
    color: "lightgrey"
    id: scanningResult
    Image {
        id: resultStyleIcon
        width: 30;
        height: parent.height;
        source: "../src/ic_jailbreak_good.png";
    }
    Text {
        id: resultNumber
        text: qsTr("20");
        font.pointSize: 20;
    }
    Text {
        id: resultDescription;
        text:VARIABLES.STR_THREATS_DETECTED;
    }
}
