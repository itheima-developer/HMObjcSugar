//
//  ViewController.m
//  HMObjcSugar
//
//  Created by 刘凡 on 16/3/20.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "ViewController.h"
#import "HMObjcSugar.h"

NSString *const cellIdentifier = @"cellIdentifier";

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self prepareTableView];
}

- (void)prepareTableView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
    
    [self.view addSubview:tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = @(indexPath.row).stringValue;
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor hm_randomColor];
    
    vc.hidesBottomBarWhenPushed = YES;
    
    // 如果不设置背景颜色，拖拽手势返回的时候，右上角会有黑色
    self.navigationController.view.backgroundColor = [UIColor whiteColor];
    
    [self.navigationController pushViewController:vc animated:YES];
}

@end