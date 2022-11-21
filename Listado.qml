import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: listado
    signal anyadir(bool edicion, int indice)
    signal borrar(int indice)
    property alias modelo: listView.model

    ListView {
        id: listView
        width: parent.width
        height: parent.height
        model: ListModel {
            ListElement {
                name: "Grey"
                colorCode: "grey"
            }

            ListElement {
                name: "Red"
                colorCode: "red"
            }

            ListElement {
                name: "Blue"
                colorCode: "blue"
            }

            ListElement {
                name: "Green"
                colorCode: "green"
            }
        }
        delegate: Item {
            x: 5
            width: 80
            height: 40
            Row {
                id: row1
                spacing: 10
                Rectangle {
                    width: 40
                    height: 40
                    color: colorCode
                }

                Text {
                    text: name
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                }

                Button {
                    id: editar
                    text: qsTr("Editar")
                    onClicked: listado.anyadir(true, index)
                }
                Button {
                    id: borrar
                    text: qsTr("Borrar")
                    onClicked: listado.borrar(index)
                }
            }
        }
    }
    RoundButton {
        id: roundButton
        text: "+"
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 10
        anchors.bottomMargin: 10
        onClicked: anyadir(false, 0)
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

