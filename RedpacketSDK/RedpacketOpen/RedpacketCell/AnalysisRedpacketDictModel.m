//
//  AnalysisRedpacketDictModel.m
//  ChatDemo-UI3.0
//
//  Created by Mr.Yan on 2017/5/11.
//  Copyright © 2017年 Mr.Yan. All rights reserved.
//

#import "AnalysisRedpacketDictModel.h"
#import "RPRedpacketConstValues.h"

@implementation AnalysisRedpacketDictModel

+ (AnalysisRedpacketDictModel *)AnalysisRedpacketWithModel:(id<IMessageModel>)model;
{
    AnalysisRedpacketDictModel *analysisModel = [[AnalysisRedpacketDictModel alloc]init];
    [analysisModel configWithModel:model];
    return analysisModel;
}

- (void)configWithModel:(id<IMessageModel>)model
{
    NSDictionary *redpacketDict = model.message.ext;
    _isSender  = model.isSender;
    _greeting  = redpacketDict[RedpacketKeyRedpacketGreeting];
    
    if ([redpacketDict[RedpacketKeyRedapcketType] isEqualToString:@"member"]) {
        _redpacketType = RPRedpacketTypeGoupMember;
    } if ([redpacketDict[RedpacketKeyRedapcketType] isEqualToString:@"const"]) {
        _redpacketType = RPRedpacketTypeAmount;
    }
    
}

+ (MessageCellType)messageCellTypeWithDict:(NSDictionary *)dict
{
    if ([dict objectForKey:RedpacketKeyRedpacketSign]||[dict objectForKey:RedpacketKeyRedpacketSign1]) {
        return MessageCellTypeRedpaket;
    }
    if ([dict objectForKey:RedpacketKeyRedpacketTakenMessageSign]) {
        return MessageCellTypeRedpaketTaken;
    }
    return MessageCellTypeNoRedpacket;
}

@end
