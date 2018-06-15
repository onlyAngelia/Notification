# Notification

基于Notification原理的实践

单例YANotificationCenter 负责add observe  和 管理所有observers 以及负责发送通知

```
+ (YANotificationCenter *)defaultNotificationCenter
{
   static YANotificationCenter *notificationCenter = nil;
   static dispatch_once_t onceToken;
   dispatch_once(&onceToken, ^{
      notificationCenter = [[YANotificationCenter alloc] init];
   });
   return notificationCenter;
}
```
添加observers 并存放数组
```
- (void)addObserver:(id)observer selector:(SEL)aSelector name:(nullable NSNotificationName)aName object:(nullable id)anObject
{
   YANotificationModel * notificationModel = [[YANotificationModel alloc] init];
   notificationModel.observer = observer;
   notificationModel.selector = aSelector;
   notificationModel.notificationName = aName;
   notificationModel.object = anObject;
   [self.observersArray addObject:notificationModel];

}
```
推送通知
```
- (void)postNotification:(YANotification *)notification
{
    [self.observersArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    YANotificationModel *notificationModel = (YANotificationModel *)obj;
    if ([notificationModel.notificationName isEqualToString:notification.name]) {
        
        if (notificationModel.queue) {

        NSBlockOperation *blockOperation = [NSBlockOperation blockOperationWithBlock:^{
            notificationModel.queueBlock(notification);
        }];
        [notificationModel.queue addOperation:blockOperation];

    }else{
        dispatch_async(dispatch_get_main_queue(), ^{
            NSObject *object = notificationModel.observer;
            SEL selector = notificationModel.selector;
            NSInvocation *vocation = [NSInvocation invocationWithMethodSignature:   [[object class] instanceMethodSignatureForSelector:selector]];
            [vocation setTarget:notificationModel.observer];
            [vocation setSelector:selector];
            [vocation setArgument:&notification atIndex:2];
            [vocation invoke];

        });
      }
   }

   }];
}
```
删除通知
```
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
```


