//
//  AnalysisRedpacketModel.m
//  ChatDemo-UI3.0
//
//  Created by Mr.Yan on 207/5/.
//  Copyright © 207年 Mr.Yan. All rights reserved.
//

#import "AnalysisRedpacketModel.h"
#import "RPRedpacketConstValues.h"


@implementation RPUser


@end


@implementation AnalysisRedpacketModel

+ (MessageCellType)messageCellTypeWithDict:(NSDictionary *)dict
{
    if ([dict objectForKey:RedpacketKeyRedpacketSign] ||
        [dict objectForKey:RedpacketKeyRedpacketSign]) {
        
        return MessageCellTypeRedpaket;
        
    } else if ([dict objectForKey:RedpacketKeyRedpacketTakenMessageSign] ||
               [dict objectForKey:RedpacketKeyRedpacketTakenMessageSign]) {
        
        return MessageCellTypeRedpaketTaken;
        
    }
    
    return MessageCellTypeUnknown;
}

+ (AnalysisRedpacketModel *)analysisRedpacketWithDict:(NSDictionary *)dict
                                          andIsSender:(BOOL)isSender
{
    MessageCellType type = [self messageCellTypeWithDict:dict];
    if (type == MessageCellTypeUnknown) {
        
        return nil;
        
    }
    
    AnalysisRedpacketModel *analysisModel = [AnalysisRedpacketModel new];
    
    [analysisModel configWithModel:dict
                          isSender:isSender
                    andMessageType:type];
    
    return analysisModel;
}

- (void)configWithModel:(NSDictionary *)dict
               isSender:(BOOL)isSender
         andMessageType:(MessageCellType)messageType
{
    _type = messageType;
    if (dict[RedpacketKeyRedpacketGreeting]) {
        _greeting  = dict[RedpacketKeyRedpacketGreeting];
    } else {//  兼容旧版本
        _greeting  = dict[RedpacketKeyRedpacketGreeting];
    }    _isSender = isSender;
    _redpacketOrgName = @"云账户";
    
    //   || 运算符后为兼容旧版本
    if ([dict[RedpacketKeyRedapcketType] isEqualToString:RedpacketKeyRedpacketMember]) {
        
        _redpacketType = RPRedpacketTypeGoupMember;
        
    }else if ([dict[RedpacketKeyRedapcketType] isEqualToString:RedpacketKeyRedpacketConst] || [dict[RedpacketKeyRedapcketType] isEqualToString:RedpacketKeyRedpacketConst]) {
        
        _redpacketType = RPRedpacketTypeAmount;
        
    }
    
    //  sender
    RPUser *sender = [RPUser new];
    sender.userID = dict[RedpacketKeyRedpacketSenderId];
    
    if (sender.userID.length == 0) {
        sender.userID = dict[RedpacketKeyRedpacketSenderId];
    }
    
    sender.userName = dict[RedpacketKeyRedpacketSenderNickname];
    if (sender.userName.length == 0) {
        sender.userName = dict[RedpacketKeyRedpacketSenderNickname];
    }
    
    self.sender = sender;
    
    //  receiver
    RPUser *receiver = [RPUser new];
    
    receiver.userID = dict[RedpacketKeyRedpacketReceiverId];
    if (receiver.userID.length == 0) {
        receiver.userID = dict[RedpacketKeyRedpacketReceiverId];
    }
    
    receiver.userName = dict[RedpacketKeyRedpacketReceiverNickname];
    if (receiver.userName.length == 0) {
        receiver.userName = dict[RedpacketKeyRedpacketReceiverNickname];
    }
    
    self.receiver = receiver;
}


- (RPRedpacketType)redpacketTypeWithString:(NSString *)type
{
    RPRedpacketType rpType = 0;
    
    if (type == RedpacketKeyRedpacketMember) {
        
        rpType = RPRedpacketTypeGoupMember;
        
    }else if (type == RedpacketKeyRedpacketConst) {
        
        rpType = RPRedpacketTypeAmount;
        
    }else if (type == RedpacketKeyRedpacketGroupRand) {
    
        rpType = RPRedpacketTypeGroupRand;
        
    }else if (type == RedpacketKeyRedpacketGroupAvg) {
        
        rpType = RPRedpacketTypeGroupAvg;
        
    }else if (type == RedpacketKeyRedpacketAdvertisement) {
        
        rpType = RPRedpacketTypeAdvertisement;
        
    }else if (type == RedpacketKeyRedpacketSystem) {
    
        rpType = RPRedpacketTypeSystem;
        
    }else {
    
        rpType = RPRedpacketTypeSingle;
        
    }

    return rpType;
}

@end
