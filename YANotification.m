//
//  YANotification.m
//  Notification
//
//  Created by yangxiuying on 2018/6/13.
//  Copyright © 2018年 lanjiying. All rights reserved.
//

#import "YANotification.h"

/*****************YANoticicationModel**********************/

typedef void(^NotificationQueueBlock)(YANotification *notification);

@interface YANotificationModel:NSObject

@property (nullable, nonatomic, strong)id object;
@property (nullable, nonatomic, assign)SEL selector;
@property (nullable, nonatomic, strong)id observer;
@property (nullable, nonatomic, copy)  NSString *notificationName;
@property (nullable, nonatomic, strong)NSOperationQueue *queue;
@property (nullable, nonatomic, copy)NotificationQueueBlock queueBlock;

@end

@implementation YANotificationModel


@end

/*****************YANoticication**********************/
@interface YANotification()

@property(nullable, readwrite, copy)NSString *name;
@property(nullable, readwrite, retain)id object;
@property(nullable, readwrite, copy)NSDictionary *userInfo;

@end

@implementation YANotification

- (instancetype)init
{
    return [self initWithName:@"" object:@"" userInfo:[NSDictionary dictionary]];
}

- (instancetype)initWithName:(nullable NSString *)name object:(nullable id)object userInfo:(nullable NSDictionary *)userInfo
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
    return [YANotification initWithName:name object:object userInfo:nil];
}

+ (instancetype)initWithName:(nullable NSString *)name object:(nullable id)object userInfo:(nullable NSDictionary *)userInfo
{
    return [YANotification initWithName:name object:object userInfo:userInfo];
}

@end

/*****************YANotificationCenter**********************/

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

- (void)addObserver:(id)observer selector:(SEL)aSelector name:(nullable NSNotificationName)aName object:(nullable id)anObject
{
    YANotificationModel * notificationModel = [[YANotificationModel alloc] init];
    notificationModel.observer = observer;
    notificationModel.selector = aSelector;
    notificationModel.notificationName = aName;
    notificationModel.object = anObject;
    [self.observersArray addObject:notificationModel];

}

- (void)postNotification:(YANotification *)notification
{
    
}

- (void)postNotificationName:(NSString *)aName object:(nullable id)anObject
{
    YANotification *notification = [[YANotification alloc] initWithName:aName object:anObject userInfo:nil];
    [self postNotification:notification];
    
}

- (void)postNotificationName:(NSString *)aName object:(nullable id)anObject userInfo:(nullable NSDictionary *)aUserInfo
{
    YANotification *notification = [[YANotification alloc] initWithName:aName object:anObject userInfo:aUserInfo];
    [self postNotification:notification];
    
}

- (void)removeObserver:(id)observer
{
    [self removeObserver:observer name:nil object:nil];
}

- (void)removeObserver:(id)observer name:(nullable NSString *)aName object:(nullable id)anObject
{
    __weak typeof(&*self)weakself = self;
    [self.observersArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        YANotificationModel *model = (YANotificationModel *)obj;
        if (model.observer == observer && [model.notificationName isEqualToString:aName]&& model.object == anObject) {
            [weakself.observersArray removeObjectAtIndex:idx];
            *stop = YES;
        }
    }];
}

- (id <NSObject>)addObserverForName:(NSString *)name object:(id)obj queue:(NSOperationQueue *)queue usingBlock:(void(^)(YANotification * notification))block
{
    YANotificationModel *notificationModel = [[YANotificationModel alloc] init];
    notificationModel.object = obj;
    notificationModel.queue = queue;
    notificationModel.queueBlock = block;
    return nil;
}

@end
