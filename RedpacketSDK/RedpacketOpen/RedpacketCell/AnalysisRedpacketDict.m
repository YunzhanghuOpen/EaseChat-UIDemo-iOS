//
//  AnalysisRedpacketDict.m
//  ChatDemo-UI3.0
//
//  Created by Mr.Yan on 2017/5/11.
//  Copyright © 2017年 Mr.Yan. All rights reserved.
//

#import "AnalysisRedpacketDict.h"

@implementation AnalysisRedpacketDict

+ (AnalysisRedpacketDict *)AnalysisRedpacketWithModel:(id<IMessageModel>)model;
{
    AnalysisRedpacketDict *analysisModel = [[AnalysisRedpacketDict alloc]init];
    [analysisModel configWithModel:model];
    return analysisModel;
}

- (void)configWithModel:(id<IMessageModel>)model
{
    NSDictionary *redpacketDict = model.message.ext;
    _isSender  = model.isSender;
    _greeting  = redpacketDict[@"money_greeting"];
    
    if ([redpacketDict[@"money_type_special"] isEqualToString:@"member"]) {
        _redpacketType = RPRedpacketTypeGoupMember;
    } if ([redpacketDict[@"money_type_special"] isEqualToString:@"const"]) {
        _redpacketType = RPRedpacketTypeAmount;
    }
    
}

+ (MessageCellType)messageCellTypeWithDict:(NSDictionary *)dict
{
    if ([dict objectForKey:@"is_money_msg"]) {
        return MessageCellTypeRedpaket;
    }
    if ([dict objectForKey:@"is_open_money_msg"]) {
        return MessageCellTypeRedpaketTaken;
    }
    return MessageCellTypeNoRedpacket;
}

@end
