//
//  Nutils.h
//  MasonryDemo
//
//  Created by Banning on 2018/4/12.
//  Copyright © 2018年 Banning. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import "Masonry.h"

#define ios8 ([[[UIDevice currentDevice] systemVersion] intValue] >= 8 ? YES : NO)
#define ios9 ([[[UIDevice currentDevice] systemVersion] intValue] >= 9 ? YES : NO)
#define ios10 ([[[UIDevice currentDevice] systemVersion] intValue] >= 10 ? YES : NO)
#define ios11 ([[[UIDevice currentDevice] systemVersion] intValue] >= 11 ? YES : NO)

@interface Nutils : NSObject

@end
