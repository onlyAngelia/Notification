//
//  YANextViewController.m
//  Notification
//
//  Created by yangxiuying on 2018/6/15.
//  Copyright © 2018年 lanjiying. All rights reserved.
//

#import "YANextViewController.h"
#import "YANotification.h"

NSString *const kVauleChangeNotification = @"kVauleChangeNotification";

@interface YANextViewController ()

@end

@implementation YANextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}
- (void)setupUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *notificationButton = [UIButton buttonWithType:UIButtonTypeSystem];
    notificationButton.backgroundColor = [UIColor blueColor];
    notificationButton.frame = CGRectMake(CGRectGetMidX(self.view.frame) - 30.0, 150.0, 60.0, 60.0);
    [notificationButton addTarget:self action:@selector(sendNotification) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:notificationButton];
}
- (void)sendNotification
{
    [[YANotificationCenter defaultNotificationCenter] postNotificationName:kVauleChangeNotification object:nil userInfo:@{@"notificationMessage":@"U should have change"}];
    
}
- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
