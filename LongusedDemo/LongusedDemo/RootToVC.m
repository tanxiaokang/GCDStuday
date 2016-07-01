//
//  RootToVC.m
//  LongusedDemo
//
//  Created by 三少 on 16/7/1.
//  Copyright © 2016年 Demo. All rights reserved.
//

#import "RootToVC.h"
#import "plistTools.h"

@interface RootToVC ()

@end

@implementation RootToVC

//开始
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    [plistTools writePlist:NSStringFromClass([self class])];
}



@end
