import QtQuick 2.12

Item {
  property real itemSize: 48
  property string itemColor: "green"

  CenterStudTile2x1
  {
    mySize: itemSize;
    anchors { horizontalCenter: parent.horizontalCenter; verticalCenter: parent.verticalCenter }
    color: itemColor
  }

  Tile2x1
  {
    rotation: 90
    mySize: itemSize;
    anchors { horizontalCenter: parent.horizontalCenter; verticalCenter: parent.verticalCenter }
    color: itemColor
  }
}
