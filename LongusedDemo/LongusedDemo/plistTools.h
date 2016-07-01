//
//  plistTools.h
//  LongusedDemo
//
//  Created by 三少 on 16/6/30.
//  Copyright © 2016年 Demo. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSUInteger, GNHStatisticType) {
    GNHStatisticTypeSuccess,            //成功
    GNHStatisticTypeFileRemoveError,    //文件删除失败
    GNHStatisticTypeRequestError,
    GNHStatisticType1,
    GNHStatisticType2,
    GNHStatisticType3
};
@interface plistTools : NSObject
+ (dispatch_queue_t )Dispatch_queue_t_q2;
/**
 返回文件路径
 */
+ (NSString *)standardPlist;
/** 
 写入Plist
 */
/**
 上传数据
 */
+ (void)Request;

+ (void)writePlist:(NSString *)className;
//log用到的时间
+ (NSString *)createTimestamp;
+ (NSDate *)XKDateToolsDateFromString:(NSString *)string;
+ (NSString *)XKDateToolsStringFromOldString:(NSString *)string;

@end
