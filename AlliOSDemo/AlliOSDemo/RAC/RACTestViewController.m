//
//  RACTestViewController.m
//  AlliOSDemo
//
//  Created by Banning on 2019/7/5.
//  Copyright © 2019 Banning. All rights reserved.
//

#import "RACTestViewController.h"
#import "Nutils.h"

@interface RACTestViewController ()

@end

@implementation RACTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *sendSignalBtn = [[UIButton alloc] init];
    sendSignalBtn.layer.cornerRadius = 5.0f;
    sendSignalBtn.backgroundColor = [UIColor blueColor];
    [sendSignalBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sendSignalBtn setTitle:@"Send Signal" forState:UIControlStateNormal];
    [self.view addSubview:sendSignalBtn];
    [sendSignalBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.offset(0);
        make.height.mas_equalTo(45);
        make.width.mas_equalTo(80);
    }];
    
    [[sendSignalBtn rac_signalForControlEvents:(UIControlEventTouchUpInside)] subscribeNext:^(__kindof UIControl * _Nullable x) {
        NSLog(@"--**-%@",[x class]);
    }];
}

@end
