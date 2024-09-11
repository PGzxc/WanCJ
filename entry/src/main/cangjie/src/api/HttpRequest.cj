/**
 * Created on 2024/9/6
 */
package ohos_app_cangjie_entry.api
import ohos.net.http.*
import ohos.base.*
import std.collection.*
import ohos_app_cangjie_entry.bean.*
import ohos.hilog.*
import std.time.*
import std.sync.*
import ohos.state_manage.*


public interface  HttpRequest {

      static func testURL():ResponseResult<HarmonyData>{
        return HttpService<HarmonyData>.getInstance().httpRequestGet(HttpConfig.testURL)
      }
      static func homeList():ResponseResult<SearchData>{
            return HttpService<SearchData>.getInstance().httpRequestPost(HttpConfig.homeArticleList, "k=鸿蒙")
      }
}

