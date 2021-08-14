import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

// #f43a3a

Button {
    id: btnLeftMenu
    text: qsTr("Página inicial")

    // Customizando o botão:
    property url btnIconSource: "../../images/svg_images/home_icon.svg"
    property color btnColorDefault: "#b0101e"
    property color btnColorMouseOver: "#bf3434"
    property color btnColorClicked: "#800000"
    property color activeMenuColor: "#ffffff"
    property color activeMenuColorRight: "#ed7272"
    property int iconWidth: 18
    property int iconHeight: 18
    property bool isActiveMenu: false

    QtObject {
        id: internal

        // Mudança de cor em Mouse Over e Mouse Click:
        property var dinamycColor: if(btnLeftMenu.down) {
                                       btnLeftMenu.down ? btnColorClicked : btnColorDefault
                                   } else {
                                       btnLeftMenu.hovered ? btnColorMouseOver : btnColorDefault
                                   }
    }

    implicitWidth: 250
    implicitHeight: 60

    background: Rectangle {
        id: bgBtn
        color: internal.dinamycColor

        Rectangle {
            anchors {
                top: parent.top
                left: parent.left
                bottom: parent.bottom
            }

            color: activeMenuColor
            width: 3
            visible: isActiveMenu
        }

        Rectangle {
            anchors {
                top: parent.top
                right: parent.right
                bottom: parent.bottom
            }

            color: activeMenuColorRight
            width: 5
            visible: isActiveMenu
        }
    }

    contentItem: Item {

        anchors.fill: parent
        id: content

        Image {
            id: iconBtn
            source: btnIconSource
            anchors.leftMargin: 26
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            sourceSize.width: iconWidth
            sourceSize.height: iconHeight
            height: iconHeight
            width: iconWidth
            fillMode: Image.PreserveAspectFit
            visible: true
            antialiasing: true
        }

        ColorOverlay {
            anchors.fill: iconBtn
            source: iconBtn
            anchors.leftMargin: 26
            color: "#ffffff"
            anchors.verticalCenter: parent.verticalCenter
            antialiasing: true
            width: iconWidth
            height: iconHeight
        }

        Text {
            color: "#ffffff"
            text: btnLeftMenu.text
            font: btnLeftMenu.font
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 75
        }

    }
}



/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:6;height:40;width:250}
}
##^##*/
