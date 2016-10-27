import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Rectangle
    {
        id: run
        width: 100; height: 50
        Text {
            text: "运行"
            anchors.centerIn: parent
            font.pixelSize: 32
            color: white
        }
        anchors.centerIn: parent
        state: "stopState"
        states: [
            State{
                name: "runState"
                PropertyChanges{
                    target: run; color:"lightgray"
                }
                PropertyChanges{
                    target: mouseArea1; enabled: false;
                }
            },
            State{
                name: "stopState"
                PropertyChanges{
                    target: run; color: "lightblue"
                }
                PropertyChanges{
                    target: mouseArea1; enabled: true;
                }
            }
        ]
        MouseArea
        {
            id: mouseArea1
            anchors.fill: parent
            onClicked: {
                if(run.state == "runState")
                    {
                        run.state = "stopState"
                        stop.state = "stopState"
                    }
                else
                    {
                        run.state = "runState"
                        stop.state = "runState"
                    }
            }
        }
    }

    Rectangle
    {
        id: stop
        width: 100; height: 50
        Text
        {
            anchors.centerIn: parent
            text: "暂停"
            font.pixelSize: 32
        }
        anchors.top: run.bottom
        anchors.left: run.left
        anchors.topMargin: 10
        state: "stopState"
        states: [
            State{
                name: "runState"
                PropertyChanges{
                    target: stop; color:"lightblue"
                }
                PropertyChanges{
                    target: mouseArea2; enabled: true;
                }
            },
            State{
                name: "stopState"
                PropertyChanges{
                    target: stop; color: "lightgray"
                }
                PropertyChanges{
                    target: mouseArea2; enabled: false;
                }
            }
        ]
        MouseArea
        {
            id: mouseArea2
            anchors.fill: parent
            onClicked: {
                if(stop.state == "runState")
                {stop.state = "stopState"
                 run.state = "stopState"}
                else
                {stop.state = "runState"
                 run.state = "runState"}
            }
        }
    }
}
