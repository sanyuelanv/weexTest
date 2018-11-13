//
//  HomeViewController.m
//  WebNative
//
//  Created by 宋航 on 2018/11/13.
//  Copyright © 2018 宋航. All rights reserved.
//

#import "HomeViewController.h"
#import "WeexViewController.h"
#import "Global.h"
@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"首页";
    self.navigationController.navigationBar.translucent= NO;
    self.view.backgroundColor = UIColor.whiteColor;
    [self setUpBtn];
}
-(void)setUpBtn{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(self.view.frame.size.width/2 - 50, self.view.frame.size.height/2 - 25, 100, 50);
    [btn setTitle:@"进入" forState:UIControlStateNormal];
    [btn setBackgroundColor:UIColor.redColor];
    [btn addTarget:self action:@selector(btnEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
-(void)btnEvent{
    WeexViewController *weexVc = [[WeexViewController alloc] initWithURL:JSURL];
    [self.navigationController pushViewController:weexVc animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
