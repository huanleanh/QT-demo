#include "Controller.h"
#include "..\..\gears-service\GearsContract.h"

using namespace maf::messaging::ipc;
using namespace maf::messaging;

Controller::Controller() {
	
	//process->moveToThread(&workerThread);
	/*connect(&workerThread, SIGNAL(finished()), process, SLOT(deleteLater()));*/
	/*connect(this, SIGNAL(operate()), process, SLOT(startWork()));
	connect(process, SIGNAL(resultReady(QString)), this, SLOT(setScanningValue(QString)));*/
	//workerThread.start();
}

Controller::~Controller() {
	workerThread.quit();
    workerThread.wait();
}

void Controller::onClicked() {
	ScanningProcess* process = ScanningProcess::getInstance();
	/*process->moveToThread(&workerThread);
	connect(&workerThread, SIGNAL(finished()), process, SLOT(deleteLater()));*/
	connect(this, SIGNAL(operate()), process, SLOT(startWork()));
	connect(process, SIGNAL(resultReady(int)), this, SLOT(setScanningValue(int)));
	emit operate();
}

void Controller::setScanningValue(int value){
    _scanningValue = value;
    emit scanningValueChanged();
}

QString Controller::getScanningValue()
{
    return  QString::fromStdString(std::to_string(_scanningValue) + "%");
}
