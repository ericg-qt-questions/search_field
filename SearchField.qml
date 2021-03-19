import QtQuick 2.12
import QtQuick.Controls.Material 2.12

FocusScope
{
    id: wrapper

    property double padding: 8
    property double fontPixelSize: 10

    property alias text:      input.text
    property alias hint:      hint.text
    property alias input:     input
    property alias container: container

    signal accepted
    signal clear

    implicitHeight: input.implicitHeight + padding

    Rectangle
    {
        id: container

        anchors.fill: parent
        border.width: 2
        border.color: wrapper.activeFocus ? Material.accent : container.color
        color:        "#c1c1c1"
        radius:       15

        Text
        {
            id: hint

            text:              "Enter word"
            color:             "#707070"
            font.pixelSize:    wrapper.fontPixelSize
            verticalAlignment: Text.AlignVCenter
            opacity:           input.displayText.length ? 0 : 1

            anchors
            {
                top:    parent.top
                left:   searchImage.right
                right:  parent.right
                bottom: parent.bottom

                leftMargin: wrapper.padding / 2
            }
        }

        Image
        {
            id: searchImage

            source: "/search.svg"

            height: wrapper.height / 2

            anchors.left:        parent.left
            anchors.leftMargin:  wrapper.padding

            anchors.verticalCenter: parent.verticalCenter

            fillMode: Image.PreserveAspectFit

            MouseArea
            {
                anchors
                {
                    fill:    parent;
                    margins: -10
                }

                onClicked: wrapper.accepted()
            }
        }

        TextInput
        {
            id: input

            focus: true
            color: "#707070"
            clip:  true

            anchors
            {
                left:   searchImage.right;
                right:  clearImage.left;
                top:    parent.top;
                bottom: parent.bottom

                leftMargin:  wrapper.padding / 2
                rightMargin: wrapper.padding / 2
            }

            verticalAlignment: Text.AlignVCenter

            font.pixelSize: wrapper.fontPixelSize

            onAccepted: wrapper.accepted()
        }

        Image
        {
            id: clearImage

            source: "/clear.svg"

            height: wrapper.height / 2

            anchors.right:        parent.right
            anchors.rightMargin:  wrapper.padding

            anchors.verticalCenter: parent.verticalCenter

            fillMode: Image.PreserveAspectFit

            MouseArea
            {
                anchors
                {
                    fill:    parent;
                    margins: -10
                }

                onClicked:
                {
                    wrapper.text = ""

                    wrapper.clear()
                }
            }
        }
    }
}
