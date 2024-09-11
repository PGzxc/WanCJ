/**
 * Created on 2024/9/8
 */
package ohos_app_cangjie_entry.pages

internal import ohos.base.*
internal import ohos.component.*
internal import ohos.state_manage.*
import ohos_app_cangjie_entry.api.*
import ohos_app_cangjie_entry.bean.*
import ohos_app_cangjie_entry.utils.*
import ohos.state_macro_manage.*
import std.collection.*
import ohos.hilog.*
import std.collection.*
import encoding.json.*
import serialization.serialization.*
/**
* Route路线
*/
@Component
public class RoutePage {

 @State var datas: ArrayList<DataItem> = ArrayList<DataItem>()

    protected override func aboutToAppear() {
        var toolsResult = HttpRequest.getChapter()
        this.datas = toolsResult.data.getOrThrow()
        Hilog.debug(1, "test", "tools=${datas.size.toString()}")
    }

    func build() {
        Column() {
         List( space: 0, initialIndex: 0 ) {
             if(this.datas.size>0){
                        ForEach(this.datas, itemGeneratorFunc: { dataItem:DataItem,index:Int64 =>
                                ListItem(){
                                    ChapterItemView(dataItem:dataItem)
                                }.onClick{ evt =>
                                }
                            })
                    }

            }
            .listDirection(Axis.Vertical) // 排列方向
            .scrollBar(BarState.Off)
            .edgeEffect(EdgeEffect.Spring) // 边缘效果设置为Spring
            .width(100.percent)

        }
        .width(100.percent)
        .height(100.percent)
        .backgroundColor(0xFFFFFF)
        .padding(top: 5.px)
    }
	
}