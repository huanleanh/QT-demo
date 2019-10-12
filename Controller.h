#include <qobject.h>
#include <ScanningProcess.h>
#include <maf/messaging/client-server/ipc/LocalIPCServiceProxy.h>
#include <maf/messaging/Component.h>

class Controller : public QObject
{
	Q_OBJECT
    QThread workerThread;
    Q_PROPERTY(QString scanningValue READ getScanningValue NOTIFY scanningValueChanged)
private:
	int _scanningValue = 0;
    std::shared_ptr<maf::messaging::ipc::LocalIPCServiceProxy> _serviceProxy;

public:
	Controller();
	~Controller();
    QString getScanningValue();

public slots:
	void setScanningValue(int value);
    void onClicked();

signals:
    void scanningValueChanged();
	void operate();
};
