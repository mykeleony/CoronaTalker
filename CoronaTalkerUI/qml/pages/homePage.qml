import QtQuick 2.0
import QtQuick.Controls 2.15
import "../controls"

Item {
    Rectangle {
        id: rectangle
        color: "#b0101e"
        anchors.fill: parent
        
        Rectangle {
            id: rectangleTop
            height: 69
            color: "#ed7272"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 50
            anchors.leftMargin: 50
            anchors.topMargin: 53
            radius: 15

            CustomTextField {
                height: 40
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.rightMargin: 390
                anchors.bottomMargin: 15
                anchors.topMargin: 15
                anchors.leftMargin: 10
            }

            CustomButton {
                x: 316
                width: 240
                height: 40
                text: "Nomear"
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.rightMargin: 144
                anchors.bottomMargin: 15
                anchors.topMargin: 15

            }

        }
        
        Rectangle {
            id: rectangleBottom
            color: "#bf4040"
            radius: 15
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: rectangleTop.bottom
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 50
            anchors.rightMargin: 50
            anchors.topMargin: 10
            anchors.leftMargin: 50

            Label {
                id: label
                height: 17
                color: "#ffffff"
                text: qsTr("Bem-vindo(a) ao CoronaTalker!")
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                horizontalAlignment: Text.AlignHCenter
                anchors.rightMargin: 240
                anchors.leftMargin: 240
                anchors.topMargin: 10
            }
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.75;height:480;width:800}D{i:3}D{i:4}D{i:6}
}
##^##*/
