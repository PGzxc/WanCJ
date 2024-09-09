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



<!--v1-->

[v1-home]:resource/v1/v1_home.png