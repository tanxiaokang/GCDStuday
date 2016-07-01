//
//  RootTVC.m
//  LongusedDemo
//
//  Created by 三少 on 16/7/1.
//  Copyright © 2016年 Demo. All rights reserved.
//

#import "RootTVC.h"
#import "plistTools.h"

@interface RootTVC ()

@end

@implementation RootTVC

- (void)viewDidLoad {
    [super viewDidLoad];

}
//开始
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    [plistTools writePlist:NSStringFromClass([self class])];
}


@end
