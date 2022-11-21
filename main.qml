import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: Listado {
            onAnyadir: (editando, indice) => {
                           if (editando) {
                               stackView.push(formulario, {
                                                  "edicion": editando,
                                                  "indice": indice,
                                                  "datoNombre": modeloPrincipal.get(
                                                                    indice).name,
                                                  "datoColor": modeloPrincipal.get(
                                                                   indice).colorCode
                                              })
                           } else {

                               stackView.push(formulario, {
                                                  "edicion": editando,
                                                  "indice": indice,
                                                  "datoNombre": "",
                                                  "datoColor": ""
                                              })
                           }
                       }
            modelo: modeloPrincipal
            onBorrar: indice => {
                          modeloPrincipal.remove(indice)
                      }
        }
    }

    Component {
        id: formulario
        Form {
            onCerrar: stackView.pop()
            onEnviar: (nombre, codigoColor, editando, indice) => {
                          if (editando) {
                              modeloPrincipal.set(indice, {
                                                      "name": nombre,
                                                      "colorCode": codigoColor
                                                  })
                          } else {
                              modeloPrincipal.append({
                                                         "name": nombre,
                                                         "colorCode": codigoColor
                                                     })
                          }
                          stackView.pop()
                      }
        }
    }
    ListModel {
        id: modeloPrincipal
        ListElement {
            name: "Grey2"
            colorCode: "grey"
        }
    }
}
