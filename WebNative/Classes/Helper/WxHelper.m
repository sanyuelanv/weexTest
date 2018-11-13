//
//  WxHelper.m
//  WebNative
//
//  Created by 宋航 on 2018/11/13.
//  Copyright © 2018 宋航. All rights reserved.
//

#import "WxHelper.h"
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <WeexSDK/WeexSDK.h>
@interface WxHelper()
@property (nonatomic,strong) NSDictionary* sysInfo;
@end
@implementation WxHelper

WX_EXPORT_METHOD(@selector(getSystemInfo:))
-(NSDictionary *)sysInfo{
    if (!_sysInfo) {
        // 设备名称，屏幕大小，系统名称，版本，APP版本
        NSString *name = [[UIDevice currentDevice] name];
        CGSize size = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        NSString *systemName = [[UIDevice currentDevice] systemName];
        NSString *systemVersion = [[UIDevice currentDevice] systemVersion];
        NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
        NSString *appVersion = infoDict[@"CFBundleVersion"];
        NSDictionary *sizeDict = @{
                                   @"width":[NSString stringWithFormat:@"%f",size.width],
                                   @"height":[NSString stringWithFormat:@"%f",size.height],
                                   };
        NSDictionary *dict = @{
                               @"deviceName":name,
                               @"screenSize":sizeDict,
                               @"systemName":systemName,
                               @"systemVersion":systemVersion,
                               @"appVersion":appVersion
                               };
        _sysInfo = dict;
    }
    return _sysInfo;
}
-(void)getSystemInfo:(WXModuleKeepAliveCallback)callback{
    
    callback(self.sysInfo,NO);
}
@end
