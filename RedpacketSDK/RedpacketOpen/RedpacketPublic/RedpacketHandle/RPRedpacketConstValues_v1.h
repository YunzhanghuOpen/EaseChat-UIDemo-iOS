//
//  RPRedpacketConstValues_v1.h
//  ChatDemo-UI3.0
//
//  Created by Mr.Yang on 2017/5/16.
//  Copyright © 2017年 Mr.Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


//  数字1 代表旧版本的常量值， 如果开发者不需要兼容红包的旧版本，则旧版的常量值可以直接删掉
//  此常量值仅用作iOS和Android两边的数据传输， 如果不合适，开发者可以自定义

// 是否是红包消息
UIKIT_EXTERN NSString *const RedpacketKeyRedpacketSign1;
// 是否是红包回执消息
UIKIT_EXTERN NSString *const RedpacketKeyRedpacketTakenMessageSign1;
// 红包ID
UIKIT_EXTERN NSString *const RedpacketKeyRedpacketID1;
// 红包类型 (
UIKIT_EXTERN NSString *const RedpacketKeyRedapcketType1;
// 红包的发送方ID
UIKIT_EXTERN NSString *const RedpacketKeyRedpacketSenderId1;
// 红包的发送方
UIKIT_EXTERN NSString *const RedpacketKeyRedpacketSenderNickname1;
// 红包的接收方ID
UIKIT_EXTERN NSString *const RedpacketKeyRedpacketReceiverId1;
// 红包的接收方
UIKIT_EXTERN NSString *const RedpacketKeyRedpacketReceiverNickname1;
// 定向红包的接收者id
UIKIT_EXTERN NSString *const RedpacketKeyRedapcketToReceiver1;
// 红包的名字（例如：云红包）
UIKIT_EXTERN NSString *const RedpacketKeyRedpacketOrgName1;
// 红包的祝福语
UIKIT_EXTERN NSString *const RedpacketKeyRedpacketGreeting1;
// 红包回执消息需要带上红包所在的群组ID
UIKIT_EXTERN NSString *const RedpacketKeyRedpacketCmdToGroup1;


