import QtQuick 2.0
import QtQuick.Controls 2.5

Drawer {
    id: drawer1
    width: 400
    height: 400

    Column {
        anchors.fill: parent

        ItemDelegate {
            text: qsTr("Page 1")
            width: parent.width
        }
        ItemDelegate {
            text: qsTr("Page 2")
            width: parent.width
        }
    }
}
