import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button {
    id: btnTopBar

    // Customizando o botão:
    property url btnIconSource: "../../images/svg_images/minimize_icon.svg"
    property color btnColorDefault: "#b0101e"
    property color btnColorMouseOver: "#bf3434"
    property color btnColorClicked: "#800000"

    QtObject {
        id: internal

        // Mudança de cor emTabl Mouse Over e Mouse Click:
        property var dinamycColor: if(btnTopBar.down) {
                                       btnTopBar.down ? btnColorClicked : btnColorDefault
                                   } else {
                                       btnTopBar.hovered ? btnColorMouseOver : btnColorDefault
                                   }
    }

    implicitWidth: 35
    implicitHeight: 35

    background: Rectangle {
        id: bgBtn
        color: internal.dinamycColor

        Image {
            id: iconBtn
            source: btnIconSource
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            height: 16
            width: 16
            fillMode: Image.PreserveAspectFit
            visible: false
        }

        ColorOverlay {
            anchors.fill: iconBtn
            source: iconBtn
            color: "#ffffff"
            antialiasing: false
        }

    }
}


