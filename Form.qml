import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    property string datoNombre
    property string datoColor
    property bool edicion
    property int indice
    signal cerrar
    signal enviar(string nombre, string codigoColor, bool enviando, int indice)
    id: formulario

    function enviarFormulario() {
        formulario.enviar(name.text, colorCode.text, formulario.edicion,
                          formulario.indice)
    }

    Rectangle {
        id: rectangle
        color: "#ffffff"
        anchors.fill: parent
    }

    Column {
        id: column
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        TextField {
            id: name
            width: parent.width
            placeholderText: qsTr("Nombre")
            text: formulario.datoNombre
            onAccepted: formulario.enviarFormulario()
        }

        TextField {
            id: colorCode
            width: parent.width
            placeholderText: qsTr("Color")
            text: formulario.datoColor
            onAccepted: formulario.enviarFormulario()
        }

        Row {
            id: botones

            Button {
                id: cancelar
                text: qsTr("Cancelar")
                onClicked: formulario.cerrar()
            }

            Button {
                id: enviar
                text: qsTr("Enviar")
                highlighted: true
                onClicked: formulario.enviarFormulario()
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:2}
}
##^##*/

