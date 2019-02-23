import QtQuick 2.12

Rectangle {
  property real simpleWidth: 8
  property real numberOfStuds: 1
  property real gap: simpleWidth / numberOfStuds / 5

  id: baseTile
  width: simpleWidth - gap
  height: simpleWidth / numberOfStuds / 2.4375
  color: parent.color
  border.color: "black"
  border.width: 1
}
