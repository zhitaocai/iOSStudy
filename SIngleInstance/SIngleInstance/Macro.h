//
//  Macro.h
//  SingleInstance
//
//  Created by zhitao on 2017/5/4.
//  Copyright © 2017年 zhitao. All rights reserved.
//

#ifndef Macro_h
#define Macro_h

// 定义放在.h的单例宏实现
#define SingleInstanceH(methodName) +(instancetype)methodName;

// 定义放在.m的单例宏实现
#if __has_feature(objc_arc)

// ARC 实现
#define SingleInstanceM(methodName)                         \
    static id _instance = nil;                              \
                                                            \
    +(instancetype)allocWithZone : (struct _NSZone *)zone { \
        static dispatch_once_t onceToken;                   \
        dispatch_once(&onceToken, ^{                        \
            _instance = [super allocWithZone:zone];         \
        });                                                 \
        return _instance;                                   \
    }                                                       \
                                                            \
    +(instancetype)methodName {                             \
        static dispatch_once_t onceToken;                   \
        dispatch_once(&onceToken, ^{                        \
            _instance = [[self alloc] init];                \
        });                                                 \
        return _instance;                                   \
    }                                                       \
                                                            \
    -(id)copyWithZone : (NSZone *)zone {                    \
        return _instance;                                   \
    }                                                       \
                                                            \
    -(id)mutableCopyWithZone : (NSZone *)zone {             \
        return _instance;                                   \
    } /* 最后一行不要有换行符 '\' */

#else

// MRC 实现
#define SingleInstanceM(methodName)                         \
    static id _instance = nil;                              \
                                                            \
    +(instancetype)allocWithZone : (struct _NSZone *)zone { \
        static dispatch_once_t onceToken;                   \
        dispatch_once(&onceToken, ^{                        \
            _instance = [super allocWithZone:zone];         \
        });                                                 \
        return _instance;                                   \
    }                                                       \
                                                            \
    +(instancetype)methodName {                             \
        static dispatch_once_t onceToken;                   \
        dispatch_once(&onceToken, ^{                        \
            _instance = [[self alloc] init];                \
        });                                                 \
        return _instance;                                   \
    }                                                       \
                                                            \
    -(id)copyWithZone : (NSZone *)zone {                    \
        return _instance;                                   \
    }                                                       \
                                                            \
    -(id)mutableCopyWithZone : (NSZone *)zone {             \
        return _instance;                                   \
    }                                                       \
    -(id)retain {                                           \
        return self;                                        \
    }                                                       \
    -(id)autorelease {                                      \
        return self;                                        \
    }                                                       \
    -(oneway void)release {                                 \
    }                                                       \
    -(NSUInteger)retainCount {                              \
        return UINT_MAX;                                    \
    } /* 最后一行不要有换行符 '\' */

#endif 

#endif /* Macro_h */
