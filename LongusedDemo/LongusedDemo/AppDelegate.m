//
//  AppDelegate.m
//  LongusedDemo
//
//  Created by 三少 on 16/6/29.
//  Copyright © 2016年 Demo. All rights reserved.
//

#import "AppDelegate.h"
#import "plistTools.h"

@interface AppDelegate ()


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    NSArray *paths= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *path= [paths objectAtIndex:0];
    _filePath =[path stringByAppendingPathComponent:@"GNH_log.plist"];   //获取路径

    return YES;
}


- (void)createPush:(UIViewController *)vc{
    
    [vc.navigationController popViewControllerAnimated:YES];
}

//开始挂后台时执行
- (void)applicationWillResignActive:(UIApplication *)application {

    
}
//程序被杀死时,调用
- (void)applicationDidEnterBackground:(UIApplication *)application {

    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

//程序已经被杀死
- (void)applicationWillTerminate:(UIApplication *)application {

}

@end
