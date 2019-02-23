import QtQuick 2.12
import QtQuick.Controls 2.5

Rectangle {
  property string backColor: "white"
  width: 150
  height: 150
  color: backColor

  Button {
    id: hideButton
    width: parent.height
    height: parent.height
    anchors.right: closeButton.left
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 2
    anchors.rightMargin: 4
    background: Tile2x1H { color: backColor; itemSize: parent.height - border.width - border.width; itemColor: "orange"; anchors.bottom: parent.bottom}
    //background: Rectangle {color: "red"}
    onClicked: rootWindow.showMinimized()
  }

  Button {
    id: closeButton
    width: parent.height
    height: parent.height
    anchors.right: parent.right
    anchors.rightMargin: 4
    anchors.top:  parent.top
    background: PlusIcon { itemSize: parent.height - border.width - border.width; itemColor: "red"; rotation: 45}
    onClicked: rootWindow.close()
  }
}
