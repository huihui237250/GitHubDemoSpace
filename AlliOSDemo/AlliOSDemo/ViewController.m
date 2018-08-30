//
//  ViewController.m
//  AlliOSDemo
//
//  Created by Banning on 2018/8/30.
//  Copyright © 2018年 Banning. All rights reserved.
//

#import "ViewController.h"
#import "Nutils.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *contentArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Demo";
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.offset(0);
    }];
}

- (NSArray *)contentArray{
    if (!_contentArray) {
        _contentArray = @[
                          @[[NSNumber numberWithInteger:DemoType_Animation]]
                          
                          ];
    }
    return _contentArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSString *)getDemoTypeName:(DemoType)demoType{
    NSString *demoTypeStr = nil;
    switch (demoType) {
        case DemoType_Animation:
            demoTypeStr = @"Custom Animation";
            break;
            
        default:
            break;
    }
    return demoTypeStr;
}

#pragma mark - UITableViewDataSource,UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.contentArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return ((NSArray *)(self.contentArray[section])).count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *demoAccessCellId = @"DemoAccessCellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:demoAccessCellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:demoAccessCellId];
        cell.textLabel.textColor = [UIColor blackColor];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    DemoType demoType = [self.contentArray[indexPath.section][indexPath.row] integerValue];
    cell.textLabel.text = [self getDemoTypeName:demoType];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
