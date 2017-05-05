//
//  MacroMRCSingleInstance.h
//  SingleInstance
//
//  Created by zhitao on 2017/5/5.
//  Copyright © 2017年 zhitao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Macro.h"

@interface MacroMRCSingleInstance : NSObject

SingleInstanceH(sharedMacroMRCSingleInstance)

@end
