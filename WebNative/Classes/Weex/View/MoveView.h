//
//  MoveView.h
//  WebNative
//
//  Created by 宋航 on 2018/11/13.
//  Copyright © 2018 宋航. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol MoveViewDelegate <NSObject>
- (void) tap;
@end
@interface MoveView : UIView
@property(nonatomic, weak) id delegate;
@end

NS_ASSUME_NONNULL_END
