//
//  RPRedpacketUnionHandle.h
//  ChatDemo-UI3.0
//
//  Created by Mr.Yang on 2017/5/9.
//  Copyright © 2017年 Mr.Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RPRedpacketModel.h"


@interface RPRedpacketUnionHandle : NSObject

//  生成通道中传输的Dict (兼容旧版本)
+ (NSDictionary *)dictWithRedpacketModel1:(RPRedpacketModel *)model
                             isACKMessage:(BOOL)isAckMessage;

//  生成通道中传输的Dict （新版本）
+ (NSDictionary *)dictWithRedpacketModel:(RPRedpacketModel *)model
                            isACKMessage:(BOOL)isAckMessage;

//  IM通道中传入的Dict (兼容旧版本)
+ (RPRedpacketModel *)modelWithChannelRedpacketDic1:(NSDictionary *)redpacketDic
                                          andSender:(RPUserInfo *)sender;


@end
