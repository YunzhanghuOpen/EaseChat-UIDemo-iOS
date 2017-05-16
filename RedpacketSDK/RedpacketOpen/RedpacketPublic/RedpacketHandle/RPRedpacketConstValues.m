//
//  RPRedpacketConstValues.m
//  Description
//
//  Created by Mr.Yang on 2017/4/21.
//  Copyright © 2017年 Mr.Yang. All rights reserved.
//

#import "RPRedpacketConstValues.h"

/**
 *  红包被打开的消息
 */
NSString *const RedpacketKeyRedpacketTakenMessageSign   = @"is_red_packet_ack_msg";

/**
 *  收到红包消息
 */
NSString *const RedpacketKeyRedpacketSign               = @"is_red_packet_msg";

/**
 *  红包ID
 */
NSString *const RedpacketKeyRedpacketID                 = @"red_packet_id";

/**
 *  红包的Type类型
 */
NSString *const RedpacketKeyRedapcketType               = @"red_packet_type";

/**
 *  红包的发送方ID
 */
NSString *const RedpacketKeyRedpacketSenderId           = @"red_packet_sender_id";

/**
 *  红包的发送方
 */
NSString *const RedpacketKeyRedpacketSenderNickname     = @"red_packet_sender_nickname";


/**
 *  红包的接收方ID
 */
NSString *const RedpacketKeyRedpacketReceiverId         = @"red_packet_receiver_id";

/**
 *  红包的接收方
 */
NSString *const RedpacketKeyRedpacketReceiverNickname   = @"red_packet_receiver_nickname";

/**
 * 红包的名字 **红包
 */
NSString *const RedpacketKeyRedpacketOrgName            = @"red_packet_sponsor_name";

/**
 *  红包的祝福语
 */
NSString *const RedpacketKeyRedpacketGreeting           = @"red_packet_greeting";


/**
 *  红包回执消息需要带上红包所在的群组ID
 */
NSString *const RedpacketKeyRedpacketCmdToGroup         = @"red_packet_group_id";


//------------------------------
// 红包类型
//------------------------------

//  定向红包
NSString *const RedpacketKeyRedpacketMember             = @"member";

//  小额随机红包
NSString *const RedpacketKeyRedpacketConst              = @"const";

//  群平均红包
NSString *const RedpacketKeyRedpacketGroupAvg           = @"avg";
//  群随机红包
NSString *const RedpacketKeyRedpacketGroupRand          = @"rand";
//  广告红包
NSString *const RedpacketKeyRedpacketAdvertisement      = @"advertisement";
//  系统红包
NSString *const RedpacketKeyRedpacketSystem             = @"randpri";


NSString *const RedpacketCMDMessageAction               = @"refresh_red_packet_ack_action";
