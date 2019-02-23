import QtQuick 2.12
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.12

Rectangle
{
  property int itemSize: 10
  property string textValue: "recentName"
  property bool itemEnabled: true
  id: openDatabaseBackground
  width: 1.1 * (openDBText.width + openDatabaseIcon.itemSize)
  height: itemSize
  radius: 4
  border.width: 1
  border.color: "black"
  color: (itemEnabled) ? "white" : "light gray"

  PlusIcon
  {
    id: openDatabaseIcon
    anchors.left: parent.left
    anchors.leftMargin: 4
    anchors.verticalCenter: parent.verticalCenter
    itemSize: openDBText.height * 1.2
    width: itemSize
    height: itemSize
    itemColor: "gray"
  }

  Text
  {
    id: openDBText
    text: textValue
    anchors.left: openDatabaseIcon.right
    anchors.leftMargin: 4
    anchors.verticalCenter: parent.verticalCenter
    font.family: robotoFont.name;
    font.pointSize: 12
    color: (itemEnabled) ? "black" : "gray"
  }
  //Тень для прямоугольника
}
