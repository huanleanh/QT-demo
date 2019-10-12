import QtQuick 2.0
import QtCharts 2.0
import QtQuick.Controls 2.5
import "variables.js" as VARIABLES

Page {
    visible: true
    width: mainWindow.width
    height: mainWindow.height;
    //anchors.fill: parent

    ChartView {
        id: chart
        title: "Production costs"
        width: parent.width*0.6;
        height: parent.height*0.8;
        anchors.centerIn: parent
        legend.visible: false
        antialiasing: true

        PieSeries {
            id: pieOuter
            size: 0.9
            holeSize: 0.7
            PieSlice { id: slice; label: "Alpha"; value: 19511; color: "#99CA53"; }
            PieSlice { label: "Epsilon"; value: 11105; color: "#209FDF" }
            PieSlice { label: "Psi"; value: 9352; color: "#F6A625" }
        }

        PieSeries {
            size: 0.7
            id: pieInner
            holeSize: 0.15;

            PieSlice { id: materials1; label: "Materials"; value: 10334; color: "#B9DB8A" }
            PieSlice { id: employee1; label: "Employee"; value: 3066; color: "#DCEDC4" }
            PieSlice { id: logistics1; label: "Logistics"; value: 6111; color: "#F3F9EB" }

            PieSlice { id: materials2; label: "Materials"; value: 7371; color: "#63BCE9" }
            PieSlice { id: employee2; label: "Employee"; value: 2443; color: "#A6D9F2" }
            PieSlice { id: logistics2; label: "Logistics"; value: 1291; color: "#E9F5FC" }

            PieSlice { id: materials3; label: "Materials"; value: 4022; color: "#F9C36C"; }
            PieSlice { id: employee3; label: "Employee"; value: 3998; color: "#FCE1B6" }
            PieSlice { id: logistics3; label: "Logistics"; value: 1332; color: "#FEF5E7" }
        }
        MouseArea {
            anchors.fill: parent;
            hoverEnabled: true;
            onClicked: {
                for (var i = 0; i < pieInner.count; i++) {
                   pieInner.at(i).labelVisible = false;
                }
                sequent.start();
            }
            SequentialAnimation{
                id: sequent
                running: true
                ParallelAnimation {
                    id: rotateCircle
                    NumberAnimation {
                        id: chartStartAngle
                        targets: [pieOuter, pieInner]
                        properties: "startAngle";
                        from : 0;
                        to: 360
                        duration: 3000
                    }
                    NumberAnimation {
                        id: chartEndAngle
                        targets: [pieOuter, pieInner]
                        properties: "endAngle";
                        from: 0;
                        to : 720;
                        duration: 3000
                    }
                }
                PropertyAnimation { target: materials1; properties: "labelVisible"; to: true; duration: 100; }
                PropertyAnimation { target: employee1;  properties: "labelVisible"; to: true; duration: 100; }
                PropertyAnimation { target: logistics1; properties: "labelVisible"; to: true; duration: 100; }
                PropertyAnimation { target: materials2; properties: "labelVisible"; to: true; duration: 100; }
                PropertyAnimation { target: employee2;  properties: "labelVisible"; to: true; duration: 100; }
                PropertyAnimation { target: logistics2; properties: "labelVisible"; to: true; duration: 100; }
                PropertyAnimation { target: materials3; properties: "labelVisible"; to: true; duration: 100; }
                PropertyAnimation { target: employee3;  properties: "labelVisible"; to: true; duration: 100; }
                PropertyAnimation { target: logistics3; properties: "labelVisible"; to: true; duration: 100; }
            }
        }
    }
    Component.onCompleted: {
        // Set the common slice properties dynamically for convenience
        for (var i = 0; i < pieOuter.count; i++) {
            pieOuter.at(i).labelPosition = PieSlice.LabelOutside;
            pieOuter.at(i).labelVisible = true;
            pieOuter.at(i).borderWidth = 2;
        }
        for (var i = 0; i < pieInner.count; i++) {
            pieInner.at(i).labelPosition = PieSlice.LabelInsideNormal;
           pieInner.at(i).labelVisible = false;
            pieInner.at(i).borderWidth = 2;
        }
    }
    Menu_style_2{

    }
}
