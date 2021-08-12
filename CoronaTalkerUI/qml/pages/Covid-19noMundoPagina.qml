import QtQuick 2.0
import QtQuick.Controls 2.15

Item {
    Rectangle {
        id: rectangle
        color: "#bf4040"
        anchors.fill: parent

        Label {
            id: label
            x: 338
            y: 112
            color: "#ffffff"
            text: qsTr("Covid-19 no mundo.")
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 16
        }
    }

}
