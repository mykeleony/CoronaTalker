import QtQuick 2.0
import QtQuick.Controls 2.15

Item {
    Rectangle {
        id: rectangle
        color: "#bf4040"
        anchors.fill: parent

        Label {
            id: contaminados_mundo
            x: 338
            y: 112
            color: "#ffffff"
            text: qsTr("Covid-19 no mundo.")
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: -120
            anchors.horizontalCenterOffset: -23
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 16
        }
    }

    Connections {
        target: backend

        function onNumerar_Contagio_Mundial_Covid (numero) {
            contaminados_mundo.text = numero
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.66;height:480;width:800}
}
##^##*/
