import QtQuick 2.12

Rectangle {
  property real mySize : 48
  id: rootTile
  width: mySize
  height: mySize / 2
  color: "green"
  border.color: "black"
  border.width: 1

  Rectangle {
    id: studLeft
    radius: rootTile.height * 0.6
    width: rootTile.height * 0.6
    height: rootTile.height * 0.6
    border.color: "black"
    border.width: 1

    color: parent.color
    anchors.left: rootTile.left
    anchors.leftMargin: rootTile.height * 0.25
    anchors.verticalCenter: rootTile.verticalCenter
  }

  Rectangle {
    id: studRight
    radius: rootTile.height * 0.6
    width: rootTile.height * 0.6
    height: rootTile.height * 0.6
    border.color: "black"
    border.width: 1

    color: parent.color
    anchors.right: rootTile.right
    anchors.rightMargin: rootTile.height * 0.25
    anchors.verticalCenter: rootTile.verticalCenter
  }

}

