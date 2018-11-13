//
//  WeexViewController.m
//  WebNative
//
//  Created by 宋航 on 2018/11/12.
//  Copyright © 2018 宋航. All rights reserved.
//

#import "WeexViewController.h"
#import "ReloadButton.h"
#import <WeexSDK/WXSDKInstance.h>
@interface WeexViewController ()
@property (nonatomic,strong) WXSDKInstance *instance;
@property (nonatomic,weak) UIView *weexView;
@property (nonatomic,weak) UIView *mainView;
@property (nonatomic,weak) UILabel *loadLabel;
@property (nonatomic,weak) NSString *url;
@property (nonatomic,weak) UIButton *reloadBtn;
@end

@implementation WeexViewController
-(instancetype)initWithURL:(NSString *)url{
    self = [super init];
    self.url = url;
    return self;
    
}
#pragma mark - 懒加载
- (UIButton *)reloadBtn{
    if (!_reloadBtn) {
        ReloadButton *btn = [ReloadButton buttonWithType:UIButtonTypeSystem];
        btn.frame = CGRectMake(self.view.frame.size.width - 100, self.view.frame.size.height - 40, 80, 30);
        [btn setBackgroundColor:UIColor.redColor];
        [btn addTarget:self action:@selector(reload) forControlEvents:UIControlEventTouchUpInside];
        _reloadBtn = btn;
        [self.view addSubview:_reloadBtn];
    }
    return _reloadBtn;
}
- (UILabel *)loadLabel{
    if(!_loadLabel){
        UILabel *loadLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, self.view.frame.size.height/2 - 10, self.view.frame.size.width- 20, 20)];
        loadLabel.numberOfLines = 0;
        loadLabel.textAlignment = 1;
        _loadLabel = loadLabel;
        [self.view addSubview:_loadLabel];
    }
    return _loadLabel;
}

#pragma mark - 添加 刷新按钮 & 加载中提示 & 承载 weex 的 view
-(void)setUpReload{
    // 注意层次
    [self.loadLabel setText:@"加载中"];
    
    UIView *view = [[UIView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:view];
    self.mainView = view;
    
    [self.reloadBtn setTitle:@"刷新" forState:UIControlStateNormal];
    [self.view setBackgroundColor:UIColor.whiteColor];
}
-(void)reload{
    [_instance destroyInstance];
    self.loadLabel.hidden = NO;
    [self setUpWeex];
}
#pragma mark - 创建 weex 的View
-(void)setUpWeex{
    _instance = [[WXSDKInstance alloc] init];
    _instance.viewController = self;
    [_instance setFrame:self.view.frame];
    __weak typeof(self) weakSelf = self;
    _instance.onCreate = ^(UIView *view) {
        weakSelf.loadLabel.hidden = YES;
        [weakSelf.weexView removeFromSuperview];
        weakSelf.weexView = view;
        weakSelf.weexView.backgroundColor = [UIColor whiteColor];
        [weakSelf.mainView addSubview:weakSelf.weexView];
    };
    _instance.onFailed = ^(NSError *error) {
        //process failure
        NSLog(@"%@", error);
    };
    
    _instance.renderFinish = ^ (UIView *view) {
        //process renderFinish
    };
    NSURL *url = [[NSURL alloc] initWithString:self.url];
    [_instance renderWithURL:url];
}
#pragma mark - 系统方法
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpReload];
    [self setUpWeex];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}
- (void)dealloc
{
    [_instance destroyInstance];
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
