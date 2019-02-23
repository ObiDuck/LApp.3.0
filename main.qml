import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.12

ApplicationWindow
{
  id: rootWindow
  visible: true
  minimumWidth: Screen.desktopAvailableWidth
  minimumHeight: Screen.desktopAvailableHeight
  modality: Qt.WindowModal
  flags: Qt.FramelessWindowHint | Qt.WindowMinimizeButtonHint | Qt.Window | Qt.WindowMaximizeButtonHint | Qt.MaximizeUsingFullscreenGeometryHint
  //загружаем шрифт для использования в текстах
  FontLoader { id: robotoFont; source: "qrc:/roboto.regular.ttf" }

  //обработка сигналов от приложения
  Connections
  {
    target: appCore
    //вывод сообщений
    onSendDetails:
    {
      shadowRect.visible = false
      rectangleMainShadow.visible = false
      rectangleMain.visible = false
    }
  }

  //Кастомная "верхняя" панель управления (свернуть\закрыть)
  WindowControls
  {
    id: windowControlBar;
    backColor: "#FBC02D";
    width: parent.width;
    height: 36;
    anchors.right: parent.right;
    anchors.top: parent.top
    border.width: 1
    border.color: "black"
  }
  //Панель управления
  MyToolBar
  {
    backColor: "#FFEB3B";
    width: parent.width;
    height: 36;
    anchors.top: windowControlBar.bottom
  }
  //Серый прямоугольник для закрытия фона при открытии
  Rectangle
  {
    id: shadowRect
    color: "grey"
    opacity: 0.5
    width: parent.width
    height: parent.height - windowControlBar.height
    anchors.bottom: parent.bottom
    PropertyAnimation
    {
      target: shadowRect
      properties: "opacity"
      from: 0
      to: 0.5
      duration: 1000
      running: true
    }
  }
  FirstRectangle
  {
    id: rectangleMain
    width: rootWindow.width / 3
    height: rootWindow.height / 3
    color: "#FFEB3B"
    x: rootWindow.width / 3
    y: rootWindow.height / 3
    PropertyAnimation
    {
      target: rectangleMain
      property: "opacity"
      from: 0
      to: 1
      duration: 500
      running: true
    }
  }
  //Тень для прямоугольника
  DropShadow
  {
    id: rectangleMainShadow
    anchors.fill: rectangleMain
    horizontalOffset: 1
    verticalOffset: 1
    radius: 8.0
    samples: 171
    color: "#80000000"
    source: rectangleMain
  }
}
