#ifndef LOGGER_H
#define LOGGER_H
#include <QtGlobal>
#include <QtDebug>
#include <QMutex>
#include <QDateTime>
#include <QFile>
#include <QTextStream>
#include <QMutexLocker>

static QMutex mutex;

//QMsgType: QtDebugMsg, QtInfoMsg, QtWarningMsg, QtCriticalMsg
void MessageHandler(QtMsgType type, const QMessageLogContext & context, const QString & msg)
{
  QMutexLocker locker(&mutex);

  QDateTime dateTime(QDateTime::currentDateTime());

  QString timeStr(dateTime.toString("dd-MM-yyyy HH:mm:ss:zzz"));
  QString contextString(QString("(%1, %2)").arg(context.file).arg(context.line));

  QFile outFile("LApp.log");
  outFile.open(QIODevice::WriteOnly | QIODevice::Append);

  QTextStream stream(&outFile);
  stream << timeStr << " ";
  switch (type)
  {
  case QtDebugMsg:
    stream << "[DEBUG] ";
    break;
  case QtWarningMsg:
    stream << "[WARNING] ";
    break;
  case QtInfoMsg:
    stream << "[INFO] ";
    break;
  default:
    stream << "[DEFAULT] ";
  }

  stream << contextString << ": " << msg << endl;
}

void clearLogger()
{
  QFile outFile("LApp.log");
  outFile.resize(0);
}

#endif // LOGGER_H
