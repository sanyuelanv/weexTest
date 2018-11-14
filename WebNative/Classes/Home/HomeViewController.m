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
@property (nonatomic,weak)UITextField *textField;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"首页";
    self.navigationController.navigationBar.translucent= NO;
    self.view.backgroundColor = UIColor.whiteColor;
    [self setUpWeexConfig];
}
-(void)setUpWeexConfig{
    // 按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(self.view.frame.size.width/2 - 50, 200, 100, 50);
    [btn setTitle:@"进入" forState:UIControlStateNormal];
    [btn setBackgroundColor:UIColor.redColor];
    [btn addTarget:self action:@selector(btnEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    // 输入框
    UITextField *textField = [[UITextField alloc] init];
    textField.frame = CGRectMake(10, 100, self.view.frame.size.width - 20, 50);
    textField.backgroundColor = UIColor.grayColor;
    self.textField = textField;
    [self.view addSubview:textField];
    // 读取存储数据
     NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:@"testURL"];
    if(str||str.length){
        self.textField.text = str;
    }
    else{
        self.textField.text = @"http://172.20.0.56/test/index.js";
    }
}
-(void)btnEvent{
    
    NSString *str = self.textField.text;
    if(str.length){
        [[NSUserDefaults standardUserDefaults] setObject:str forKey:@"testURL"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        WeexViewController *weexVc = [[WeexViewController alloc] initWithURL:str];
        [self.navigationController pushViewController:weexVc animated:YES];
    }
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
