# lebs

该项目使用来示例GetX在项目中的使用以及规范

一、GetX
1、、关于Get的使用示例可以参考SplashPage
2、GetX使用参考文章

3、注意事项
当Controller 与ListView、IndexedStack使用的时候，尽量使用GetBuilder.
Getx中的状态管理有两种方式：
a、简单状态管理，通常调用GetBuilder，底层是也是调用setstate通知刷新。
b、反应式状态管理（GetX/Obx）

4、可以选择部分Controller管理部分全局共享的状态。比如用户登录的信息。

5、可以结合EventBus,解决因一下事件的发生，导致数据需要改变的情况。
可以用来处理程序中的事件流（controller中可以认为是数据流）

二、项目规则约束
1、项目目录
lib/widget 存放公共的widget
lib/modules ui
lib/modules/../controllers 控制器
lib/modules/../view  界面或者widget

2、弹窗及toast可以使用bot_toast
