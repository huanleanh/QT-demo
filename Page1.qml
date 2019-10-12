import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3

Page {
    id: page
    visible: true
    width:  mainWindow.width
    height: mainWindow.height;
    //anchors.fill: parent
    property string randomColor: ""
    Rectangle {
        anchors.centerIn: parent
        width: parent.width/2;
        height: parent.height/2;
        color: "lightsteelblue";
        ListView {
            width: parent.width;
            height: parent.height;
            model: Files {}
            delegate: fileDelegate;
            spacing: 5;
        }
    }
    Component {
        id: fileDelegate
        Rectangle {
            id: wrapper
            width: parent.width
            height: 50
            Row {
                width: parent.width
                height: parent.height
                Rectangle {
                    id: nameField
                    width: parent.width*0.25
                    height: parent.height;
                    Text { text: '<b>Name:</b> ' + name }                    
                    Behavior on color{
                        ColorAnimation { duration: 500;}
                    }
                }
                Rectangle {
                    id: infectionField
                    width: parent.width*0.2
                    height: parent.height;
                    Text { text: '<b>Infection:</b> ' + infection }
                    Behavior on color{
                        ColorAnimation { duration: 500;}
                    }
                }
                Rectangle {
                    id: pathField
                    width: parent.width*0.3
                    height: parent.height;
                    Behavior on color{
                        ColorAnimation { duration: 500;}
                    }
                    Text { text: '<b>Path:</b> ' + path }

                }
                Rectangle {
                    id: encryptField
                    width: parent.width*0.25
                    height: parent.height;
                    Text { text: '<b>Encrypt:</b> ' + encrypt } 
                    Behavior on color{
                        ColorAnimation { duration: 500;}
                    }
                }
            }
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    randomColor = Qt.rgba(Math.random(),Math.random(), Math.random(), 1);
                    nameField.color = randomColor;
                    infectionField.color = randomColor;
                    pathField.color = randomColor;
                    encryptField.color = randomColor;
                }
                onClicked: {
                    randomColor = Qt.rgba(Math.random(),Math.random(), Math.random(), 1);
                    nameField.color = randomColor;
                    infectionField.color = randomColor;
                    pathField.color = randomColor;
                    encryptField.color = randomColor;
                }
            }
        }
    }

    Button {
        id: btnUpgrade
        text: "QUICK SCAN"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 70
        anchors.horizontalCenter: parent.horizontalCenter
        highlighted: true
        Material.accent: Material.Blue
    }
    Menu_style_2{

    }
}


