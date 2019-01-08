import QtQuick 2.12

Rectangle {
  property real mySize : 48
  id: rootRound
  width: mySize
  height: mySize
  color: "green"
  border.color: "black"
  border.width: 1

  Rectangle {
    id: rectangle
    radius: mySize * 0.6
    width: mySize * 0.6
    height: mySize * 0.6
    border.color: "black"
    border.width: 1

    color: "green"
    anchors.horizontalCenter: rootRound.horizontalCenter
    anchors.verticalCenter: rootRound.verticalCenter
  }
}

