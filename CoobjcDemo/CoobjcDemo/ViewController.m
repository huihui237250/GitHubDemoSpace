//
//  ViewController.m
//  CoobjcDemo
//
//  Created by Banning on 2019/3/2.
//  Copyright © 2019 Banning. All rights reserved.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>
#import <coobjc/coobjc.h>

@interface ViewController ()
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *pListPath = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"country.plist"];
    NSDictionary *countryDic = [[NSDictionary alloc] initWithContentsOfFile:pListPath];
    
    NSLog(@"pListPath:%@",pListPath);
    NSLog(@"countryDic.count:%d",countryDic.count);
    
    
    NSData *JSONData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"testen" ofType:@"json"]];
    NSDictionary *encountryDic = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingAllowFragments error:nil];
    NSArray *enArray = [encountryDic objectForKey:@"data"];
    NSLog(@"enArray.count:%d",enArray.count);
    
    JSONData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"hi" ofType:@"txt"]];
    NSDictionary *hicountryDic = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingAllowFragments error:nil];
    NSArray *hiArray = [hicountryDic objectForKey:@"data"];
    NSLog(@"hiArray.count:%d",hiArray.count);
    
    
    JSONData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"othercheck" ofType:@"json"]];
    NSDictionary *othercountryDic = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingAllowFragments error:nil];
    
    NSMutableArray *notFindCountryArray = [[NSMutableArray alloc] init];
    NSString *newHIStr = @"";
    for (NSString *ccName in countryDic.allKeys) {
        NSString *shortCode = nil;
        NSString *phoneCode = [countryDic objectForKey:ccName];
        NSString *cleanCcName = [ccName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        for (NSDictionary *enitem in enArray) {
            NSString *countryName = [enitem objectForKey:@"countryName"];
            NSString *countryphoneCode = [enitem objectForKey:@"phoneCode"];
//            if ([cleanCcName.lowercaseString isEqualToString:countryName.lowercaseString] || [countryphoneCode isEqualToString:phoneCode]) {
            if ([cleanCcName.lowercaseString isEqualToString:countryName.lowercaseString]) {
                shortCode = [enitem objectForKey:@"countryCode"];
                break;
            }
        }
        
        if (shortCode.length == 0) {
            if ([cleanCcName.lowercaseString isEqualToString:[@"Falkland Islands" lowercaseString]]) {
                shortCode = @"FK";
            }
        }
        
        if (shortCode.length == 0) {
            for (NSString *otherKey in othercountryDic.allKeys) {
                NSString *otherKeyStr = [[NSString stringWithFormat:@"%@",[othercountryDic objectForKey:otherKey]] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                if ([otherKeyStr.lowercaseString isEqualToString:cleanCcName.lowercaseString]) {
                    shortCode = otherKey;
                    break;
                }
            }
        }
        
        if (shortCode && shortCode.length > 0) {
            for (NSDictionary *hiItemDic in hiArray) {
                NSString *shortHiCode = hiItemDic.allKeys[0];
                NSString *hiName = [hiItemDic allValues][0];
                if (shortHiCode && shortHiCode.length > 0 && [shortHiCode.uppercaseString isEqualToString:shortCode.uppercaseString]) {
                    newHIStr = [NSString stringWithFormat:@"%@\n<key>%@</key>\n<string>%@</string>",newHIStr,hiName,phoneCode];
                    break;
                }
            }
        }else{
            [notFindCountryArray addObject:cleanCcName];
        }
    }
    NSLog(@"notFindCountryArray.count:%d", notFindCountryArray.count);
    NSLog(@"\n\n-----\n");
    NSLog(@"%@",newHIStr);
    NSString *country_hiPath = [[NSBundle mainBundle] pathForResource:@"country_hi" ofType:@"plist"];
    NSLog(@"\n-----\n");
    newHIStr = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\n<plist version=\"1.0\">\n<dict>\n%@\n</dict>\n</plist>",newHIStr];
    NSLog(@"\n-----\n");
    
    NSError *error = nil;
    BOOL isWriteString = [newHIStr writeToFile:country_hiPath atomically:YES encoding:NSUTF8StringEncoding error:&error];
    if (isWriteString) {
        NSLog(@"string 文件写入成功");
    }
    
    NSLog(@"=%@",error);
    
    
    co_launch(^{
        UIImage *image = [UIImage imageNamed:@"img_pop_fc_6"];
        self.imageView.image = image;
    });
}

- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.layer.borderWidth = 1.0f;
        _imageView.layer.borderColor = [[UIColor redColor] CGColor];
        [self.view addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(20);
            make.top.offset(60);
        }];
    }
    return _imageView;
}


@end
