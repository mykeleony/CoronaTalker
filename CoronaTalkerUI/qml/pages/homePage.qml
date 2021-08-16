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
                id: campoNome
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
                onClicked: {
                    backend.escrever_boas_vindas(campoNome.text)
                }

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
                id: home_titulo
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

            ScrollView {
                id: scrollView
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.rightMargin: 30
                anchors.leftMargin: 30
                anchors.bottomMargin: 10
                anchors.topMargin: 40

                Text {
                    id: texto_home
                    width: 50
                    color: "#FFFFFF"
                    text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\n</style></head><body style=\" font-family:'Ubuntu'; font-size:11pt; font-weight:400; font-style:normal;\">\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'MS Shell Dlg 2'; font-size:8.5pt;\"><br /></span><span style=\" font-family:'MS Shell Dlg 2'; font-size:8.5pt; font-weight:600;\">LICENÇA MIT</span></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'MS Shell Dlg 2'; font-size:8.5pt;\">Versão 1, 13 Agosto 2021</span></p>\n<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; font-family:'MS Shell Dlg 2'; font-size:8.5pt;\"><br /></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'MS Shell Dlg 2'; font-size:8.5pt;\">Copyright © 2021 </span><span style=\" font-family:'MS Shell Dlg 2'; font-size:8.5pt; font-weight:600;\">Myke Leony dos Santos Amorim</span></p>\n<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; font-family:'MS Shell Dlg 2'; font-size:8.5pt; font-weight:600;\"><br /></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'MS Shell Dlg 2'; font-size:8.5pt; font-weight:600; color:#f7a6a6;\">Atenção</span><span style=\" font-family:'MS Shell Dlg 2'; font-size:8.5pt;\">: Este projeto foi criado com as ferramentas de Código Aberto da Qt Company.</span></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'MS Shell Dlg 2'; font-size:8.5pt;\">Este projeto pode ser utilizado para fins educacionais ou pessoais e não-comerciais. </span></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'MS Shell Dlg 2'; font-size:8.5pt; font-weight:600;\">Se o intuito é de </span><span style=\" font-family:'MS Shell Dlg 2'; font-size:8.5pt; font-weight:600; color:#f7a6a6;\">uso comercial</span><span style=\" font-family:'MS Shell Dlg 2'; font-size:8.5pt; font-weight:600;\">, você deverá comprar uma licença em &quot;https://www.qt.io&quot;.</span></p></body></html>"
                    anchors.fill: parent
                   font.pixelSize: 12
                   anchors.rightMargin: 204
                   anchors.bottomMargin: 0
                   anchors.leftMargin: 0
                   anchors.topMargin: 50
                   maximumLineCount: 10000
                   textFormat: Text.RichText
                }

                Label {
                    id: intro_home
                    x: 10
                    y: 10
                    width: 500
                    height: 20
                    color: "#ffffff"
                    text: qsTr("Este aplicativo objetiva democratizar o acesso à informação sobre a pandemia do novo coronavírus.")
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 0
                    anchors.rightMargin: 10
                    anchors.leftMargin: 0
                    anchors.topMargin: 0
                }

            }
        }
    }

    Connections {
        target: backend

        function onDefinirNome (nome) {
            home_titulo.text = nome
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.75;height:480;width:800}
}
##^##*/
