import QtQuick 2.0
import QtCharts 2.3
import QtQuick.Controls 2.5
import "variables.js" as VARIABLES
import "functions.js" as MyScript

Page {
    visible: true
    width: mainWindow.width
    height: mainWindow.height

    Label {
        id: lbRisks
        text: qsTr("DEVICE AT RISK!");
        font.family: "Arial"
        anchors.top: menu.bottom
        anchors.topMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter;
        color: VARIABLES.COLOR_MAIN;
        font.pixelSize: 40;
        opacity: 0;
    }
    ScanningResultLeft  {
        id: leftAboveItem
        x : parent.width * 0.2;
        y : parent.height * 0.35;
        icon: VARIABLES.SRC_IMG_CHART;
        fileNumber: 20;
        opacity: 0;
        fileStyle: VARIABLES.STR_THREATS_DETECTED;
    }
    ScanningResultLeft  {
        id: leftBelowItem
        x : parent.width * 0.2;
        y : parent.height * 0.6;
        opacity: 0;
        icon: VARIABLES.SRC_IMG_CHART;
        fileNumber: 0;
        fileStyle: VARIABLES.STR_VULNERABLE_FILES;

    }
    ScanningResultRight  {
        id: rightAboveItem;
        opacity: 0;
        x : parent.width * 0.8 - this.width;
        y : parent.height * 0.35;
        icon: VARIABLES.SRC_IMG_PASSWORD_LOCK_BAD;
        fileNumber: 8;
        fileStyle: VARIABLES.STR_HARMFUL_APPS;
    }
    ScanningResultRight  {
        id: rightBelowItem
        opacity: 0;
        x : parent.width * 0.8 - this.width;
        y : parent.height * 0.6;
        icon: VARIABLES.SRC_IMG_CHART;
        fileNumber: 0;
        fileStyle: VARIABLES.STR_ACCESSES_BLOCKED;
    }
    Item {
        id: score
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        width: 250;
        height: 250;
        //the circle
        Rectangle{
            id: imgRainbow
            width: parent.width*1.5;
            height: parent.width*1.5;
            radius: parent.width*1.5/2;
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            Image {
                source: VARIABLES.SRC_IMG_ROTATION;
                fillMode: Image.PreserveAspectFit
                anchors.fill: parent
                opacity: 0
            }
            Rectangle {
                id : process
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                width: lbPercentage.width + lbTotal.width;
                height: lbPercentage.height;
                opacity: 0;
                Text {
                    id: lbPercentage
                    text: "50"
                    color: VARIABLES.COLOR_MAIN;
                    font.pointSize: 100;
                }
                Text {
                    id: lbTotal
                    text: "/100"
                    anchors.left: lbPercentage.right
                    anchors.verticalCenter: lbPercentage.verticalCenter;
                    color: "GREY"
                    font.pixelSize: 20
                }
                Label {
                    id: lbSafetyScore
                    text: VARIABLES.STR_SAFETY_SCORE;
                    anchors.horizontalCenter: parent.horizontalCenter;
                    anchors.bottom: process.top
                    color: "GREY"
                    font.pixelSize: 20
                }
            }

        }
    }
    Item{
        id: lbHistory
        opacity: 0;
        anchors.bottom: btnQuickScan.top;
        anchors.bottomMargin: 50;
        anchors.horizontalCenter: parent.horizontalCenter;
        width: lastScan.width + scanHistory.width;
        Text {
            id: lastScan
            text: VARIABLES.STR_LAST_SCAN;
            font.pointSize: 10;
        }
        Text {
            id: scanHistory
            text: qsTr(VARIABLES.STR_SCAN_HISTORY);
            font.pointSize: 10;
            font.underline: true;
            anchors.left: lastScan.right;
            color: "blue";
            anchors.verticalCenter: lastScan.verticalCenter;
            anchors.leftMargin: 5;
        }
    }

    Button {
        id: btnQuickScan
        text: VARIABLES.STR_BTN_QUICK_SCAN;
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 70
        anchors.horizontalCenter: parent.horizontalCenter
        opacity: 0;
        onClicked: {
            controllerDashboard.onClicked();
            scanningTransform.start();
        }
    }
    Menu_style_2{
        opacity: 0;
        id: menu
    }
    BottomText{
        opacity: 0
        id: bottomText
        anchors.bottom: parent.bottom
    }
    SequentialAnimation {
        id: scanningTransform
        ParallelAnimation {
            id: constructPage;
            NumberAnimation { id: topItem; targets: [lbRisks]; property: "anchors.topMargin"; to: lbRisks.anchors.topMargin - 300; duration: 500; }
            NumberAnimation { id: bottomItem; targets: [btnQuickScan]; property: "anchors.bottomMargin"; to: btnQuickScan.anchors.bottomMargin - 300; duration: 500; }
            NumberAnimation { id: leftItem; targets: [leftAboveItem,leftBelowItem]; property: "x"; to: leftAboveItem.x - 300; duration: 500; }
            NumberAnimation { id: rightItem; targets: [rightAboveItem,rightBelowItem]; property: "x"; to: rightAboveItem.x + 300; duration: 500; }
            NumberAnimation { targets: [leftAboveItem, leftBelowItem, rightAboveItem,
                    rightBelowItem, lbRisks, lbHistory,
                    btnQuickScan, process, bottomText];
                property: "opacity";  from: 1 ; to : 0; duration: 500; }
        }
        PropertyAnimation {
            target: loader;
            property: "source";
            to : "Scanning.qml";
            duration: 0;
        }
    }
    SequentialAnimation {
        id: startDashboard;
        running: true;
        ParallelAnimation {
//            NumberAnimation { targets: [lbRisks]; property: "anchors.topMargin"; duration: 500; }
//            NumberAnimation { targets: [btnQuickScan]; property: "anchors.bottomMargin"; duration: 500; }
//            NumberAnimation { targets: [leftAboveItem,leftBelowItem]; property: "x"; duration: 500; }
//            NumberAnimation { targets: [rightAboveItem,rightBelowItem]; property: "x"; duration: 500; }
            NumberAnimation { targets: [leftAboveItem, leftBelowItem, rightAboveItem,
                    rightBelowItem, lbRisks, lbHistory, btnQuickScan,
                    process, menu, bottomText];
                property: "opacity";  to: 1 ; duration: 500; }
        }
    }
}


