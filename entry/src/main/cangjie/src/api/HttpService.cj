/**
 * Created on 2024/9/9
 */
package ohos_app_cangjie_entry.api
import ohos.net.http.*
import ohos.base.*
import std.collection.*
import ohos_app_cangjie_entry.bean.*
import ohos_app_cangjie_entry.utils.*
import ohos.hilog.*
import std.time.*
import std.sync.*
import ohos.state_manage.*
import serialization.serialization.*
import std.math.*
import encoding.json.*
import std.collection.*

public class  HttpService<T> where T<:Serializable<T>{
    var responseResult = ResponseResult<T>()
    //单例
    private HttpService(){}
    private static var instance:HttpService<T> = HttpService<T>()
    public static func  getInstance():HttpService<T>{
        return instance
    }

    //get请求
    func httpRequestGet(url:String):ResponseResult<T>{
        let option = HttpRequestOptions(
                method: RequestMethod.GET, // 可选，默认为http.RequestMethod.GET
                expectDataType: HttpDataType.STRING, // 可选，指定返回数据的类型
                usingCache: true, // 可选，默认为true
                priority: 1, // 可选，默认为1
                // 开发者根据自身业务需要添加header字段
                header: HashMap<String, String>([("content-type", "application/json")]),
                readTimeout: 60000, // 可选，默认为60000ms
                connectTimeout: 60000, // 可选，默认为60000ms
                usingProtocol: HttpProtocol.HTTP1_1, // 可选，协议类型默认值由系统自动指定
                usingProxy: UsingProxy.USE_DEFAULT, //可选，默认不使用网络代理，自API 10开始支持该属性
            )
       return httpRequest(url, option)
    }
    //post请求
   public func httpRequestPost(url:String,params:String):ResponseResult<T>{
        let option = HttpRequestOptions(
                method: RequestMethod.POST, // 可选，默认为http.RequestMethod.GET
                extraData: HttpData.STRING_DATA(params),
                expectDataType: HttpDataType.STRING, // 可选，指定返回数据的类型
                // 开发者根据自身业务需要添加header字段
                //header: HashMap<String, String>([("content-type", "application/json")]),
                readTimeout: 60000, // 可选，默认为60000ms
                connectTimeout: 60000, // 可选，默认为60000ms
            )
       return  httpRequest(url, option)
    }

    func httpRequest(url:String,option:HttpRequestOptions):ResponseResult<T>{
        let httpRequest = createHttp();
        try {
             // Hilog.info(0, "test", "resp===: 开始请求")
              httpRequest.request(url, {err, resp =>
              if (let Some(e) <- err) {
                        Hilog.info(1, "test","exception: ${e.message}")
                        var jo =  Utils.String2JsonObject(Utils.getResult(400, e.message, ""))
                        this.responseResult=  Utils.JsonObject2ResponseResult<T>(jo)
             }
              if (let Some(r) <- resp) {
                  Hilog.info(1, "test", "resp===: ${r.result}")
                  //if(r.responseCode==
                         var jo =  Utils.String2JsonObject(r.result.toString())
                         this.responseResult=  Utils.JsonObject2ResponseResult<T>(jo)

              } else {
                  Hilog.info(1, "test", "response is none")
                        var jo =  Utils.String2JsonObject(Utils.getResult(404, "response is none", ""))
                        this.responseResult=  Utils.JsonObject2ResponseResult<T>(jo)
              }
                   httpRequest.destroy()
              }, options: option)
             sleep(Duration.second * 1)
             //Hilog.info(0, "test", "resp===: 结束请求")
             return responseResult
        }catch (exception:Exception) {
                  var jo =  Utils.String2JsonObject(Utils.getResult(500, "${exception.message}", "出错了"))
                  this.responseResult=  Utils.JsonObject2ResponseResult<T>(jo)
              return responseResult
        }finally {
            //sleep(Duration.second * 1)
            //return responseResult
        }
    }
}