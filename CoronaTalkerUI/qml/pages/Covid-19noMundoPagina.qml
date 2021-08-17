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
            text: qsTr("Contaminados")
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: -120
            anchors.horizontalCenterOffset: -23
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 16
        }

        Button {
            id: button
            x: 312
            y: 309
            text: qsTr("Button")
            onClicked: {
                backend.trazer_contaminados_covid_mundial(0)
                backend.trazer_mortes_covid_mundial(1)
            }
        }

        Label {
            id: mortes_mundo
            x: 328
            y: 111
            color: "#ffffff"
            text: qsTr("Mortos")
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: -23
            anchors.verticalCenterOffset: -37
            font.pointSize: 16
        }
    }

    Connections {
        target: backend

        function onMostrarContaminadosCovidMundial (num_contaminados_mundo) {
            contaminados_mundo.text = num_contaminados_mundo
        }

        function onMostrarMortesCovidMundial (num_mortes_mundo) {
            mortes_mundo.text = num_mortes_mundo
        }

    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.66;height:480;width:800}D{i:4}
}
##^##*/
