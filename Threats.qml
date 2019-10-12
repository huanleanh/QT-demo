import QtQuick 2.12
import QtCharts 2.3
import QtQuick.Controls 2.5
import "variables.js" as VARIABLES
import "functions.js" as MyScript

Page {
    visible: true
    width: 1280//mainWindow.width
    height: 900 //mainWindow.height;
    //anchors.fill: parent
    property int filesProcessed: 100;
    property int criticalThreats: 4;
    property int generalThreats: 20;
    property int cleanFiles: 80
    property string randomColor: ""


    //Chart
    ChartView {
        id: chart
        width: parent.width * 0.15;
        height: parent.width * 0.15;
        anchors.top: menu.bottom
        legend.visible: false
        antialiasing: true

        PieSeries {
            id: pieOuter
            size: 1
            holeSize: 0.9
            //PieSlice { id: slice; label: "File Processed"; value: 19511; color: "#99CA53"; }
            PieSlice {value: criticalThreats; color: VARIABLES.COLOR_MAIN }
            PieSlice {value: generalThreats; color: VARIABLES.COLOR_ORANGE }
            PieSlice {value: cleanFiles; color: "lightgrey" }
        }

    }
    Component.onCompleted: {
        // Set the common slice properties dynamically for convenience
        for (var i = 0; i < pieOuter.count; i++) {
            pieOuter.at(i).borderWidth = 2;
        }
    }

    //List View
    Rectangle {
        id: details
        width: parent.width - 100;
        height: 432 //fileDetails.height * listView.count + (listView.count - 1) * listView.spacing;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 50;
        anchors.left: parent.left;
        anchors.leftMargin: 50;
        color: "lightsteelblue";
        ListView {
            id: listView;
            anchors.fill: parent;
            model: Files {}
            delegate: fileDelegate;
            spacing: 2;
            clip: true;
            //snapMode: ListView.SnapOneItem;
        }
    }

    // 1 Item
    Component {
        id: fileDelegate
        Column{
            id: column
            width: parent.width
            height: 60;
            state: "OFF"
            Rectangle {
                id: fileDetails
                width: parent.width
                height: 60
                MouseArea {
                    anchors.fill: fileDetails
                    hoverEnabled: true
                    onEntered: {
                        randomColor = Qt.rgba(Math.random(),Math.random(), Math.random(), 1);
                        nameField.color = randomColor;
                    }
//                    onClicked: {
//                        randomColor = Qt.rgba(Math.random(),Math.random(), Math.random(), 1);
//                        nameField.color = randomColor;

//                        column.height = detailItem.visible ? fileDetails.height : fileDetails.height + detailItem.height;
//                        detailItem.visible = !detailItem.visible;
//                        //drawer.open();
//                    }
                    onExited: {
                        nameField.color = "white";
                    }
                }
                Row {
                    width: parent.width
                    height: parent.height
                    Rectangle {
                        id: nameField
                        width: parent.width*0.25;
                        height: parent.height;
                        Text { text: name;
                            anchors.left: parent.left;
                            anchors.verticalCenter: parent.verticalCenter;
                            anchors.leftMargin: 10;
                            width: parent.width;
                            elide : Text.ElideRight;
                        }
                        Behavior on color{
                            ColorAnimation { duration: 300;}
                        }
                    }
                    Rectangle {
                        id: infectionField
                        width: parent.width*0.1
                        height: parent.height;
                        Text { text: infection;
                            anchors.left: parent.left;
                            anchors.verticalCenter: parent.verticalCenter;
                            anchors.leftMargin: 10;
                            width: parent.width;
                            elide : Text.ElideRight;
                        }
                        Behavior on color{
                            ColorAnimation { duration: 300;}
                        }
                    }
                    Rectangle {
                        id: pathField
                        width: parent.width*0.3
                        height: parent.height;
                        Behavior on color{
                            ColorAnimation { duration: 300;}
                        }
                        Text { text:path;
                            anchors.left: parent.left;
                            anchors.verticalCenter: parent.verticalCenter;
                            anchors.leftMargin: 10;
                            width: parent.width;
                            elide : Text.ElideRight;
                        }

                    }
                    Rectangle {
                        id: encryptField
                        width: parent.width*0.25
                        height: parent.height;
                        Text { text: encrypt;
                            anchors.left: parent.left;
                            anchors.verticalCenter: parent.verticalCenter;
                            anchors.leftMargin: 10;
                            width: parent.width;
                            elide : Text.ElideRight;
                        }
                        Behavior on color{
                            ColorAnimation { duration: 300;}
                        }
                    }
                    Rectangle {
                        id: copyField
                        width: parent.width*0.05
                        height: parent.height;
                        Text { text: "A";
                            anchors.centerIn: parent;
                        }
                        MouseArea {
                            anchors.fill: parent;
                            //hoverEnabled: true;
                            onClicked: {
                                randomColor = Qt.rgba(Math.random(),Math.random(), Math.random(), 1);
                                nameField.color = randomColor;

                                //column.height = detailItem.visible ? fileDetails.height : fileDetails.height + detailItem.height;
                                column.state = detailItem.visible ? "OFF" : "ON";
                            }
                        }
                        Behavior on color{
                            ColorAnimation { duration: 300;}
                        }
                    }
                    Rectangle {
                        id: addField
                        width: parent.width*0.05
                        height: parent.height;
                        Text { text: "B";
                            anchors.centerIn: parent
                        }
                        Behavior on color{
                            ColorAnimation { duration: 300;}
                        }
                    }
                }
            }
            Rectangle {
                id: detailItem
                width: parent.width;
                height: 100;
                color: "red";
                visible: false;
                opacity: 0;
                MouseArea {
                    anchors.fill: parent;
                    onClicked: {
                        popup.open();
                    }
                }
            }
            states: [
                State { name: "OFF" },
                State { name: "ON" }
            ]
            transitions: [
                Transition {
                    from: "OFF";
                    to: "ON";
                    SequentialAnimation {
                        id: openDetail
                        PropertyAnimation { target: detailItem; properties: "visible"; to: true; duration: 1 }
                        ParallelAnimation{
                            NumberAnimation { target: column; properties: "height"; to: 160; duration: 300; }
                            NumberAnimation { target: detailItem; properties: "opacity"; to: 1 ; easing.type: Easing.InCubic; duration: 300}
                        }
                    }
                },
                Transition {
                    from: "ON";
                    to: "OFF";
                    SequentialAnimation {
                        id: closeDetail
                        ParallelAnimation{
                            NumberAnimation { target: column; properties: "height"; to: 60 ; duration: 300}
                            NumberAnimation { target: detailItem; properties: "opacity"; to: 0 ; easing.type: Easing.OutCubic; duration: 300}
                        }
                        PropertyAnimation { target: detailItem; properties: "visible"; to: false; duration: 1 }
                    }
                }
            ]
        }
    }

    Menu_style_2{
        id: menu
    }
    Popup {
        id: popup
        anchors.centerIn: parent
        width: parent.width/2;
        height: parent.height/2;
        modal: true;
//        background: BorderImage {
//            source: VARIABLES.SRC_IMG_SCANNING;
//        }

        Column {
            anchors.fill: parent
            ItemDelegate {
                text: qsTr("Page 1")
                width: parent.width
                onClicked: {
                    popup.close()
                }
            }
            ItemDelegate {
                text: qsTr("Page 2")
                width: parent.width
                onClicked: {
                    popup.close()
                }
            }
            ItemDelegate {
                text: qsTr("Page 3")
                width: parent.width
                onClicked: {
                    popup.close()
                }
            }
            ItemDelegate {
                text: qsTr("Page 4")
                width: parent.width
                onClicked: {
                    popup.close()
                }
            }
            ItemDelegate {
                id: item5
                text: qsTr("Page 5")
                width: parent.width
                visible: false
                onClicked: {
                    item5.visible = false;
                    //drawer.close()
                }
            }
            ItemDelegate {
                text: qsTr("Page 6")
                width: parent.width
                onClicked: {
                    item5.visible = true;
                    //drawer.close()
                }
            }
        }
    }
}


