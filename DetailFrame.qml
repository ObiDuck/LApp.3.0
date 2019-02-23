import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.12

Rectangle {
     id: rect2
     x: parent.border.width
     y: parent.border.width
     width: parent.width - x*2; height: parent.height - y*2

     Image {
         fillMode: Image.PreserveAspectCrop
         anchors.centerIn: parent
         source: (flag) ? "image://imageProvider/" + name + "dbGetDetail/" + display : "assets/clr_iconPic.png"
         width: parent.width
         height: parent.height
     }
     MouseArea {
         id: area
         width: parent.width
         height: parent.height
         hoverEnabled: true
         onClicked: {
             chosenID = display
             pnt = viewGR.mapFromItem(parent,x,y)
             if ((pnt.y + 200*2) < viewGR.height)
                 coorY = pnt.y - 3
             else
                 coorY = pnt.y - 3 - 100*2
             if ((pnt.x + labelRoot.width - x + 35*7*2) < viewGR.width)
                 coorX = pnt.x + labelRoot.width - x - 3
             else
                 coorX = pnt.x - 35*7*2 - 3
             pressedID = index
             appCore.openDetailInfo(chosenID)
         }
     }

 }
