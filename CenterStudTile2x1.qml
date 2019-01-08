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
    id: studCenter
    radius: parent.height * 0.6
    width: parent.height * 0.6
    height: parent.height * 0.6
    border.color: "black"
    border.width: 1

    color: parent.color
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter

    Rectangle {
      id: studRight
      radius: rootTile.radius * 0.8
      width: rootTile.height * 0.8
      height: rootTile.height * 0.8
      border.color: "black"
      border.width: 1

      color: parent.color
      anchors.horizontalCenter: parent.horizontalCenter
      anchors.verticalCenter: parent.verticalCenter
    }

  }


}

