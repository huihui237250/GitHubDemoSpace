//
//  Nutils.h
//  AlliOSDemo
//
//  Created by Banning on 2018/8/30.
//  Copyright © 2018年 Banning. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Masonry/Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import <YYText/YYText.h>

typedef NS_ENUM (NSInteger, DemoType){
    DemoType_Animation = 0,         //动画
    DemoType_RAC,   //RAC测试
    DemoType_YYText,
};

@interface Nutils : NSObject

+ (NSString *)getDemoTypeName:(DemoType)demoType;

@end
