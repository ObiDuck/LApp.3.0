import QtQuick 2.12

Rectangle {
  property string backColor: "white"
  property string itemsColor: "red"
  property real size: 48
  color: backColor

  Tile3x1H
  {
    color: backColor
    id: topTile
    itemColor: itemsColor
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.bottom: midTile.top//parent.top
    anchors.bottomMargin: border.width
    itemSize: size - border.width - border.width
  }

  Tile2x1H
  {
    color: backColor
    id: midTile
    itemColor: itemsColor
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter
    itemSize: size * (2/3) - border.width - border.width
  }

  Tile1x1H
  {
    color: backColor
    itemColor: itemsColor
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.top: midTile.bottom//parent.bottom
    anchors.topMargin: border.width
    itemSize: size / 3 - border.width - border.width
  }
}
