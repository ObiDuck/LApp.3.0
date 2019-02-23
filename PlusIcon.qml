import QtQuick 2.12
import QtGraphicalEffects 1.12

Item {
  property real itemSize: 48
  property string itemColor: "green"

  CenterStudTile2x1
  {
    id: bottomTile
    mySize: itemSize;
    anchors { horizontalCenter: parent.horizontalCenter; verticalCenter: parent.verticalCenter }
    color: itemColor
  }

  DropShadow {
    anchors.fill: bottomTile
    horizontalOffset: 1
    verticalOffset: 1
    radius: 8.0
    samples: 17
    color: "#80000000"
    source: bottomTile
  }

  Tile2x1
  {
    id: upperTile
    rotation: 90
    mySize: itemSize;
    anchors { horizontalCenter: parent.horizontalCenter; verticalCenter: parent.verticalCenter }
    color: itemColor
  }
}
