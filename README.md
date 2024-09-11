# WanCJ(玩仓颉)
## 一 开发环境

* 操作系统：Windows 11 专业版 23H2
* 开发工具：DevEco Studio NEXT Bet1 5.0.3.800 版本
* 插件：Cangjie Support Plugin(5.0.3.800)
* 编译SDK：5.0.0(12)
* 开发语言：仓颉(.cj)
* node.js：v18.18.2
* hvigor:1.0.5

## 二 鸿蒙(ArkTS)转仓颉(cj)准备

### 2.1 基础开发入门

#### 学习仓颉编程语言开发指南

### 2.2 仓颉应用开发

#### 2.2.1 UI组件

基础+容器组件变化不大，部分仅属性和方法有所不同

#### 2.2.2  状态管理

同原来：@Link、@Prop、@State、@Observed和@Publish、@Provide和@Consume、@Watch

#### 2.2.3 数据类(序列化)

```
class Location <: Serializable<Location>{
    func serialize(): DataModel
    static func deserialize(dm: DataModel): T
}
```

#### 2.2.4 本地资源导入

```
getResourceXXX
@r(app.media.ic_cangjie)
```

#### 2.2.5 页面跳转及导航

```
import ohos.router.*
```

## 三 开发进度

### 3.1 v1.0

* 底部导航框架使用：Tabs+TabContent
* src/pages中添加HomePage(首页)、RoutePage(路线)、ToolsPage(工具)、MePage(我的)页面
* module.json5修改应用名称和启动图标

图示

![v1-home](resource\v1\v1-home.png)

### 3.2 v2.0

* 网络请求框架封装(HttpRequest+HttpService)
* 网络请求结果序列化及工具类(String->JsonObject)、(JsonObject->Bean)
* 自定义工具栏组件TitleBar
* 首页显示

图示

![v2-home](resource\v2\v2-home.png)

### 3.3 v3.0

* 工具页面(网络请求+解析+显示)

图示

![v3-tool](resource\v3\v3.0-tool.png)

### 3.4 v4.0

* 路线修改为课程
* 课程页面完成

图示

![v4-course](resource\v4\v4-course.png)





[v1-home]:resource/v1/v1_home.png
[v2-home]:resource/v2/v2_home.png
[v3-tool]:resource/v3/v3.0-tool.png
[v4-course]:resource/v4/v4-course.png