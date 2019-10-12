import QtQuick 2.0
import QtCharts 2.3
import QtQuick.Controls 2.5
import "functions.js" as MyScript

Page {
    visible: true
    width: mainWindow.width
    height: mainWindow.height
    // anchors.fill: parent
    ChartView {
        id: chart
        title: "Top-5 car brand shares in Finland"
        width: parent.width*0.7;
        height: parent.height*0.7;
        anchors.centerIn: parent;
        antialiasing: true

        PieSeries {
            id: pieSeries
            PieSlice { id: piece1; label: "Infected"; value: 25 ; color: "red";
                onClicked: {
                   MyScript.onClickedPieChart(this);
                }
            }
            PieSlice { id: piece2; label: "Suspicious"; value: 35; color: "orange";
                onClicked: {
                    MyScript.onClickedPieChart(this);
                }
            }
            PieSlice { id: piece3; label: "Clean"; value: 35 ; color: "green";
                onClicked: {
                    MyScript.onClickedPieChart(this);
                }
            }
            PieSlice { id: piece4; label: "Mismatched"; value: 5; color: "grey";
                onClicked: {
                    MyScript.onClickedPieChart(this);
                }
            }
            onClicked: {
                controllerScanning.onClicked();
            }
        }
        SequentialAnimation {
            id: rotate;

            ParallelAnimation {
                PropertyAnimation {
                    id: chartEndAngle; target: pieSeries; property: "endAngle"; duration: 1000;
                }
                PropertyAnimation {
                    id: chartStartAngle; target: pieSeries; property: "startAngle"; duration: 1000;
                }
            }
            PropertyAnimation {
                id: specPiece2; property: "exploded"; to: true; duration: 200;
            }
        }
        PropertyAnimation {
            id: specPiece1; property: "exploded"; to: false; duration: 200;
        }
    }
    Menu_style_2{

    }
}
