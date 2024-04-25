import QtQuick 2.5
import QtGraphicalEffects 1.0
import Sailfish.Silica 1.0
import test_module.chart 0.1

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
                if(woCommonInfo.countAll > 0){
                    laborCostsDiag.clearValue();
                    var list = woCommonInfo.workingHoursOfTypes;
                    for(var type in list){
                        var listValue = [Number(list[type]["sum_plan"]), Number(list[type]["sum_labor"])];
                        laborCostsDiag.addValue(list[type]["text"],
                                                listValue
                                                );
                    }
                    laborCostsDiag.update();
                }
            }

            Component.onCompleted: {
                laborCostsDiag.loadValue();
            }
        }
    }
}
