//
//  YANotificationCenter.m
//  Notification
//
//  Created by yangxiuying on 2018/6/13.
//  Copyright © 2018年 lanjiying. All rights reserved.
//

#import "YANotificationCenter.h"
@interface YANotificationCenter()



@end

@implementation YANotificationCenter : NSObject

+ (YANotificationCenter *)defaultNotificationCenter
{
    static YANotificationCenter *notificationCenter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        notificationCenter = [[YANotificationCenter alloc] init];
    });
    return notificationCenter;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _observersArray = [NSMutableArray array];
    }
    return self;
}

@end
