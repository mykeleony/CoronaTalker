import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

import "controls"

Window {
    id: janelaPrincipal
    width: 1000
    minimumWidth: 800
    height: 580
    minimumHeight: 500
    visible: true
    color: "#00000000"
    title: qsTr("CoronaTalker")
    property alias row: row

    //Removendo a barra de título:
    flags: Qt.Window | Qt.FramelessWindowHint

    property int statusJanela: 0
    property int margemJanela: 10

    // Funções internas para minimizar, maximizar, restaurar e fechar as páginas:
    QtObject {
        id: internal

        function resetResizedBorders() {
            // Controlando a visibilidade dos cursores de redimensionamento
            resizeLeft.visible = true
            resizeRight.visible = true
            resizeBottom.visible = true
            resizeDiagonal.visible = true
        }

        function maximizar_Restaurar() {
            if(statusJanela == 0) {
                janelaPrincipal.showMaximized()

                statusJanela = 1
                margemJanela = 0

                // Controlando a visibilidade dos cursores de redimensionamento
                resizeLeft.visible = false
                resizeRight.visible = false
                resizeBottom.visible = false
                resizeDiagonal.visible = false

                btnMaximize.btnIconSource = "../images/svg_images/restore_icon.svg"
            }

            else {
                janelaPrincipal.showNormal()

                statusJanela = 0
                margemJanela = 10

                // Controlando a visibilidade dos cursores de redimensionamento
                internal.resetResizedBorders()

                btnMaximize.btnIconSource = "../images/svg_images/maximize_icon.svg"
            }
        }

        function ifMaximizedWindowRestore() {
            if (statusJanela == 1) {
                janelaPrincipal.showNormal()

                statusJanela = 0
                margemJanela = 10

                // Controlando a visibilidade dos cursores de redimensionamento
                internal.resetResizedBorders()

                btnMaximize.btnIconSource = "../images/svg_images/maximize_icon.svg"
            }
        }

        function restoreMargins() {
            statusJanela = 0
            margemJanela = 10

            // Controlando a visibilidade dos cursores de redimensionamento
            internal.resetResizedBorders()

            btnMaximize.btnIconSource = "../images/svg_images/maximize_icon.svg"
        }
    }

    Rectangle {
        id: bg
        color: "#bf4040"
        border.color: "#ae2f27"
        border.width: 1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: margemJanela
        anchors.leftMargin: margemJanela
        anchors.bottomMargin: margemJanela
        anchors.topMargin: margemJanela
        
        Rectangle {
            id: appContainer
            color: "#00000000"
            anchors.fill: parent
            anchors.rightMargin: 1
            anchors.leftMargin: 1
            anchors.bottomMargin: 1
            anchors.topMargin: 1
            
            Rectangle {
                id: topBar
                height: 60
                color: "#a11919"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0
                
                ToggleButton {
                    onClicked: animationMenu.running = true
                }
                
                Rectangle {
                    id: topBarDescription
                    y: 41
                    height: 25
                    color: "#b12c2c"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 70
                    anchors.bottomMargin: 0
                    
                    Label {
                        id: labelTopInfo
                        color: "#e7e4e4"
                        text: qsTr("Aqui é o seu espaço para tirar dúvidas sobre o novo coronavírus!")
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 0
                        anchors.rightMargin: 300
                        anchors.leftMargin: 10
                        anchors.topMargin: 0
                    }
                    
                    Label {
                        id: labelRightInfo
                        color: "#e7e4e4"
                        text: qsTr("| HOME")
                        anchors.left: labelTopInfo.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        horizontalAlignment: Text.AlignRight
                        anchors.topMargin: 0
                        anchors.rightMargin: 10
                        anchors.leftMargin: 0
                        anchors.bottomMargin: 0
                    }
                }
                
                Rectangle {
                    id: titleBar
                    height: 35
                    color: "#00000000"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.rightMargin: 105
                    anchors.leftMargin: 70
                    anchors.topMargin: 0

                    // Possibilitando movimentação da janela do aplicativo:
                    DragHandler {
                        onActiveChanged: if(active) {
                                             janelaPrincipal.startSystemMove()
                                             internal.ifMaximizedWindowRestore()
                                         }
                    }

                    Image {
                        id: iconApp
                        width: 22
                        height: 22
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        source: "../images/svg_images/CoronaTalker_icon.png"
                        anchors.leftMargin: 5
                        anchors.bottomMargin: 0
                        anchors.topMargin: 0
                        fillMode: Image.PreserveAspectFit
                    }
                    
                    Label {
                        id: label
                        color: "#ffffff"
                        text: qsTr("Bem-vindo(a) ao CoronaTalker!")
                        anchors.left: iconApp.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 10
                        anchors.leftMargin: 5
                        
                        Row {
                            id: row
                            x: 753
                            y: 8
                            width: 200
                            height: 400
                        }
                    }
                }
                
                Row {
                    id: rowBtns
                    x: 673
                    width: 105
                    height: 35
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.rightMargin: 0
                    anchors.topMargin: 0
                    
                    TopBarButton {
                        id: btnMinimize
                        onClicked: {
                            janelaPrincipal.showMinimized()
                            internal.restoreMargins()
                        }
                    }

                    TopBarButton {
                        id: btnMaximize
                        onClicked: internal.maximizar_Restaurar()
                        btnIconSource: "../images/svg_images/maximize_icon.svg"
                    }

                    TopBarButton {
                        id: btnClose
                        btnColorClicked: "#ff0000"
                        onClicked: janelaPrincipal.close()
                        btnIconSource: "../images/svg_images/close_icon.svg"
                    }
                }
                
            }
            
            Rectangle {
                id: content
                color: "#00000000"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: topBar.bottom
                anchors.bottom: parent.bottom
                anchors.topMargin: 0
                
                Rectangle {
                    id: leftMenu
                    width: 70
                    color: "#a11919"
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    clip: true
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0
                    
                    PropertyAnimation {
                        id: animationMenu
                        target: leftMenu
                        property: "width"
                        to: if(leftMenu.width == 70) return 230; else return 70
                        duration: 430
                        easing.type: Easing.InOutBack
                    }

                    Column {
                        id: columnMenus
                        visible: true
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        clip: false
                        anchors.rightMargin: 8
                        anchors.leftMargin: 0
                        anchors.bottomMargin: 90
                        anchors.topMargin: 0
                        
                        LeftMenuBtn {
                            id: btnHome
                            width: leftMenu.width
                            visible: true
                            text: qsTr("Página Inicial")
                            isActiveMenu: true
                            clip: false
                        }

                        LeftMenuBtn {
                            id: btnQeA
                            width: leftMenu.width
                            visible: true
                            text: qsTr("Dúvidas comuns")
                            clip: false
                            btnIconSource: "../images/svg_images/question_mark.png"
                            isActiveMenu: false
                        }

                        LeftMenuBtn {
                            id: btnCovidGlobal
                            width: leftMenu.width
                            visible: true
                            text: qsTr("Covid-19 no Mundo")
                            isActiveMenu: false
                            btnIconSource: "../images/svg_images/earth_icon.png"
                            clip: false
                        }

                        LeftMenuBtn {
                            id: btnCovidBrazil
                            width: leftMenu.width
                            visible: true
                            text: qsTr("Covid-19 no Brasil")
                            btnIconSource: "../images/svg_images/brasil_icon.png"
                            clip: false
                        }

                    }
                }
                
                Rectangle {
                    id: contentPages
                    color: "#00000000"
                    anchors.left: leftMenu.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 25
                    anchors.topMargin: 0
                }
                
                Rectangle {
                    id: rectangle
                    color: "#b12c2c"
                    anchors.left: leftMenu.right
                    anchors.right: parent.right
                    anchors.top: contentPages.bottom
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0
                    
                    Label {
                        id: labelTopInfo1
                        color: "#e7e4e4"
                        text: qsTr("Informação extra aqui!")
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.topMargin: 0
                        anchors.rightMargin: 30
                        anchors.leftMargin: 10
                        anchors.bottomMargin: 0
                    }

                    MouseArea {
                        id: resizeDiagonal
                        x: 884
                        y: 0
                        width: 25
                        height: 25
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 0
                        anchors.rightMargin: 0
                        cursorShape: Qt.SizeFDiagCursor

                        Image {
                            id: image
                            width: 25
                            height: 25
                            opacity: 0.5
                            anchors.left: parent.left
                            anchors.top: parent.top
                            source: "../images/svg_images/resize_icon.svg"
                            anchors.topMargin: 5
                            anchors.leftMargin: 5
                            sourceSize.height: 16
                            sourceSize.width: 16
                            fillMode: Image.PreserveAspectFit
                            antialiasing: false
                        }

                        DragHandler {
                            target: null
                            onActiveChanged: if (active) {
                                                 janelaPrincipal.startSystemResize(Qt.RightEdge | Qt.BottomEdge)
                                             }
                        }

                    }
                }
            }
        }
    }

    DropShadow {
        anchors.fill: bg
        horizontalOffset: 0
        verticalOffset: 0
        radius: 10
        samples: 16
        color: "#9c0202"
        source: bg
        z: 0
    }

    MouseArea {
        id: resizeLeft
        width: 10
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.bottomMargin: 10
        anchors.topMargin: 10
        cursorShape: Qt.SizeHorCursor

        DragHandler {
            target: null
            onActiveChanged: if (active) { janelaPrincipal.startSystemResize(Qt.LeftEdge) }
        }
    }

    MouseArea {
        id: resizeRight
        width: 10
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 0
        anchors.bottomMargin: 10
        anchors.topMargin: 10
        cursorShape: Qt.SizeHorCursor

        DragHandler {
            target: null
            onActiveChanged: if (active) { janelaPrincipal.startSystemResize(Qt.RightEdge) }
        }
    }

    MouseArea {
        id: resizeBottom
        height: 10
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        anchors.bottomMargin: 0
        cursorShape: Qt.SizeVerCursor

        DragHandler {
            target: null
            onActiveChanged: if (active) { janelaPrincipal.startSystemResize(Qt.BottomEdge) }
        }
    }

}



/*##^##
Designer {
    D{i:0;formeditorZoom:0.66}D{i:30}D{i:37}
}
##^##*/
