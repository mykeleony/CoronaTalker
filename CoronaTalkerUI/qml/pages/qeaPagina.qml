import QtQuick 2.0
import QtQuick.Controls 2.15
import "../controls"

Item {
    id: item1

    Rectangle {
        id: rectangle
        width: 400
        height: 400
        color: "#b0101e"
        anchors.fill: parent
    }

    Rectangle {
        id: rectangleBottom
        width: 430
        color: "#bf4040"
        radius: 15
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 20
        anchors.bottomMargin: 20
        anchors.rightMargin: 20
        anchors.topMargin: 20
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.9;height:480;width:640}
}
##^##*/
