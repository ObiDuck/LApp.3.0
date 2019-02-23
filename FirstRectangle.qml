import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.12
import Qt.labs.platform 1.1

//Начальный прямоугольник с первым меню
Rectangle
{
  id: buttonsRect
  width: 400
  height: 400
  color: "#FFEB3B"
  x: 0
  y: 0
  radius: 4
  border.width: 1
  border.color: "black"

  FileDialog {
    id: fileDialog
    title: "Open database"
    folder: "./"
    onAccepted: {
      appCore.openDatabase(fileDialog.file)
    }
    nameFilters: ["SQLite database (*.s3db)"]
    parentWindow: rootWindow
    modality: Qt.WindowModal
  }

  //Кнопка открытия БД
  Button
  {
    id: recentDBtop
    anchors.right: buttonsRect.right
    anchors.rightMargin: ((buttonsRect.width/2) - width) / 2 //просто вычисляю серединку
    anchors.top: buttonsRect.top
    anchors.topMargin: ((5.0 / 8.0) * buttonsRect.height) / 4
    width: backgroundRectTop.width
    height: backgroundRectTop.height
    enabled: (backgroundRectTop.textValue == "none") ? false : true
    background: OpenRecentDatabase
    {
      id: backgroundRectTop
      anchors.verticalCenter: parent.verticalCenter
      anchors.horizontalCenter: parent.horizontalCenter
      height: buttonsRect.height / 8
      width: (buttonsRect.width/2)* 0.6
      textValue: appCore.getRecentDatabaseName(0)
      itemEnabled: (backgroundRectTop.textValue != "none")
    }
    onClicked: appCore.openRecentDatabase(0)
  }
  Text
  {
    anchors.left: recentDBtop.left
    anchors.top: recentDBtop.bottom
    text: appCore.getRecentDatabasePath(0)
    font: robotoFont.name
  }

  //Кнопка открытия БД
  Button
  {
    id: recentDBmiddle
    anchors.right: buttonsRect.right
    anchors.rightMargin: ((buttonsRect.width/2) - width) / 2 //просто вычисляю серединку
    anchors.top: recentDBtop.bottom
    anchors.topMargin: ((5.0 / 8.0) * buttonsRect.height) / 4
    width: backgroundRectMiddle.width
    height: backgroundRectMiddle.height
    enabled: (backgroundRectMiddle.textValue == "none") ? false : true
    background: OpenRecentDatabase
    {
      id: backgroundRectMiddle
      anchors.verticalCenter: parent.verticalCenter
      anchors.horizontalCenter: parent.horizontalCenter
      height: buttonsRect.height / 8
      width: (buttonsRect.width/2)* 0.6
      textValue: appCore.getRecentDatabaseName(1)
      itemEnabled: (backgroundRectMiddle.textValue != "none")
    }
    onClicked: appCore.openRecentDatabase(1)
  }
  Text
  {
    anchors.left: recentDBmiddle.left
    anchors.top: recentDBmiddle.bottom
    text: appCore.getRecentDatabasePath(1)
    font: robotoFont.name
  }

  //Кнопка открытия БД
  Button
  {
    id: recentDBbottom
    anchors.right: buttonsRect.right
    anchors.rightMargin: ((buttonsRect.width/2) - width) / 2 //просто вычисляю серединку
    anchors.top: recentDBmiddle.bottom
    anchors.topMargin: ((5.0 / 8.0) * buttonsRect.height) / 4
    width: backgroundRectBottom.width
    height: backgroundRectBottom.height
    enabled: (backgroundRectBottom.textValue == "none") ? false : true
    background: OpenRecentDatabase
    {
      id: backgroundRectBottom
      anchors.verticalCenter: parent.verticalCenter
      anchors.horizontalCenter: parent.horizontalCenter
      height: buttonsRect.height / 8
      width: (buttonsRect.width/2)* 0.6
      textValue: appCore.getRecentDatabaseName(2)
      itemEnabled: (backgroundRectBottom.textValue != "none")
    }
    onClicked: appCore.openRecentDatabase(2)
  }
  Text
  {
    anchors.left: recentDBbottom.left
    anchors.top: recentDBbottom.bottom
    text: appCore.getRecentDatabaseName(2)
    font: robotoFont.name
  }

  //Разделитель для кнопок между новой базой и последними
  Rectangle
  {
    id: buttonsDivider
    width: 1
    height: parent.height * 0.6
    anchors.verticalCenter: parent.verticalCenter
    color: "#757575"
    anchors.horizontalCenter: parent.horizontalCenter
  }
  //Кнопка открытия БД
  Button
  {
    id: buttonOpenNewDB
    anchors.left: buttonsRect.left
    anchors.leftMargin: ((buttonsRect.width/2) - width) / 2 //просто вычисляю серединку
    anchors.verticalCenter: buttonsRect.verticalCenter
    width: newDBbackground.width

    height: newDBbackground.height
    background: OpenNewDatabaseButton
    {
      id: newDBbackground
      anchors.verticalCenter: parent.verticalCenter
      anchors.horizontalCenter: parent.horizontalCenter
      itemSize: buttonsRect.height / 8
    }
    onClicked: fileDialog.open()
  }
}
