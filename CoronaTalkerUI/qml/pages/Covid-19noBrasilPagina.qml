import QtQuick 2.0
import QtQuick.Controls 2.15

Item {
    Rectangle {
        id: rectangle
        color: "#bf4040"
        anchors.fill: parent

        Label {
            id: contaminados_brasil
            x: 338
            y: 112
            color: "#ffffff"
            text: qsTr("Contaminados")
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: -21
            anchors.verticalCenterOffset: -120
            font.pointSize: 16
        }

        Button {
            id: button
            x: 314
            y: 309
            text: qsTr("Button")
            onClicked: {
                backend.trazer_contaminados_covid_brasil(2)
                backend.trazer_mortes_covid_brasil(3)
            }
        }

        Label {
            id: mortes_brasil
            x: 328
            y: 111
            color: "#ffffff"
            text: qsTr("Mortos")
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: -21
            anchors.verticalCenterOffset: -37
            font.pointSize: 16
        }
    }

    Connections {
        target: backend

        function onMostrarContaminadosCovidBrasil (num_contaminados_brasil) {
            contaminados_brasil.text = num_contaminados_brasil
        }

        function onMostrarMortesCovidBrasil (num_mortes_brasil) {
            mortes_brasil.text = num_mortes_brasil
        }

    }


}
