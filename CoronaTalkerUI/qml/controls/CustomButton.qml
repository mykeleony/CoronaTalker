import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button {
    id: button

    // Custom Properties
    property color colorDefault: "#b80d1c"
    property color colorMouseOver: "#de0d0d"
    property color colorPressed: "#ff0000"

    QtObject{
        id: internal

        property var dynamicColor: if(button.down) {
                                       button.down ? colorPressed : colorDefault
                                   }
                                   else {
                                       button.hovered ? colorMouseOver : colorDefault
                                   }
    }

    text: qsTr("Nomear")

    contentItem: Item{
        Text {
            id: name
            text: button.text
            font: button.font
            color: "#ffffff"
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    background: Rectangle{
        color: internal.dynamicColor
        radius: 10
    }

}
/*##^##
Designer {
    D{i:0;autoSize:true;height:40;width:200}
}
##^##*/
