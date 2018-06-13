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
    bgView2.layer.borderColor = [UIColor redColor].CGColor;
    bgView2.layer.borderWidth = 1.0f;
    [self.view addSubview:bgView2];
    /*
    [bgView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.top.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.mas_equalTo(40);
    }];
     */
    /*
    __weak typeof(self)weakself = self;
    [bgView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0,*)) {
            make.top.equalTo(weakself.view.mas_safeAreaLayoutGuideTop);
        }else{
            make.top.equalTo(weakself.view.mas_top).width.offset(64);
        }
        make.left.equalTo(weakself.view.mas_safeAreaLayoutGuideLeft);
        make.right.equalTo(weakself.view.mas_safeAreaLayoutGuideRight);
        make.bottom.equalTo(weakself.view.mas_safeAreaLayoutGuideBottom);
        
    }];
     */
    
    __weak typeof(self)weakself = self;
    [bgView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0,*)) {
            make.top.equalTo(weakself.view.mas_safeAreaLayoutGuideTop);
            make.left.equalTo(weakself.view.mas_safeAreaLayoutGuideLeft);
            make.right.equalTo(weakself.view.mas_safeAreaLayoutGuideRight);
            make.bottom.equalTo(weakself.view.mas_safeAreaLayoutGuideBottom);
        }else{
            make.top.bottom.equalTo(weakself.view);
            make.left.right.equalTo(weakself.view);
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
