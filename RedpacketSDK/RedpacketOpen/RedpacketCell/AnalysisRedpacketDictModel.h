//
//  AnalysisRedpacketDictModel.h
//  ChatDemo-UI3.0
//
//  Created by Mr.Yan on 2017/5/11.
//  Copyright © 2017年 Mr.Yan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IMessageModel.h"
#import "RPRedpacketModel.h"

//  红包状态
typedef NS_ENUM(NSInteger, MessageCellType) {
    
    MessageCellTypeRedpaket         = 2009,        /***  红包消息*/
    MessageCellTypeRedpaketTaken,                  /***  红包被抢消息*/
    MessageCellTypeNoRedpacket                     /***  不是红包消息*/
    
};


@interface AnalysisRedpacketDictModel : NSObject

+ (AnalysisRedpacketDictModel *)AnalysisRedpacketWithModel:(id<IMessageModel>)mode;

/* 红包cell展示语句 */
@property (nonatomic, readonly) NSString *greeting;

/* 是不是消息发送者 */
@property (nonatomic, assign, readonly) BOOL isSender;

/* 红包类型 */
@property (nonatomic, assign, readonly) RPRedpacketType redpacketType;

/* 返回红包消息类型 */
+ (MessageCellType)messageCellTypeWithDict:(NSDictionary *)dict;

@end
