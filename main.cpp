#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "logger.h"
#include "AppCore.h"

typedef std::shared_ptr<QQmlContext> ContextPtr;

int main(int argc, char *argv[])
{
  qInstallMessageHandler(MessageHandler);
  QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
  QGuiApplication app(argc, argv);

  AppCore appCore;
  QQmlApplicationEngine engine;

  //указываем контекст и передаём в базовый класс
  QQmlContext* context = engine.rootContext();
  context->setContextProperty("appCore", &appCore);
  engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

  return app.exec();
}
