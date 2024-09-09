/**
 * Created on 2024/9/8
 */
package ohos_app_cangjie_entry.pages

internal import ohos.base.*
internal import ohos.component.*
internal import ohos.state_manage.*
import ohos.state_macro_manage.*

/**
* Route路线
*/
@Component
public class RoutePage {

  func build() {
        Column() {
            Text("RoutePage")
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