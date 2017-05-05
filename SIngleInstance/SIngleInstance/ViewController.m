//
//  ViewController.m
//  SingleInstance
//
//  Created by zhitao on 2017/5/4.
//  Copyright © 2017年 zhitao. All rights reserved.
//

#import "ViewController.h"
#import "MRCSingleInstance.h"
#import "ARCSingleInstance.h"
#import "MacroARCSingleInstance.h"
#import "MacroMRCSingleInstance.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    NSLog(@"===MRC SingleInstance===");
    for (int i=0; i<=3; i++) {
        MRCSingleInstance* instance = [MRCSingleInstance sharedMRCSingleInstance];
        NSLog(@"%@", instance);
    }
    
    
    NSLog(@"===ARC SingleInstance===");
    for (int i=0; i<=3; i++) {
        ARCSingleInstance* instance = [ARCSingleInstance sharedARCSingleInstance];
        NSLog(@"%@", instance);
    }
    
    NSLog(@"===Macro ARC SingleInstance===");
    for (int i=0; i<=3; i++) {
        MacroARCSingleInstance* instance = [MacroARCSingleInstance sharedMacroARCSingleInstance];
        NSLog(@"%@", instance);
    }
    
    NSLog(@"===Macro MRC SingleInstance===");
    for (int i=0; i<=3; i++) {
        MacroMRCSingleInstance* instance = [MacroMRCSingleInstance sharedMacroMRCSingleInstance];
        NSLog(@"%@", instance);
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
