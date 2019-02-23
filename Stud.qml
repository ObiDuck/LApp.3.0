import QtQuick 2.12

Rectangle {
  property real simpleWidth: 8
  property real numberOfStuds: 1
  property real gap: simpleWidth / numberOfStuds / 5

  id: baseStud
  width: (simpleWidth / numberOfStuds - gap)/1.625
  height: (simpleWidth / numberOfStuds / 2.4375)/ 1.88
  color: parent.color
  border.color: "black"
  border.width: 1

//  anchors.bottom: baseTile.top
//  anchors.bottomMargin: -baseTile.border.width
}
