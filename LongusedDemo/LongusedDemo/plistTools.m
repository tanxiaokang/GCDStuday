//
//  plistTools.m
//  LongusedDemo
//
//  Created by 三少 on 16/6/30.
//  Copyright © 2016年 Demo. All rights reserved.
//

#import "plistTools.h"
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
static BOOL isRequest; // 默认是0 .记录是不是正在上传数据.(挂起列队用)
static BOOL isOpenSuspend;
@implementation plistTools


//返回一个并行队列,挂起列队使用
+ (dispatch_queue_t )Dispatch_queue_t_q2{
    
    static dispatch_queue_t q2;
    if (!q2) {
        //串行队列  DISPATCH_QUEUE_SERIAL
        //并行队列  DISPATCH_QUEUE_CONCURRENT
        q2 = dispatch_queue_create("com.GNHLog.www", DISPATCH_QUEUE_SERIAL);
    }
    return q2;
}

//返回文件路径
+ (NSString *)standardPlist{
    
    NSString *fileName = nil;
    NSArray *paths= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *path= [paths objectAtIndex:0];
    fileName =[path stringByAppendingPathComponent:@"GNH_log.plist"];
    return fileName;
}

//删除文件
+ (BOOL)removePlist:(NSString *)fileName{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    BOOL isRemove = [fileManager removeItemAtPath:fileName error:&error];
    if (!isRemove) {
        NSLog(@"删除失败");
        return NO;
    }else if (error){
        NSLog(@"\n发生错误:%@\n",error);
        return NO;
    }else{
        return YES;
    }
}

//写入plist方法
+ (void)writePlist:(NSString *)className{
    
    //获取并行队列
    dispatch_queue_t logQueue = [self Dispatch_queue_t_q2];
    
    if (isRequest && !isOpenSuspend) {
        NSLog(@"挂起列队:开启");
        isOpenSuspend = YES;
        dispatch_suspend(logQueue);
    }
    NSString *visitTime = [plistTools createTimeNew];
    dispatch_async(logQueue, ^{
        
        [self writePlistWithClassName:className VisitTime:visitTime];
    });
}
//写入plist过程
+ (void)writePlistWithClassName:(NSString *)className VisitTime:(NSString *)visitTime{
    NSString *pageCode = className;
    
    NSString *fileName = [plistTools standardPlist];

    NSDictionary *dic = @{@"visitTime": !visitTime ? @"0" : visitTime,
                          @"pageCode" : !pageCode  ? @"0" : pageCode,
                          @"lng":@"0",@"lat":@"0"};
    
    NSMutableArray *mArray = [NSMutableArray arrayWithContentsOfFile:fileName];
    if (!mArray) mArray = [NSMutableArray new];
    [mArray addObject:dic];
    BOOL isWrite = [mArray writeToFile:fileName atomically:YES];
    
    NSLog(@"写入:%@\n%@\n统计到的页面个数:%lu\n时间:%@:\n",isWrite == YES ? @"成功" : @"失败",fileName,(unsigned long)[mArray count],visitTime);
  
    NSLog(@"%d",isRequest);
    
}
+ (void)Request{
   
    isRequest = YES;
    NSLog(@"模拟网络请求:开始请求 ps:时间为10S");
    [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(runs) userInfo:nil repeats:NO];
}
+ (void)runs{
    dispatch_queue_t logQueue = [self Dispatch_queue_t_q2];
    dispatch_resume(logQueue);
    isRequest = NO;
    isOpenSuspend = NO;
    NSLog(@"模拟网络请求:请求结束");
    NSLog(@"挂起列队:关闭");
}
//时间相关
+ (NSString *)createTimeNew{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateStr = [formatter stringFromDate:[NSDate date]];
    return dateStr;
}

//返回现在的时间戳,本地时间
+ (NSString *)createTimestamp{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateStr = [formatter stringFromDate:[NSDate date]];
    NSString *timestampStr = [plistTools XKDateToolsStringFromOldString:dateStr];
    return timestampStr;
}

+ (NSDate *)XKDateToolsDateFromString:(NSString *)string
{
    //设置转换格式
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date=[formatter dateFromString:string];
    return date;
}

/**
 NSString转时间戳
 string: 2016-05-19 00:00:00
 */
+ (NSString *)XKDateToolsStringFromOldString:(NSString *)string{
    
    NSTimeInterval a = [[self XKDateToolsDateFromString:string] timeIntervalSince1970];
    return [NSString stringWithFormat:@"%8.f", a];
}

-(void)dealloc{
    
}

@end
/**
 *  获取高优先级方法    dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);

 */
/**
 *  获取默认优先级方法   dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
 */
/**
 *  获取低优先级方法    dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0);
 */

/**
 *  获取后台优先级方法   dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
 */


/**
 *  串行队列 dispatch_queue_t queue = dispatch_queue_create("串行队列", DISPATCH_QUEUE_SERIAL);
    
    dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL)获取当前队列的名字
    DISPATCH_QUEUE_SERIAL或者NULL表示该队列是串行队列，
    DISPATCH_QUEUE_CONCURRENT表示该队列是并发队列。
 */

/*  用次方法在存储到plist时,lat存不进去.未弄清楚原因
 
         NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                               visitTime==nil ? @"0" : visitTime,@"visitTime",
                               @"pageCode",pageCode==nil ? @"0" : pageCode,
                               @"lng",@"0",
                               @"lat",@"0"
                               ,nil];
 
 */