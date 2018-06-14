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

