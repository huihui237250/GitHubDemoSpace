//
//  YYTextDemoIndexViewController.m
//  AlliOSDemo
//
//  Created by Banning on 2019/10/11.
//  Copyright © 2019 Banning. All rights reserved.
//

#import "YYTextDemoIndexViewController.h"
#import "Nutils.h"

@interface YYTextDemoIndexViewController ()

@end

@implementation YYTextDemoIndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"YYText";
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString *commonStr = @"这是一个YYText测试字符串,YYText是一款功能强大的第三方图文混排库。";
    UIFont *font = [UIFont boldSystemFontOfSize:16];
    
    //纯文字
    YYLabel *contentLabel = [[YYLabel alloc] init];
    contentLabel.textColor = [UIColor blackColor];
    contentLabel.numberOfLines = 0;
    contentLabel.lineBreakMode = NSLineBreakByWordWrapping;
    contentLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.view.frame) - 30;
    [self.view addSubview:contentLabel];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:commonStr];
    YYTextBorder *border = [YYTextBorder borderWithFillColor:[UIColor lightGrayColor] cornerRadius:5.0f];
    [attributedString setYy_textBackgroundBorder:border];
    [attributedString setYy_font:font];
    border.insets = UIEdgeInsetsMake(0,0,0,0);  //背景色的偏移量，上右下左
    contentLabel.attributedText = attributedString;
    
    [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15.0f);
        make.right.offset(-15.0f);
        make.top.offset(20.0f);
    }];
    
    //图文混排
    UIImage *image = [UIImage imageNamed:@"icon_call_contacts"];
    NSMutableAttributedString *attachment = [NSMutableAttributedString yy_attachmentStringWithContent:image contentMode:UIViewContentModeCenter attachmentSize:CGSizeMake(10.0, 35.0) alignToFont:font alignment:YYTextVerticalAlignmentCenter];
    [attributedString appendAttributedString:attachment];
    
    NSMutableAttributedString *attributedString2 = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"   %@", commonStr]];
    [attributedString2 setYy_font:font];
    [attributedString appendAttributedString:attributedString2];
    
    YYLabel *contentLabel2 = [[YYLabel alloc] init];
    contentLabel2.numberOfLines = 0;
    contentLabel2.lineBreakMode = NSLineBreakByWordWrapping;
    contentLabel2.preferredMaxLayoutWidth = contentLabel.preferredMaxLayoutWidth;
    [self.view addSubview:contentLabel2];
    contentLabel2.attributedText = attributedString;
    [contentLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(contentLabel);
        make.top.equalTo(contentLabel.mas_bottom).offset(20.0f);
    }];
}

@end
