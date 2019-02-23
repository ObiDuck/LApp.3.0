#pragma once

#include <QObject>
#include <QQmlContext>
#include <QtSql/QSqlDatabase>

struct AppConfig
{
  QStringList recentDatabases;
  QString logName;
};

class AppCore : public QObject
{
  Q_OBJECT
public:
  explicit AppCore(QObject *parent = nullptr);
  ~AppCore();
signals:
  void sendDetails(QStringList details);
public slots:
  void openDatabase(QUrl databaseURL);
  void openRecentDatabase(int index);
  QString getRecentDatabaseName(int index);
  QString getRecentDatabasePath(int index);
private:
  void LoadSettings();//Загрузка данных из файла при первом вызове
  void SaveSettings();//Сохранение данных в файл при закрытии программы
  void ClearLogFile();//Очистить лог файл перед началом работы
  void LoadDatabase(QString path);
  void PreloadFirstDetails();
  AppConfig config_;//Структура конфигурации приложения
  QSqlDatabase legoBase_;
};

