import QtQuick 2.12
import QtGraphicalEffects 1.12

Rectangle {
  property real itemSize: 48
  property string itemColor: "green"
  width: itemSize
  height: baseTile.height + leftStud.height - leftStud.border.width
  color: "yellow"

  BaseTileH {
    id: baseTile
    simpleWidth: itemSize
    numberOfStuds: 2
    color: itemColor
    anchors.bottom: parent.bottom
    anchors.horizontalCenter: parent.horizontalCenter
  }

  DropShadow {
    anchors.fill: baseTile
    horizontalOffset: 1
    verticalOffset: 1
    radius: 8.0
    samples: 17
    color: "#80000000"
    source: baseTile
  }

  Stud {
    id: leftStud
    simpleWidth: itemSize
    numberOfStuds: 2
    color: itemColor
    anchors.left: baseTile.left
    anchors.leftMargin: leftStud.gap
    anchors.bottom: baseTile.top
    anchors.bottomMargin: -baseTile.border.width
  }

  Stud {
    id: rightStud
    simpleWidth: itemSize
    numberOfStuds: 2
    color: itemColor
    anchors.right: baseTile.right
    anchors.rightMargin: rightStud.gap
    anchors.bottom: baseTile.top
    anchors.bottomMargin: -baseTile.border.width
  }
}
