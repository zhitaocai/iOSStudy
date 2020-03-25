//
//  ViewController.m
//  Utils
//
//  Created by zhitao on 2017/7/13.
//  Copyright © 2017年 zhitao. All rights reserved.
//

#import "ViewController.h"
#import "NetworkUtil.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //[NetworkUtil networkStatus];
    self.view.backgroundColor = [UIColor brownColor];
    
    NSLog(@"%@", [NSString stringWithFormat:@"%d", 123]);
    NSLog(@"%@", [NSString localizedStringWithFormat:@"%d", 123]);
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    
    // 获取App的版本号
    NSString *appVersion = [infoDic objectForKey:@"CFBundleShortVersionString"];
    
    // 获取App的build版本
    NSString *appBuildVersion = [infoDic objectForKey:@"CFBundleVersion"];
    
    // 获取App的名称
    NSString *appName = [infoDic objectForKey:@"CFBundleDisplayName"];
    
 
    NSLog(@"版本号：%@ 构建版本：%@ 名字：%@", appVersion, appBuildVersion, appName);

    [NetworkUtil networkStatus];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
