import QtQuick 2.12

Rectangle {
  property string backColor: "white"
  property string itemsColor: "red"
  color: backColor

  Tile2x1H
  {
    color: backColor
    id: topTile
    itemColor: itemsColor
    anchors.bottom: midTile.top//parent.top
    anchors.bottomMargin:  border.width
    itemSize: parent.height  - border.width - border.width
  }

  Tile2x1H
  {
    color: backColor
    id: midTile
    itemColor: itemsColor
    anchors.verticalCenter: parent.verticalCenter
    itemSize: parent.height - border.width - border.width
  }

  Tile2x1H
  {
    color: backColor
    itemColor: itemsColor
    anchors.top: midTile.bottom//parent.bottom
    anchors.topMargin: border.width
    itemSize: parent.height - border.width - border.width
  }
}
