//
//  YAViewController.m
//  Notificaion
//
//  Created by yangxiuying on 2018/6/13.
//  Copyright © 2018年 lanjiying. All rights reserved.
//

#import "YAViewController.h"
#import "YANotification.h"
#import "YANextViewController.h"

@interface YAViewController ()

@end

@implementation YAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[YANotificationCenter defaultNotificationCenter] addObserver:self selector:@selector(getTheChanges:) name:kVauleChangeNotification object:nil];
}
- (void)getTheChanges:(YANotification *)notification
{
    NSLog(@"I have got the changes %@",notification.userInfo);
}
- (IBAction)jumpToNextViewController:(id)sender {
    
    YANextViewController *nextViewController = [[YANextViewController alloc] init];
    [self presentViewController:nextViewController animated:YES completion:^{
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
