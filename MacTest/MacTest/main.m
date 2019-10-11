//
//  main.m
//  MacTest
//
//  Created by Banning on 2019/4/19.
//  Copyright © 2019 Banning. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        
        NSString *pListPath = @"/Users/Banning/Banning/WorkSpaceNew/Demo/GitHubDemoSpace/MacTest/CountryCode/country.plist";
        NSLog(@"pListPath:%@",pListPath);
        NSDictionary *oldDic = [[NSDictionary alloc] initWithContentsOfFile:pListPath];
        NSLog(@"oldDic:%d", oldDic.count);
        
        NSString *countryBNPath = @"/Users/Banning/Banning/WorkSpaceNew/Demo/GitHubDemoSpace/MacTest/CountryCode/bn.txt";
        NSError *error = NULL;
        NSString *string = [NSString stringWithContentsOfFile:countryBNPath encoding:NSUTF16StringEncoding error:&error];
        NSScanner *bnScanner = [NSScanner scannerWithString:string];
        NSMutableDictionary *bnDic = [[NSMutableDictionary alloc] init];
        while (![bnScanner isAtEnd]) {
            NSString *indexStringLan;
            (void) [bnScanner scanUpToCharactersFromSet:[NSCharacterSet newlineCharacterSet] intoString:&indexStringLan];
            if (indexStringLan.length > 0) {
                NSArray *bnItem = [indexStringLan componentsSeparatedByString:@" = "];
                if (bnItem && bnItem.count == 2) {
                    [bnDic setObject:bnItem[1] forKey:bnItem[0]];
                }
            }
        }
        
        NSString *countryENPath = @"/Users/Banning/Banning/WorkSpaceNew/Demo/GitHubDemoSpace/MacTest/CountryCode/country.txt";
        string = [NSString stringWithContentsOfFile:countryENPath encoding:NSUTF16StringEncoding error:&error];
        NSScanner *scanner = [NSScanner scannerWithString:string];
        
        NSMutableDictionary *oldENDic = [[NSMutableDictionary alloc] initWithDictionary:oldDic];
        NSMutableDictionary *newENDic = [[NSMutableDictionary alloc] init];
        while (![scanner isAtEnd]){
            NSString *indexStringLan;
            (void) [scanner scanUpToCharactersFromSet:[NSCharacterSet newlineCharacterSet] intoString:&indexStringLan];
            NSLog(@"indexStringLan=:%@", indexStringLan);
            NSArray *resultKeys = [indexStringLan componentsSeparatedByString:@"\t"];
            NSString *countryName = [NSString stringWithFormat:@"%@", resultKeys[0]];
            
            countryName = [countryName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
            
            __block NSString *countryCode = [NSString stringWithFormat:@"%@", resultKeys[1]];
            __block isFindFlag = NO;
            [oldDic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
                if (key && [key isKindOfClass:[NSString class]] && [key isEqualToString:countryName]) {
                    isFindFlag = YES;
                    *stop = YES;
                }
            }];
            
            if (isFindFlag) {
                countryCode = [NSString stringWithFormat:@"com_accountkit_country_code_%@", [countryCode uppercaseString]];
                [bnDic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
                    if ([countryCode isEqualToString:key]) {
                        [newENDic setObject:[oldENDic objectForKey:countryName] forKey:[NSString stringWithFormat:@"%@", obj]];
                        [oldENDic removeObjectForKey:countryName];
                    }
                }];
            }
        }
        
        NSLog(@"newENDic==:%d", newENDic.count);
        NSLog(@"oldENDic count:%d", oldENDic.count);
        
        NSString *bnListPath = @"/Users/Banning/Banning/WorkSpaceNew/Demo/GitHubDemoSpace/MacTest/CountryCode/bn.plist";
        [newENDic writeToFile:bnListPath atomically:YES];
    }
    return 0;
}
