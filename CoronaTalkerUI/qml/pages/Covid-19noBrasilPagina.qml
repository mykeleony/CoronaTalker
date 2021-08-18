import QtQuick 2.0
import QtQuick.Controls 2.15

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

        Label {
            id: contaminados_brasil
            visible: true
            color: "#ffffff"
            text: qsTr("Contaminados")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            horizontalAlignment: Text.AlignHCenter
            anchors.rightMargin: 140
            anchors.leftMargin: 140
            anchors.bottomMargin: 344
            anchors.topMargin: 50
            font.pointSize: 30
        }

        Label {
            id: mortes_brasil
            visible: true
            color: "#ffffff"
            text: qsTr("Mortos")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            horizontalAlignment: Text.AlignHCenter
            anchors.rightMargin: 140
            anchors.leftMargin: 140
            anchors.bottomMargin: 228
            anchors.topMargin: 166
            font.pointSize: 30
        }

        Button {
            id: button
            x: 207
            y: 390
            width: 133
            height: 40
            text: qsTr("Mostrar")
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: 40

            onClicked: {
                backend.trazer_contaminados_covid_brasil(2)
                backend.trazer_mortes_covid_brasil(3)
                button.text = "Atualizar"
            }

            visible: true
        }
    }

    Connections {
        target: backend

        function onMostrarContaminadosCovidBrasil (num_contaminados_brasil) {
            contaminados_brasil.text = num_contaminados_brasil
            contaminados_brasil.visible = true
        }

        function onMostrarMortesCovidBrasil (num_mortes_brasil) {
            mortes_brasil.text = num_mortes_brasil
            mortes_brasil.visible = true
        }

    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.66;height:480;width:640}D{i:3}D{i:4}D{i:5}
}
##^##*/
