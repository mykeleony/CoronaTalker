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

        Label {
            id: contaminados_brasil
            x: 386
            visible: false
            color: "#ffffff"
            text: qsTr("Contaminados")
            anchors.top: parent.top
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 50
            font.pointSize: 35
        }

        Label {
            id: mortes_brasil
            x: 452
            visible: false
            color: "#ffffff"
            text: qsTr("Mortos")
            anchors.top: parent.top
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 185
            font.pointSize: 30
        }

        CustomButton {
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

        Label {
            id: mensagem_inicial
            x: 386
            visible: true
            color: "#ffffff"
            text: "<b> Clique em 'Mostrar' para exibir <br> os dados da Covid-19 no Brasil </b>"
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 20
        }
    }

    Connections {
        target: backend

        function onMostrarContaminadosCovidBrasil (num_contaminados_brasil) {
            contaminados_brasil.text = num_contaminados_brasil
            contaminados_brasil.visible = true
            contaminados_brasil_descricao.visible = true
            mensagem_inicial.visible = false
        }

        function onMostrarMortesCovidBrasil (num_mortes_brasil) {
            mortes_brasil.text = num_mortes_brasil
            mortes_brasil.visible = true
            mortes_brasil_descricao.visible = true
        }

    }

    Label {
        id: contaminados_brasil_descricao
        x: 386
        width: 347
        height: 30
        visible: false
        color: "#ffffff"
        text: qsTr("Casos de Covid-19 registrados no Brasil")
        anchors.top: parent.top
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 14
        anchors.topMargin: 130
    }

    Label {
        id: mortes_brasil_descricao
        x: 386
        width: 265
        height: 30
        visible: false
        color: "#ffffff"
        text: qsTr("Mortes por Covid-19 no Brasil")
        anchors.top: parent.top
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenterOffset: -6
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 14
        anchors.topMargin: 255
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.9;height:480;width:640}D{i:3}D{i:4}D{i:8}
}
##^##*/
