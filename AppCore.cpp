#include "AppCore.h"
#include <QFile>
#include <QDebug>
#include <QSettings>
#include <QtSql/QSqlError>

AppCore::AppCore(QObject *parent) : QObject(parent)
{
  LoadSettings();
}

AppCore::~AppCore()
{
  SaveSettings();
}

void AppCore::LoadSettings()
{
  QSettings settings("./LApp.ini", QSettings::IniFormat);
  config_.logName = settings.value("logger_name").toString();
  ClearLogFile();
  settings.beginReadArray("Recent_Databases");
  for (int i = 0; i < 3; ++i)
  {
    settings.setArrayIndex(i);
    auto name = settings.value("database_name", "none").toString();//the fuck><
    if (name == "") name = "none";
    config_.recentDatabases.push_back(name);
  }
  settings.endArray();
}

void AppCore::SaveSettings()
{
  QSettings settings("./LApp.ini", QSettings::IniFormat);
  settings.beginWriteArray("Recent_Databases");
  for (int i = 0; i < 3; ++i)
  {
    settings.setArrayIndex(i);
    settings.setValue("database_name", config_.recentDatabases.at(i));
  }
  settings.endArray();
}

void AppCore::ClearLogFile()
{
  QFile outFile(config_.logName);
  outFile.open(QIODevice::WriteOnly | QIODevice::Append);
  outFile.resize(0);
}

QString AppCore::getRecentDatabaseName(int index)
{
  QString name = config_.recentDatabases.at(index);
  if (name == "none")
    return name;
  QStringList parts = name.split('/');
  name = parts.last();
  name.remove(name.size() - 5, name.size());//remove '.s3db'
  return name;
}

QString AppCore::getRecentDatabasePath(int index)
{
  QString path = config_.recentDatabases.at(index);
  return path;
}

void AppCore::openDatabase(QUrl databaseURL)
{
  if (legoBase_.open())
    legoBase_.close();

  if (databaseURL.path() == "")
  {
    qDebug() << "Failed to get name of database";
    return;
  }

  config_.recentDatabases.push_front(databaseURL.path());
  config_.recentDatabases.pop_back();

  LoadDatabase(databaseURL.path());
  PreloadFirstDetails();
}

void AppCore::LoadDatabase(QString path)
{
  legoBase_ = QSqlDatabase::addDatabase("QSQLITE");
  legoBase_.setDatabaseName(path);
  if (!legoBase_.open())
  {
    QSqlError err;
    err = legoBase_.lastError();
    qDebug() << "Can`t open database. Error:" << err;
  }

  QStringList list;
}

void AppCore::openRecentDatabase(int index)
{
  QString path;
  if (index != 0)
  {
    auto iter = config_.recentDatabases.begin() + index;
    path = config_.recentDatabases.at(index);
    config_.recentDatabases.erase(iter);
    config_.recentDatabases.push_front(path);
  }

  LoadDatabase(path);
  PreloadFirstDetails();
}

void AppCore::PreloadFirstDetails()
{
  QStringList list;
  emit sendDetails(list);
}
