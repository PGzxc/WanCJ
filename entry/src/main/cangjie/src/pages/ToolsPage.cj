/**
 * Created on 2024/9/8
 */
package ohos_app_cangjie_entry.pages

internal import ohos.base.*
internal import ohos.component.*
internal import ohos.state_manage.*
import ohos.state_macro_manage.*

/**
* Tools工具
*/
@Component
public class ToolsPage {

  func build() {
        Column() {
            Text("ToolsPage")
            .textAlign(TextAlign.Center)
            .fontSize(50)
            .fontColor(0x182431)
            .opacity(0.4)
            .height(100.percent)
        }
        .width(100.percent)
        .height(100.percent)
        .backgroundColor(Color.WHITE)
    }
	
}