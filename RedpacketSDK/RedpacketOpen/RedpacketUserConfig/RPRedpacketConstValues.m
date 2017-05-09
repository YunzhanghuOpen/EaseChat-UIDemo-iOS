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
NSString *const RedpacketKeyRedpacketTakenMessageSign1  = @"is_open_money_msg";

/**
 *  收到红包消息
 */
NSString *const RedpacketKeyRedpacketSign               = @"is_red_packet_msg";
NSString *const RedpacketKeyRedpacketSign1              = @"is_money_msg";

/**
 *  红包ID
 */
NSString *const RedpacketKeyRedpacketID                 = @"red_packet_id";
NSString *const RedpacketKeyRedpacketID1                = @"ID";

/**
 *  红包的Type类型
 */
NSString *const RedpacketKeyRedapcketType               = @"red_packet_type";

/**
 *  红包的发送方ID
 */
NSString *const RedpacketKeyRedpacketSenderId           = @"red_packet_sender_id";
NSString *const RedpacketKeyRedpacketSenderId1          = @"money_sender_id";



/**
 *  红包的发送方
 */
NSString *const RedpacketKeyRedpacketSenderNickname     = @"red_packet_sender_nickname";
NSString *const RedpacketKeyRedpacketSenderNickname1    = @"money_sender";


/**
 *  红包的接收方ID
 */
NSString *const RedpacketKeyRedpacketReceiverId         = @"red_packet_receiver_id";
NSString *const RedpacketKeyRedpacketReceiverId1        = @"money_receiver_id";

/**
 *  红包的接收方
 */
NSString *const RedpacketKeyRedpacketReceiverNickname   = @"red_packet_receiver_nickname";
NSString *const RedpacketKeyRedpacketReceiverNickname1  = @"money_receiver";

///**
// *  定向红包的接收者id
// */
//NSString *const RedpacketKeyRedapcketToReceiver       = @"special_money_receiver_id";
//NSString *const RedpacketKeyRedapcketToReceiver1       = @"special_money_receiver_id";

/**
 * 红包的名字 **红包
 */
NSString *const RedpacketKeyRedpacketOrgName            = @"red_packet_sponsor_name";
NSString *const RedpacketKeyRedpacketOrgName1           = @"money_sponsor_name";

/**
 *  红包的祝福语
 */
NSString *const RedpacketKeyRedpacketGreeting           = @"red_packet_greeting";
NSString *const RedpacketKeyRedpacketGreeting1          = @"money_greeting";


/**
 *  红包回执消息需要带上红包所在的群组ID
 */
NSString *const RedpacketKeyRedpacketCmdToGroup         = @"red_packet_group_id";
NSString *const RedpacketKeyRedpacketCmdToGroup1        = @"money_from_group_id";


NSString *const RedpacketCMDMessageAction               = @"refresh_red_packet_ack_action";

