//
//  MRCSingleInstance.m
//  SingleInstance
//
//  Created by zhitao on 2017/5/4.
//  Copyright © 2017年 zhitao. All rights reserved.
//

#import "MRCSingleInstance.h"

@implementation MRCSingleInstance

static MRCSingleInstance *_instance = nil;

/**
 alloc方法内部会调用allocWithZone
 因此实现单例时，需要保证这个方法内部自创建一个对象即可

 @param zone 系统分配给app的内存
 @return <#return value description#>
 */
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    if (_instance == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{ // 安全(这个代码只会被调用一次)
            _instance = [super allocWithZone:zone];
        });
    }
    return _instance;
}

/**
 因为单例是全局只有一份，一旦release，计数器变为0，那么再去创建单例对象就会造成坏内存访问
 
 所以MRC方式创建单例需要重写release 和 retain
 
 在allocWithZone中使用了GCD令创建对象的代码只执行一次，如果_instance被释放则无法再创建
 重写release方法，防止_instance被释放
 */
- (oneway void)release {
    // oneway关键字应用于分布式对象的API,即允许不同的线程或应用程序之间使用Objective-C的对象
    // oneway告诉系统,在返回值返回前不应该阻止线程的调用。
    // 没有oneway,调用者将阻止,尽管该方法的返回类型是void。
    // 很明显,相比于void它是不会被使用的,这样做就意味着方法返回了某些东西,但是调用者没有得到它。
}

/**
 重写retain方法，返回自身，不对引用计数器+1
 */
- (instancetype)retain {
    return self;
}

/**
 重写retainCount锁定引用计数
 */
- (NSUInteger)retainCount {
    return 1;
}

//- (NSUInteger)retainCount {
//    return UINT_MAX;
//    //表示对象永远不可能被释放，因为引用计数是无限大
//}

/**
 重写init方法，防止单例所拥有的属性值被重置
 让初始化的方法只能执行一次，自然属性值就没有机会被重置
 */
- (instancetype)init {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super init];  // init会先调用alloc方法
    });
    return _instance;
}

/**
 copy在底层 会调用copyWithZone
 */
- (id)copyWithZone:(NSZone *)zone{
    return _instance;
}

- (id)mutableCopyWithZone:(NSZone *)zone{
    return _instance;
}

/** 
 仿造系统的单例创建方式，提供类方法
 */
+ (instancetype)sharedMRCSingleInstance {
    // 由于我们已经重写了init方法保证了单例对象的唯一了，所以这里直接调用init方法即可。
    return [[self alloc] init];
}

@end
