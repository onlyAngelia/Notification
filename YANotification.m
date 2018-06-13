//
//  YANotification.m
//  Notification
//
//  Created by yangxiuying on 2018/6/13.
//  Copyright © 2018年 lanjiying. All rights reserved.
//

#import "YANotification.h"

@interface YANotification()

@property(nonnull, readwrite, copy)NSString *name;
@property(nonnull, readwrite, retain)id object;
@property(nonnull, readwrite, copy)NSDictionary *userInfo;

@end

@implementation YANotification

- (instancetype)init
{
    return [self initWithName:@"" object:@"" userInfo:[NSDictionary dictionary]];
}

- (instancetype)initWithName:(nonnull NSString *)name object:(nonnull id)object userInfo:(nonnull NSDictionary *)userInfo
{
    self = [super init];
    if (self) {
        _name = name;
        _object = object;
        _userInfo = userInfo;
    }
    return self;
}

+ (instancetype)initWithName:(NSString *)name object:(id)object
{
    return [YANotification initWithName:name object:object userInfo:[NSDictionary dictionary]];
}

+ (instancetype)initWithName:(nonnull NSString *)name object:(nonnull id)object userInfo:(nonnull NSDictionary *)userInfo
{
    return [YANotification initWithName:name object:object userInfo:userInfo];
}

@end


@interface YANotificationCenter()

@property(nullable, readwrite, copy)NSMutableArray *observersArray;

@end

@implementation YANotificationCenter

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
