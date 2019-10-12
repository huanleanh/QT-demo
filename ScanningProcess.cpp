#include "ScanningProcess.h"
#include "..\..\gears-service\GearsContract.h"
using namespace maf::messaging::ipc;
using namespace maf::messaging;

class ScanRequestMessage :public maf::messaging::InternalMessage {
};

ScanningProcess* ScanningProcess::m_instance = nullptr;

ScanningProcess::ScanningProcess() {
    onSignal<ScanRequestMessage>([this] {
        _scanrequestId = _serviceProxy->sendRequest<ScanningStatus::Result>(ScanningStatus::makeRequest(), [this](const std::shared_ptr<ScanningStatus::Result>& status) {
            _scanningValue = status->percentage();
			emit resultReady(_scanningValue);
			});
		});
    run();
}

ScanningProcess* ScanningProcess::getInstance() {
    if (!m_instance)
	{
		m_instance = new ScanningProcess();
	}
    return m_instance;
}

void ScanningProcess::onEntry()
{
    _serviceProxy = LocalIPCServiceProxy::createProxy(SERVICE_ID_SCANNING_SERVICE);
}

void ScanningProcess::onExit()
{

}
void ScanningProcess::startWork() {
    postMessage<ScanRequestMessage>();
}
