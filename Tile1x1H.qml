import QtQuick 2.12

Rectangle {
  property real itemSize: 48
  property string itemColor: "green"
  width: itemSize
  height: baseTile.height + stud.height - stud.border.width
  color: "yellow"

  BaseTileH {
    id: baseTile
    simpleWidth: itemSize
    numberOfStuds: 1
    color: itemColor
    anchors.bottom: parent.bottom
    anchors.horizontalCenter: parent.horizontalCenter
  }

  Stud {
    id: stud
    simpleWidth: itemSize
    numberOfStuds: 1
    color: itemColor
    anchors.horizontalCenter: baseTile.horizontalCenter
    anchors.bottom: baseTile.top
    anchors.bottomMargin: -baseTile.border.width
  }
}
