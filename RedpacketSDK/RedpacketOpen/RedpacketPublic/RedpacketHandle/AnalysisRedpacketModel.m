//
//  AnalysisRedpacketModel.m
//  ChatDemo-UI3.0
//
//  Created by Mr.Yan on 2017/5/11.
//  Copyright © 2017年 Mr.Yan. All rights reserved.
//

#import "AnalysisRedpacketModel.h"
#import "RPRedpacketConstValues.h"
#import "RPRedpacketConstValues_v1.h"


@implementation RPUser


@end


@implementation AnalysisRedpacketModel

+ (MessageCellType)messageCellTypeWithDict:(NSDictionary *)dict
{
    if ([dict objectForKey:RedpacketKeyRedpacketSign] ||
        [dict objectForKey:RedpacketKeyRedpacketSign1]) {
        
        return MessageCellTypeRedpaket;
        
    } else if ([dict objectForKey:RedpacketKeyRedpacketTakenMessageSign] ||
               [dict objectForKey:RedpacketKeyRedpacketTakenMessageSign1]) {
        
        return MessageCellTypeRedpaketTaken;
        
    }
    
    return MessageCellTypeUnknown;
}

+ (AnalysisRedpacketModel *)AnalysisRedpacketWithDict:(NSDictionary *)dict
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
    _greeting  = dict[RedpacketKeyRedpacketGreeting];
    _isSender = isSender;
    
    
    if ([dict[RedpacketKeyRedapcketType] isEqualToString:RedpacketKeyRedpacketMember]) {
        
        _redpacketType = RPRedpacketTypeGoupMember;
        
    }else if ([dict[RedpacketKeyRedapcketType] isEqualToString:RedpacketKeyRedpacketConst]) {
        
        _redpacketType = RPRedpacketTypeAmount;
        
    }
    
    //  sender
    RPUser *sender = [RPUser new];
    sender.userID = dict[RedpacketKeyRedpacketSenderId];
    
    if (sender.userID.length == 0) {
        sender.userID = dict[RedpacketKeyRedpacketSenderId1];
    }
    
    sender.userName = dict[RedpacketKeyRedpacketSenderNickname];
    if (sender.userName.length == 0) {
        sender.userName = dict[RedpacketKeyRedpacketSenderNickname1];
    }
    
    self.sender = sender;
    
    //  receiver
    RPUser *receiver = [RPUser new];
    
    receiver.userID = dict[RedpacketKeyRedpacketReceiverId];
    if (receiver.userID.length == 0) {
        receiver.userID = dict[RedpacketKeyRedpacketReceiverId1];
    }
    
    receiver.userName = dict[RedpacketKeyRedpacketReceiverNickname];
    if (receiver.userName.length == 0) {
        receiver.userName = dict[RedpacketKeyRedpacketReceiverNickname1];
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
