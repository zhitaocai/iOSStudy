//
//  NetworkUtil.m
//  Utils
//
//  Created by zhitao on 2017/7/13.
//  Copyright © 2017年 zhitao. All rights reserved.
//

#import "NetworkUtil.h"
#import <UIKit/UIKit.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>

@implementation NetworkUtil

+ (void)networkStatus {
    NSArray *typeStrings2G = @[ CTRadioAccessTechnologyEdge,
                                CTRadioAccessTechnologyGPRS,
                                CTRadioAccessTechnologyCDMA1x ];

    NSArray *typeStrings3G = @[ CTRadioAccessTechnologyHSDPA,
                                CTRadioAccessTechnologyWCDMA,
                                CTRadioAccessTechnologyHSUPA,
                                CTRadioAccessTechnologyCDMAEVDORev0,
                                CTRadioAccessTechnologyCDMAEVDORevA,
                                CTRadioAccessTechnologyCDMAEVDORevB,
                                CTRadioAccessTechnologyeHRPD ];

    NSArray *typeStrings4G = @[ CTRadioAccessTechnologyLTE ];

    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        CTTelephonyNetworkInfo *teleInfo = [[CTTelephonyNetworkInfo alloc] init];
        NSString *accessString = teleInfo.currentRadioAccessTechnology;
        if ([typeStrings4G containsObject:accessString]) {
            NSLog(@"4G网络");
        } else if ([typeStrings3G containsObject:accessString]) {
            NSLog(@"3G网络");
        } else if ([typeStrings2G containsObject:accessString]) {
            NSLog(@"2G网络");
        } else {
            NSLog(@"未知网络1");
        }
    } else {
        NSLog(@"未知网络2");
    }
}

@end
