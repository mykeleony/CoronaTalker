import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

import "controls"

Window {
    id: janelaPrincipal
    width: 1000
    height: 580
    visible: true
    color: "#00000000"
    title: qsTr("CoronaTalker")
    property alias row: row

    //Removendo a barra de título:
    flags: Qt.Window | Qt.FramelessWindowHint

    Rectangle {
        id: bg
        color: "#bf4040"
        border.color: "#ae2f27"
        border.width: 1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        anchors.bottomMargin: 10
        anchors.topMargin: 10
        
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

                   }

                    TopBarButton {
                        id: btnMaximize
                        btnIconSource: "../images/svg_images/maximize_icon.svg"
                   }

                    TopBarButton {
                        id: btnClose
                        btnColorClicked: "#ff0000"
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
                }
            }
        }
    }

    /*
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
    */
}



/*##^##
Designer {
    D{i:0;formeditorZoom:0.66}
}
##^##*/
