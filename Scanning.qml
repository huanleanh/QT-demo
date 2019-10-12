import QtQuick 2.0
import QtCharts 2.3
import QtQuick.Controls 2.5
import "variables.js" as VARIABLES
import "functions.js" as MyScript

Page {
    visible: true
    width: mainWindow.width
    height: mainWindow.height
    property int itemDistance: 0
    Item {
        id: score
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        width: 250;
        height: 250;

        //4 pictures around the circle
        Item {
            id: circleOuter
            width: parent.width*2;
            height: parent.width*2;
            //radius: parent.width*2.3/2;
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            Image {
                id: img1;
                width: 50;
                anchors.top: circleOuter.top;
                source: VARIABLES.SRC_IMG_PASSWORD_LOCK_BAD;
                fillMode: Image.PreserveAspectFit
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Image {
                id: img2;
                width: 50;
                anchors.bottom: circleOuter.bottom
                source: VARIABLES.SRC_IMG_APPLICATION;
                fillMode: Image.PreserveAspectFit
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Image {
                id: img3;
                width: 50;
                anchors.left: circleOuter.left;
                source: VARIABLES.SRC_IMG_OS_UPDATE_BAD;
                fillMode: Image.PreserveAspectFit;
                anchors.verticalCenter: parent.verticalCenter;
            }
            Image {
                id: img4;
                width: 50;
                anchors.right: circleOuter.right;
                source: VARIABLES.SRC_IMG_CHART;
                fillMode: Image.PreserveAspectFit;
                anchors.verticalCenter: parent.verticalCenter;
            }

        }
        //the circle
        Rectangle{
            id: imgRainbow
            width: parent.width*1.5;
            height: parent.width*1.5;
            radius: parent.width*1.5/2;
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            Image {
                id: imgRotation
                source: VARIABLES.SRC_IMG_ROTATION;
                fillMode: Image.PreserveAspectFit
                anchors.fill: parent
                opacity: 0;
            }
        }
        Label {
            id: lbPercentage
            color: VARIABLES.COLOR_BLUE;
            text: controllerDashboard.scanningValue;
            opacity: 0;
            font.pointSize: 50;
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
        Label {
            id: lbScanningTitle
            text: VARIABLES.STR_SCANNING_TITLE;
            anchors.bottom: lbPercentage.top
            anchors.bottomMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            opacity: 0
            color: "GREY"
            font.pointSize: 15
        }
        Label {
            id: lbAppName
            text: VARIABLES.STR_SCANNING_APPNAME;
            anchors.top: lbPercentage.bottom
            anchors.topMargin:  10
            anchors.horizontalCenter: parent.horizontalCenter
            color: "GREY"
            font.pointSize: 12
        }
    }
    Button {
        id: btnStopScan
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 70;
        text: VARIABLES.STR_BTN_STOP_SCAN;
        onClicked:  {
            stopScan.start();
            //loader.source = "Dashboard.qml";
        }
    }
    SequentialAnimation {
        id: rotateImg
        running: true;
        ParallelAnimation {
            NumberAnimation { targets: img1; property: "anchors.topMargin";     from: 100; to : -25; duration: 500; }
            NumberAnimation { targets: img2; property: "anchors.bottomMargin";  from: 100; to : -25; duration: 500; }
            NumberAnimation { targets: img3; property: "anchors.leftMargin";    from: 100; to : -25; duration: 500; }
            NumberAnimation { targets: img4; property: "anchors.rightMargin";   from: 100; to : -25; duration: 500; }
            NumberAnimation { targets: [img1, img2, img3, img4, lbPercentage, lbScanningTitle, lbAppName]; property: "opacity" ; to : 1; duration: 500; }
        }
        ParallelAnimation {
            NumberAnimation { targets: [imgRotation]; property: "opacity";  easing.type: Easing.InQuart; from: 0.001 ; to : 1; duration: 500; }
            RotationAnimation {
                loops: Animation.Infinite;
                target: imgRainbow; property: "rotation"; from: 0 ;to : 360; duration: 700;
            }
        }
    }
    SequentialAnimation {
        id: stopScan
        ParallelAnimation {
            NumberAnimation { targets: img1; property: "anchors.topMargin";     to : 100; duration: 200; }
            NumberAnimation { targets: img2; property: "anchors.bottomMargin";  to: 100; duration: 200; }
            NumberAnimation { targets: img3; property: "anchors.leftMargin";    to: 100; duration: 200; }
            NumberAnimation { targets: img4; property: "anchors.rightMargin";   to: 100; duration: 200; }
            NumberAnimation { targets: [img1, img2, img3, img4, lbPercentage,
                    lbScanningTitle, lbAppName, imgRotation, btnStopScan]; property: "opacity" ; to : 0; duration: 200; }
            NumberAnimation { targets: [imgRotation]; property: "opacity" ; to : 0; duration: 600; }
        }
        PropertyAnimation {
            target: loader;
            property: "source";
            to : "Dashboard.qml";
            duration: 0;
        }
    }

}
