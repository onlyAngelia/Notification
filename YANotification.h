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

@property(nullable, readonly, copy)NSString *name;
@property(nullable, readonly, retain)id object;
@property(nullable, readonly, copy)NSDictionary *userInfo;

- (instancetype)initWithName:(nullable NSString *)name object:(nullable id)object userInfo:(nullable NSDictionary *)userInfo NS_DESIGNATED_INITIALIZER;

+ (instancetype)initWithName:(NSString *)name object:(id)object;
+ (instancetype)initWithName:(nullable NSString *)name object:(nullable id)object userInfo:(nullable NSDictionary *)userInfo;

@end

/*****************YANotificationCenter**********************/

@interface YANotificationCenter : NSObject

+ (YANotificationCenter *)defaultNotificationCenter;

- (void)postNotification:(YANotification *)notification;
- (void)postNotificationName:(NSString *)aName object:(nullable id)anObject;
- (void)postNotificationName:(NSString *)aName object:(nullable id)anObject userInfo:(nullable NSDictionary *)aUserInfo;

- (void)removeObserver:(id)observer;
- (void)removeObserver:(id)observer name:(nullable NSString *)aName object:(nullable id)anObject;

- (id <NSObject>)addObserverForName:(nullable NSNotificationName)name object:(nullable id)obj queue:(nullable NSOperationQueue *)queue usingBlock:(void (^)(NSNotification *note))block API_AVAILABLE(macos(10.6), ios(4.0), watchos(2.0), tvos(9.0));
@end

NS_ASSUME_NONNULL_END
