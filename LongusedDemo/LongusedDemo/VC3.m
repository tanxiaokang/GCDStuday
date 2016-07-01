//
//  VC3.m
//  LongusedDemo
//
//  Created by 三少 on 16/6/29.
//  Copyright © 2016年 Demo. All rights reserved.
//
#import "AppDelegate.h"
#import "VC3.h"
#import "plistTools.h"
@interface VC3 ()

@end

@implementation VC3{
    dispatch_queue_t q1;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    q1 = dispatch_queue_create("log", DISPATCH_QUEUE_CONCURRENT);
//    
//    dispatch_suspend(q1);
//    
//    for (int i=0; i<10; i++) {
//     
//        NSLog(@"任务已经挂起");
//        dispatch_async(q1, ^{
//            NSLog(@"%@",q1);
//            NSLog(@"异步函数中延迟执行----%@ %d",[NSThread currentThread],i);
//        });
//    }
    
  
}


- (IBAction)afterDelayClicked:(UIButton *)sender {
    
    [plistTools Request];
    
   
    
}
- (IBAction)push:(id)sender {
    dispatch_queue_t q2 = [plistTools Dispatch_queue_t_q2];
    
    NSLog(@"%@",q2 );
    printf("qw");
    dispatch_async(q2, ^{
        NSLog(@"异步函数中延迟执行----%@ %d",[NSThread currentThread],0);
    });
}

- (IBAction)start:(id)sender {
    dispatch_queue_t q2 = [plistTools Dispatch_queue_t_q2];
    dispatch_suspend(q2);
    NSLog(@"任务已经挂起");
}
- (IBAction)end:(id)sender {
    dispatch_queue_t q2 = [plistTools Dispatch_queue_t_q2];
    dispatch_resume(q2);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismClicked:(id)sender {

    AppDelegate *app = [[UIApplication sharedApplication] delegate];
    [app createPush:self];
}



@end
