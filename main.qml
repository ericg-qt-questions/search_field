import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

ApplicationWindow
{
    width:   640
    height:  480
    visible: true

    title: qsTr( "Hello World" )

    Column
    {
        SearchField
        {
            id: searchField

            width:         200
            fontPixelSize: 10
            hint:          "Search"

            onAccepted:
            {
                console.log( searchField.text );
            }
        }

        Button
        {
            text: "info"

            onClicked:
            {
                console.log( searchField.input.implicitHeight)
                console.log( searchField.input.contentHeight)
                console.log( searchField.input.font.pixelSize )
            }
        }

        TextField
        {
            width: 200
        }
    }


}
