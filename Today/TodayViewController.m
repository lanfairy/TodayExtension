//
//  TodayViewController.m
//  Today
//
//  Created by 张俊伟 on 2017/1/14.
//  Copyright © 2017年 lanfairy. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import <Masonry.h>
@interface TodayViewController () <NCWidgetProviding>
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (nonatomic, strong) UIButton *btnMore;

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.view addSubview:self.btnMore];
    [self.btnMore mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(20.f);
        make.top.offset(20.f);
    }];
    
    
    NSUserDefaults *userDefault = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.lanfairy"];
    self.label.text = [userDefault objectForKey:@"group.com.lanfairy.userInfo"];
    // Dispose of any resources that can be recreated.
    

    
    if ([[UIDevice currentDevice].systemVersion doubleValue] >= 10.0) {
        self.extensionContext.widgetLargestAvailableDisplayMode = NCWidgetDisplayModeExpanded;
    }
}
- (UIButton *)btnMore {
    if (!_btnMore) {
        _btnMore = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnMore setTitle:@"More" forState:UIControlStateNormal];
        [_btnMore addTarget:self action:@selector(moreAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnMore;
}
- (void)moreAction:(UIButton *)btn {
    if ([[btn titleForState:UIControlStateNormal] isEqualToString:@"More"]) {
        [btn setTitle:@"Less" forState:UIControlStateNormal];
        self.preferredContentSize = CGSizeMake(0, 300.f);
    }else{
        [btn setTitle:@"More" forState:UIControlStateNormal];
        self.preferredContentSize = CGSizeMake(0, 50.f);
    }
        
}
- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

- (void)widgetActiveDisplayModeDidChange:(NCWidgetDisplayMode)activeDisplayMode withMaximumSize:(CGSize)maxSize {
    if (activeDisplayMode == NCWidgetDisplayModeCompact) {
        self.preferredContentSize = CGSizeMake(self.view.bounds.size.width, 40.f);
    }else{
        self.preferredContentSize = CGSizeMake(self.view.bounds.size.width, 200.f);
    }
}

- (IBAction)btnAction:(UIButton *)btn {
    
    if (btn.tag==1) {
         [self.extensionContext openURL:[NSURL URLWithString:@"lanfairy://ViewController1"] completionHandler:^(BOOL success) {
             NSLog(@"success1 -- %d",success);
         }];
    }else if (btn.tag ==2) {
        [self.extensionContext openURL:[NSURL URLWithString:@"lanfairy://ViewController2"] completionHandler:^(BOOL success) {
            NSLog(@"success2 -- %d",success);
        }];
    }else if(btn.tag ==3) {
        [self.extensionContext openURL:[NSURL URLWithString:@"lanfairy://ViewController3"] completionHandler:^(BOOL success) {
            NSLog(@"success3 -- %d",success);
        }];
    }
    
    
}

@end
