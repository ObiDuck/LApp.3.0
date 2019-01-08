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

  WindowControls { id: windowControlBar; backColor: "#FBC02D"; width: parent.width; height: 36 ; anchors.right: parent.right; anchors.top: parent.top }
  ToolBar { backColor: "#FFEB3B"; width: parent.width; height: 36; anchors.top: windowControlBar.bottom }
}
