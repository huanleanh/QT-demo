import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3
import QtQuick.Controls.Styles 1.4
import QtCharts 2.3
import "variables.js" as VARIABLES


ApplicationWindow {
    id: mainWindow
    visible: true;
    width: 1280;
    height: 900;
    title: VARIABLES.STR_TITLE_APP;
    //flags: Qt.FramelessWindowHint;
    //flags: Qt.WindowCloseButtonHint;

    Loader {
        id: loader
        source: "Threats.qml";
    }
}
