//
//  AppDelegate.m
//  WebNative
//
//  Created by 宋航 on 2018/11/12.
//  Copyright © 2018 宋航. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import <WeexSDK/WXImgLoaderProtocol.h>
#import "WXImgLoader.h"
#import "WxHelper.h"
#import "MoveComponent.h"
#import <WeexSDK.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self setUpWeex];
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    HomeViewController *homeVc = [[HomeViewController alloc] init];
    UINavigationController *vc = [[UINavigationController alloc] initWithRootViewController:homeVc];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)setUpWeex{
    // 设置配置
    [WXAppConfiguration setAppGroup:@"test"];
    [WXAppConfiguration setAppName:@"test"];
    [WXAppConfiguration setAppVersion:@"0.0.1"];
    //设置SDK环境
    [WXSDKEngine initSDKEnvironment];
    //自己实现图片下载
    [WXSDKEngine registerHandler:[WXImgLoader new] withProtocol:@protocol(WXImgLoaderProtocol)];
    // 定义一个查询系统信息的模块
    [WXSDKEngine registerModule:@"systemApi" withClass:[WxHelper class]];
    // 定义一个可以拖动的组件
    [WXSDKEngine registerComponent:@"moveView" withClass:[MoveComponent class]];
    //set the log level
    [WXLog setLogLevel: WXLogLevelAll];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
