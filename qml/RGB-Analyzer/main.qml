import QtQuick 2.4
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1

ApplicationWindow {
    title: qsTr("Histogram")
    width: 800
    height: 480

    FileDialog {
        id: fileDialog
        folder: "/Users/gabi/Work/DevDays-Asia-2014/Pictures"
        onAccepted: imageView.source = fileUrl
    }

    Action {
        id: fileOpenAction
        text: qsTr("Open")
        shortcut: "Ctrl+O"
        onTriggered: fileDialog.open()
        iconSource: "qrc:/document-open.png"
    }

    menuBar: MenuBar {
        Menu {
            title: qsTr("File")

            MenuItem {
                action: fileOpenAction
            }

            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }
    }

    toolBar: ToolBar {
        RowLayout {
            ToolButton {
                action: fileOpenAction
                Layout.maximumWidth: width
            }
        }
    }

    SplitView {
        anchors.fill: parent

        Image {
            id: imageView
            Layout.minimumWidth: 200
            fillMode: Image.PreserveAspectFit
        }

        Item {
            TabView {
                anchors.fill: parent
                anchors.margins: 12

                Tab {
                    id: tableTab
                    title: "Table"
                }

                Tab {
                    title: "Histogram"
                }
            }
        }
    }
}
