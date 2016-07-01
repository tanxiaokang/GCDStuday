//
//  AppDelegate.h
//  LongusedDemo
//
//  Created by 三少 on 16/6/29.
//  Copyright © 2016年 Demo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSString *filePath;
- (void)createPush:(UIViewController *)vc;
@end

