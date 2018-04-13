//
//  ViewController.m
//  MasonryDemo
//
//  Created by Banning on 2018/4/12.
//  Copyright © 2018年 Banning. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initSubViews];
}

#pragma mark
-(void)initSubViews{
    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor = [UIColor redColor];
    [self.view addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200, 50));
        make.center.equalTo(self.view);
    }];
    
    UIView *bgView2 = [[UIView alloc] init];
    bgView2.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:bgView2];
    [bgView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.top.equalTo(self.view).offset(0);
        make.right.equalTo(self.view).offset(-20);
        make.height.equalTo(@40);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
