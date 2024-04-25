// #ifdef QT_QML_DEBUG
// #endif

#include <QtQuick>

#include <QtGui/QGuiApplication>
#include <QtQuick/QQuickView>
#include <sailfishapp.h>
#include <QtQml/qqml.h>

#include <QtDebug>
#include <QFile>
#include <QTextStream>
#include <QDateTime>
#include <QCommandLineOption>

#include <stdlib.h>

int main(int argc, char *argv[])
{
    QScopedPointer<QGuiApplication> app(SailfishApp::application(argc, argv));
    QLocale locRus("ru_RU");
    QLocale::setDefault(locRus);

    QScopedPointer<QQuickView> view(SailfishApp::createView());
    view->setSource(SailfishApp::pathTo(QStringLiteral("qml/AuroraModuleExample.qml")));
    view->show();

    return app->exec();
}
