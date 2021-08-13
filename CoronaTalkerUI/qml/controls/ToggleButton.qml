import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button {
    id: btnToggle

    // Customizando o botão:
    property url btnIconSource: "../../images/svg_images/menu_icon.svg"
    property color btnColorDefault: "#b0101e"
    property color btnColorMouseOver: "#bf3434"
    property color btnColorClicked: "#800000"

    QtObject {
        id: internal

        // Mudança de cor em Mouse Over e Mouse Click:
        property var dinamycColor: if(btnToggle.down) {
                                       btnToggle.down ? btnColorClicked : btnColorDefault
                                   } else {
                                       btnToggle.hovered ? btnColorMouseOver : btnColorDefault
                                   }
    }

    implicitWidth: 70
    implicitHeight: 60
    
    background: Rectangle {
        id: bgBtn
        color: internal.dinamycColor
        
        Image {
            id: iconBtn
            source: btnIconSource
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            height: 25
            width: 25
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


