/**
 * Created on 2024/9/10
 */
package ohos_app_cangjie_entry.utils
import std.regex.* //正则
import std.collection.*
import ohos_app_cangjie_entry.bean.*
import serialization.serialization.*
import std.math.*
import encoding.json.*
import std.collection.*

public class Utils {
    //单例
    private Utils(){}
    private static var instance:Utils = Utils()
    public static func  getInstance():Utils{
        return instance
    }

    //1-判断是否为空
    public static func isEmpty<T>(data: Any) {
        if (data is String) {
            return (data as String).getOrThrow().isEmpty()
        } else if (data is Array<T>) {
            return (data as Array<T>).getOrThrow().isEmpty()
        } else if (data is ArrayList<T>) {
            return (data as ArrayList<T>).getOrThrow().isEmpty()
        } else {
            return false
        }
    }

    //2-获取Article用户名
    public static func getArticleUser(articleItem:ArticleItem):String{

        if(isEmpty<String>(articleItem.author)){
            return articleItem.shareUser
        }
        if(isEmpty<String>(articleItem.shareUser)){
            return articleItem.author
        }
        return "--"
    }
    //3-获取String类型名
    public static func getNamebyString(name:String):String{

        if (!isEmpty<String>(name)){
            return name
        }
        return ""
    }

    //4-序列化：String->JsonObject
    public static func String2JsonObject(str:String):JsonObject{

        var jsobj:JsonObject = JsonObject();
        try {
        	    var jsv:JsonValue = JsonValue.fromStr(str);
                jsobj = (jsv as JsonObject).getOrThrow();
          }catch (exception:Exception) {
        	println(exception.toString())
        }
        return jsobj
    }
    //5-序列化：JsonObject->Bean
    public static func JsonObject2Bean<T>(jo:JsonObject) :T where T <:BaseBean {
        var baseBean:BaseBean
        var jve =JsonValue.fromStr(jo.toString())
        var dml = DataModel.fromJson(jve)
        baseBean =  T.deserialize(dml)
        return (baseBean as T).getOrThrow();

    }
    //6-序列化：JsonObject->ResponseResult
    public static func JsonObject2ResponseResult<T>(jo:JsonObject) :ResponseResult<T> where T <:Serializable<T> {
        var responseResult:ResponseResult<T>
        var jve =JsonValue.fromStr(jo.toString())
        var dml = DataModel.fromJson(jve)
        responseResult =  ResponseResult<T>.deserialize(dml)
        return responseResult;
    }

    //7-拼接跳转URl
    public static func getWebURL(title:String,url:String){
         var str:String = "{\"title\": \"${title}\",\"url\":\"${url}\"}"
         return str
    }
    //8-数据返回结果
    public static func getResult(errorCode:Int64,errorMsg:String,data:String){
         var str:String = "{\"errorCode\": \"${errorCode}\",\"errorMsg\":\"${errorMsg}\",\"data\":\"${data}\"}"
         return str
    }

    //2-格式化字符串
    public static func formatHtml(html:String){
        var data:String = ""
        if (!isEmpty(html)){
            var regSymbol = Regex("&.*;")
            var regHtml = Regex("/<[^>]*>/g")
           // data = regHtml.matcher(html).find().toString()

        }
        return data
    }
}
