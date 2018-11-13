//
//  WXImgLoader.m
//  WebNative
//
//  Created by 宋航 on 2018/11/12.
//  Copyright © 2018 宋航. All rights reserved.
//

#import "WXImgLoader.h"
#import <WeexSDK/WXImgLoaderProtocol.h>
#import <SDWebImage/UIImageView+WebCache.h>

@implementation WXImgLoader

- (id<WXImageOperationProtocol>)downloadImageWithURL:(NSString *)url imageFrame:(CGRect)imageFrame userInfo:(NSDictionary *)options completed:(void (^)(UIImage *, NSError *, BOOL))completedBlock {
    if ([url hasPrefix:@"//"]) {
        url = [@"http:" stringByAppendingString:url];
    }
    
    SDWebImageManager *imgWeb = [SDWebImageManager sharedManager];
    
    return (id)[imgWeb loadImageWithURL:[NSURL URLWithString:url] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        
    } completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL * _Nullable imageURL) {
        if(completedBlock) {
            completedBlock(image, error, finished);
        };
    }];
}

@end
