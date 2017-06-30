///Users/caizhitao/iOS/iOSStudy/SingleInstance/SingleInstance
//  ARCSingleInstance.m
//  SingleInstance
//
//  Created by zhitao on 2017/5/4.
//  Copyright © 2017年 zhitao. All rights reserved.
//

#import "ARCSingleInstance.h"

@implementation ARCSingleInstance

static ARCSingleInstance *_instance = nil;

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

- (instancetype)init {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super init];
    });
    return _instance;
}

- (id)copyWithZone:(NSZone *)zone {
    return _instance;
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    return _instance;
}

+ (instancetype)sharedARCSingleInstance {
    return [[self alloc] init];
}

@end
