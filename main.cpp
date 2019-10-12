#include <QQmlApplicationEngine>
#include <QApplication>
#include <QTranslator>
#include <QGuiApplication>
#include <QInputDialog>
#include <Controller.h>
#include <qqmlcontext.h>
#include <maf/messaging/client-server/ipc/LocalIPCClient.h>
#include "..\..\gears-service\GearsContract.h"

using namespace maf::messaging::ipc;
using namespace maf::messaging;

int main(int argc, char *argv[])
{
	LocalIPCClient::instance().init(Address{ SERVER_DOMAIN_NAME, 0 });

    QApplication app(argc, argv);
   //QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    QQmlContext* context = engine.rootContext();

	//ScanningProcess process;
	//Controller controller;
	Controller* controllerDashboard = new Controller();
    context->setContextProperty("controllerDashboard", controllerDashboard);

	//Controller* controllerScanning = new Controller();
	//context->setContextProperty("controllerScanning", controllerScanning);
 //   
 //   QTranslator translator;
 //   QStringList languages;
	//languages << "English" << "Vietnamese";
 //   QString lang = QInputDialog::getItem(NULL, "Select Language", "Language", languages );
 //   if (lang == "Vietnamese"){
 //       translator.load(":/Vietnamese.qm");
 //       //guiTranslator.load("");
 //   }
 //   if (lang != "English"){
 //       app.installTranslator(&translator);
 //   }

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();

}
