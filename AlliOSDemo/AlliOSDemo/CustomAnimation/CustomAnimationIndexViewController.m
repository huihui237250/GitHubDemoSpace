//
//  CustomAnimationIndexViewController.m
//  AlliOSDemo
//
//  Created by Banning on 2018/8/30.
//  Copyright © 2018年 Banning. All rights reserved.
//

#import "CustomAnimationIndexViewController.h"
#import "Nutils.h"

@interface CustomAnimationIndexViewController ()
@property (nonatomic, strong) UIImageView *animationImageView;
@end

@implementation CustomAnimationIndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Custom Animation";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.animationImageView = [[UIImageView alloc] init];
    self.animationImageView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.animationImageView];
    [self.animationImageView sd_setImageWithURL:[NSURL URLWithString:@"https://dm46l3i5mnhr0.cloudfront.net/talku/banner3%402x.png"]];
    [self.animationImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.offset(0);
        make.left.right.offset(0);
        make.height.equalTo(self.view.mas_height).multipliedBy(0.5);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
