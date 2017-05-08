= 环信红包 iOS SDK集成 =

== 集成概述 ==
* 红包SDK分为两个版本，即**钱包版红包SDK**与**支付宝版红包SDK**。
* 使用钱包版红包SDK的用户，可以使用银行卡支付或支付宝支付等第三方支付来发红包；收到的红包金额会进入到钱包余额，并支持提现到绑定的银行卡。
* 使用支付宝版红包SDK的用户，发红包仅支持支付宝支付；收到的红包金额即时入账至绑定的支付宝账号。
* 请选择希望接入的版本并下载对应的SDK进行集成，钱包版红包SDK与支付宝版红包SDK集成方式相同。
* 需要注意的是如果已经集成了钱包版红包SDK，暂不支持切换到支付宝版红包SDK（两个版本不支持互通）。
* [集成演示Demo](https://github.com/YunzhanghuOpen/Redpacket-Demo-iOS)，开发者可以通过此Demo了解iOS红包SDK的集成，集成方式仅供参考。

== 红包开源模块 ==
![红包模块](img/redpacketOpen.png)

=== 红包开源模块介绍 ===

* `RedpacketAliPay` 
    * 为**支付宝版SDK**处理支付宝授权和支付宝支付回调

* `RedpacketJDPay` 
    * 为**钱包版SDK**处理支付宝支付回调

* `RedpacketCell` 
    * 红包SDK内的红包卡片样式

*  `RedpacketCellResource.bundle` 
    *  红包开源部分的资源文件
* `RedpacketChatViewController` 
    * 继承自`ChatViewController`
    * 包含发红包收红包功能
    * 单聊红包包含**小额随机红包**和**普通红包**
    * 群红包包含**定向红包**，**普通红包**和**拼手气红包**
    * 收红包可以接受各种红包类型包含**营销红包**

* `RedpacketUserConfig` 红包SDK初始化文件       
    *  实现红包SDK注册
    *  实现当前用户获取
    *  实现红包SDK初始化和红包IM消息和透传消息处理

== Cocoapods支持 ==

环信Demo分为2个Target
![targets](img/Targets.png)

* `ChatDemo-UI3.0` 默认支持支付宝版红包SDK
* `ChatDemo-UI3.0-JDPay` 支持钱包版SDK

* 修改`Podfile`支持两个红包SDK版本

```
target 'ChatDemo-UI3.0' do
...
...
pod 'RedpacketAliAuthLib'   # 支付宝版红包SDK

end

target 'ChatDemo-UI3.0-JDPay' do
...
...   
    pod 'RedpacketLib' # 钱包版红包SDK

end
```

== 红包功能开关 ==

* 在`ChatDemo-UI3.0-Prefix.pch`文件中有如下宏定义， 注销掉此宏定义则可以关闭红包功能。

``` objc
#define REDPACKET_AVALABLE
```

== 集成准备 ==

=== 导入SDK ===

==== 导入开源模块 ====
* 请在环信Demo中获取`RedpacketSDK`开源部分
* 在工程中导入`RedpacketSDK`开源模块

==== 通过Pod更新红包SDK ====
* 修改Podfile，如果是支付宝版SDK则加入**pod 'RedpacketAliAuthLib'**
* 如果是钱包版SDK则加入**pod 'RedpacketLib'**

=== 通过环信APPKey配置商户信息 ===

* 修改文件`Appdelegate.m`

``` objc
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
...
...

#ifdef REDPACKET_AVALABLE
    /**
     *  TODO: 通过环信的AppKey注册红包
     */
    [[RedPacketUserConfig sharedConfig] configWithAppKey:EaseMobAppKey];
#endif

...
...
```

== 聊天页面实现发红包 ==
* 用带有收发红包功能的`RedPacketChatViewController`替换EaseUI的`ChatViewController`

== 零钱页（钱包版SDK）或者红包记录页（支付宝版SDK）==
* 支付宝版为红包记录
* 钱包版为零钱页
* 在`SettingsViewController.m`中增加此功能

``` objc
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
...
...
#ifdef REDPACKET_AVALABLE
    if (indexPath.section == 0) {
        cell.textLabel.text = @"零钱";
#ifdef AliAuthPay
        cell.textLabel.text = @"红包记录";
#endif
    }else if (indexPath.section == 1) {
#else
    if (indexPath.section == 0) {
#endif
...
...
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
#ifdef REDPACKET_AVALABLE
    if (indexPath.section == 0) {
        /** 如果是钱包版SDK则是零钱页，如果是支付宝版SDK则是红包记录页*/
        [RedpacketViewControl presentChangePocketViewControllerFromeController:self];
        return;
    }
#endif
...
...
```

=== 消息处理 ===

* 修改文件`ChatDemoHelper.m`

==== 监听消息 ====

``` objc
- (void)initHelper
{
#ifdef REDPACKET_AVALABLE
    [[RedPacketUserConfig sharedConfig] beginObserveMessage];
#endif
...
...
}
```

==== 屏闭红包被抢消息的通知 ====

```
#ifdef REDPACKET_AVALABLE
        /**
         *  屏蔽红包被抢消息的提示
         */
        NSDictionary *dict = message.ext;
        needShowNotification = (dict && [dict valueForKey:RedpacketKeyRedpacketTakenMessageSign]) ? NO : needShowNotification;
#endif

```

---

