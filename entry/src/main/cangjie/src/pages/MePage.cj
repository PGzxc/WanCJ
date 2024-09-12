/**
 * Created on 2024/9/8
 */
package ohos_app_cangjie_entry.pages

internal import ohos.base.*
internal import ohos.component.*
internal import ohos.state_manage.*
import ohos.state_macro_manage.*
import cj_res_entry.app //用于导入@r


/**
* Me我
*/
@Component
public class MePage {

  func build() {
          Column() {
            MineHead()
            MineSettings()
        }
        .width(100.percent)
        .height(100.percent)
        .backgroundColor(Color.WHITE)
    }
	
}