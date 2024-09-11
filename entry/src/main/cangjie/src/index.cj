package ohos_app_cangjie_entry

import ohos.base.*
import ohos.component.*
import ohos.state_manage.*
import ohos.state_macro_manage.*
import ohos_app_cangjie_entry.pages.*
import ohos.router.*
import std.collection.*
import encoding.json.*
import serialization.serialization.*
import ohos.hilog.*
import ohos.resource_manager.*

@Entry
@Component
class MyView {
     var controller: TabsController = TabsController()
     @State var currentIndex: Int32 = 0

    func build() {
        Column() {
            Tabs(BarPosition.End, this.controller) {
                TabContent {
                    HomePage()
                }
                .tabBar(icon: if(this.currentIndex == 0){ getResourceMedia(@r(app.media.ic_home_selected))} else {getResourceMedia(@r(app.media.ic_home))}, text: "首页").backgroundColor(0xF5F5F5)
                .id("tab0")
                TabContent {
                    RoutePage()
                }
                .tabBar(icon: if(this.currentIndex == 1){ getResourceMedia(@r(app.media.ic_route_selected))} else {getResourceMedia(@r(app.media.ic_route))}, text: "路线")
                .id("tab1")
                TabContent() {
                    ToolsPage()
                }
                .tabBar(icon: if(this.currentIndex == 2){ getResourceMedia(@r(app.media.ic_tools_selected))} else {getResourceMedia(@r(app.media.ic_tools))}, text: "工具")
                .id("tab2")
                TabContent() {
                    MePage()
                }
                .tabBar(icon: if(this.currentIndex == 3){ getResourceMedia(@r(app.media.ic_me_selected))} else {getResourceMedia(@r(app.media.ic_me))}, text: "我的")
                .id("tab3")
            }
            .vertical(false)
            .scrollable(true)
            .barMode(BarMode.Fixed)
            .barWidth(100.percent)
            .barHeight(70)
            .animationDuration(400)
            .width(100.percent)
            .backgroundColor(Color.WHITE) //Bar背景色
            .onChange({index: Int32  => this.currentIndex = index})
        }
        .width(100.percent)
        .height(100.percent)
        .backgroundColor(0xFFF)
        .margin(top: 5)
    }
}
