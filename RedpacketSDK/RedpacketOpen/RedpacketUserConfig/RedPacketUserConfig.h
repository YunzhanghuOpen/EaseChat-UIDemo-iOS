//
//  YZHUserConfig.h
//  ChatDemo-UI3.0
//
//  Created by Mr.Yang on 16/3/8.
//  Copyright © 2016年 Mr.Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChatViewController.h"

//  红包状态
typedef NS_ENUM(NSInteger, MessageCellType) {
    
    MessageCellTypeRedpaket         = 2009,        /***  红包消息*/
    MessageCellTypeRedpaketTaken,                  /***  红包被抢消息*/
    MessageCellTypeNoRedpacket                     /***  不是红包消息*/
    
};

/**
 *  @description: 红包用户配置服务
 *  1.获取当前用户的信息
 *  2.注册红包服务
 *  3.检测用户登陆状态
 */

@interface RedPacketUserConfig : NSObject

+ (RedPacketUserConfig *)sharedConfig;

@property (nonatomic, weak)ChatViewController *chatVC;

/**
 *  配置环信IM分配的AppKey
 *
 *  @param appKey 环信IM分配的AppKey
 */
- (void)configWithAppKey:(NSString *)appKey;

/**
 *  监控信息收发
 */
- (void)beginObserveMessage;

+ (MessageCellType)messageCellTypeWithDict:(NSDictionary *)dict;

@end
