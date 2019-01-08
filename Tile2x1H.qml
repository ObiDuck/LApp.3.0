import QtQuick 2.12

Rectangle {
  property real itemSize: 48
  property string itemColor: "green"
  width: itemSize
  height: (itemSize / 2) * 0.4 + leftStud.height
  color: "blue"

  Rectangle {
    id: baseTile
    width: parent.width
    height: parent.height - leftStud.height
    color: itemColor
    anchors.bottom: parent.bottom
    border.width: 1
    border.color: "black"
  }

  Rectangle {
    id: leftStud
    width: (itemSize / 2) * 0.6
    height: (itemSize / 2) * 0.2
    color: itemColor
    border.width: 1
    border.color: "black"
    anchors.bottom: baseTile.top
    anchors.bottomMargin: -baseTile.border.width
    anchors.left: baseTile.left
    anchors.leftMargin: (itemSize / 2) * 0.25
  }

  Rectangle {
    id: rightStud
    width: (itemSize / 2) * 0.6
    height: (itemSize / 2) * 0.2
    color: itemColor
    border.width: 1
    border.color: "black"
    anchors.bottom: baseTile.top
    anchors.bottomMargin: -baseTile.border.width
    anchors.right: baseTile.right
    anchors.rightMargin: (itemSize / 2) * 0.25
  }
}
