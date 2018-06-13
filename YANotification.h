//
//  YANotification.h
//  Notification
//
//  Created by yangxiuying on 2018/6/13.
//  Copyright © 2018年 lanjiying. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/*****************YANoticication**********************/
@class NSString, NSDictionary, NSOperationQueue;

@interface YANotification : NSObject

@property(nonnull, readonly, copy)NSString *name;
@property(nonnull, readonly, retain)id object;
@property(nonnull, readonly, copy)NSDictionary *userInfo;

- (instancetype)initWithName:(nonnull NSString *)name object:(nonnull id)object userInfo:(nonnull NSDictionary *)userInfo NS_DESIGNATED_INITIALIZER;

+ (instancetype)initWithName:(NSString *)name object:(id)object;
+ (instancetype)initWithName:(nonnull NSString *)name object:(nonnull id)object userInfo:(nonnull NSDictionary *)userInfo;

@end

/*****************YANotificationCenter**********************/

@interface YANotificationCenter : NSObject

+ (YANotificationCenter *)defaultNotificationCenter;

@end

NS_ASSUME_NONNULL_END
