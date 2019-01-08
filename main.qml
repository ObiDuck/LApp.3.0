import QtQuick 2.12
import QtQuick.Window 2.12
//import "WindowControls.qml" as WindowControl

Window {
  id: rootWindow
  visible: true
  minimumWidth: Screen.desktopAvailableWidth
  minimumHeight: Screen.desktopAvailableHeight
  visibility: Window.FullScreen
  flags: Qt.FramelessWindowHint | Qt.WindowMinimizeButtonHint | Qt.Window | Qt.WindowMaximizeButtonHint | Qt.MaximizeUsingFullscreenGeometryHint

  //TIle2x1H { itemSize: 48; x: 400; y: 400 }
  WindowControls { color: "#FBC02D"; width: parent.width; height: 36 ; anchors.right: parent.right; anchors.top: parent.top }
}
