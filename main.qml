import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

ApplicationWindow
{
    width: 640
    height: 480
    visible: true

    title: qsTr( "Hello World" )


    Column
    {
        Rectangle
        {
            color: "red"
            radius: 15

            height: field.implicitHeight + 8
            width: 200

            TextField
            {
                id: field

                anchors.fill: parent
                anchors.margins: 4
                anchors.verticalCenter: parent.verticalCenter

                placeholderText: "search"

                background: Rectangle
                {
                    color: "gray"
                    anchors.fill: parent
                    anchors.margins: -2
                    radius: 15
                }
            }
        }

        Button
        {
            text: "info"

            onClicked:
            {
                console.log( field.implicitHeight)
                console.log( field.contentHeight)
                console.log( field.font.pixelSize )
            }
        }
    }


}
