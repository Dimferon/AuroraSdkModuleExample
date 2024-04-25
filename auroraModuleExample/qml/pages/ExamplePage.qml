import QtQuick 2.5
import QtGraphicalEffects 1.0
import Sailfish.Silica 1.0
import test_module.test_cppmodule 0.1

Page{
    id: examplePage

    SilicaFlickable{
        anchors.fill: parent
        LineDiagram{
            id: lineDiag
            spacing: 10
            itemSpacing: 5

            anchors{
                left: parent.left
                leftMargin: 10
                right: parent.right
                rightMargin: 10
            }

            textFontSize: 17
            valueFontSize: 16
            legendFontSize: 17

            chartHeight: 200
            textHeight: 100
            legendHeight: 70
            itemWidth: 85
            legendTextHeight:50
            legendTextWidth:200



            legends: [
                LegendDiagram{
                    color: "black"
                    text: "TestLegend1"
                },
                LegendDiagram{
                    color: "red"
                    text: "TestLegend2"
                }
            ]

            function loadValue(){                
                lineDiag.clearValue();
                var list = [
                            {"v1":10,"v2":20, "t":"t1"},
                            {"v1":20, "v2":30, "t":"t2"},
                        ];

                for(var ind in list){
                    var listValue = [Number(list[ind]["v1"]), Number(list[ind]["v2"])];
                    lineDiag.addValue(list[ind]["t"],
                                            listValue
                                            );
                }
                lineDiag.update();
            }

            Component.onCompleted: {
                lineDiag.loadValue();
            }
        }
    }
}
