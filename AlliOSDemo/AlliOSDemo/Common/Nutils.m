//
//  Nutils.m
//  AlliOSDemo
//
//  Created by Banning on 2018/8/30.
//  Copyright © 2018年 Banning. All rights reserved.
//

#import "Nutils.h"

@implementation Nutils

+ (NSString *)getDemoTypeName:(DemoType)demoType{
    NSString *demoTypeStr = nil;
    switch (demoType) {
        case DemoType_Animation:
            demoTypeStr = @"Custom Animation";
            break;
            
        case DemoType_RAC:
            demoTypeStr = @"ReactiveCocoa";
            break;
            
        default:
            break;
    }
    return demoTypeStr;
}

@end
