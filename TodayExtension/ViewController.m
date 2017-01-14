//
//  ViewController.m
//  TodayExtension
//
//  Created by 张俊伟 on 2017/1/14.
//  Copyright © 2017年 lanfairy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setAppGroup];
}

- (void)setAppGroup {
    NSUserDefaults *userDefault = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.lanfairy"];
    [userDefault setObject:@"你好 !" forKey:@"group.com.lanfairy.userInfo"];
    [userDefault synchronize];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
