import QtQuick 2.12
import QtQuick.Controls 2.5

Rectangle {
  property string backColor
  color: backColor
  id: mainRect

  Button {
    id: mainMenuButton
    width: parent.height
    height: parent.height
    anchors.left: parent.left
    anchors.leftMargin: 4
    background: MenuIcon {
      backColor: mainRect.color
      itemsColor: "white"//"#FF5252"
      color: backColor
      anchors.verticalCenter: parent.verticalCenter
      height: parent.height
    }
  }

  Button {
    id: filtersButton
    width: parent.height
    height: parent.height
    anchors.right: parent.right
    anchors.rightMargin: 4
    background: FilterIcon {
      backColor: mainRect.color
      size: parent.height
      itemsColor: "white"//"#FF5252"
      color: backColor
      anchors.verticalCenter: parent.verticalCenter
      height: parent.height
    }
  }

}
