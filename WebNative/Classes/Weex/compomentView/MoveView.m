//
//  MoveView.m
//  WebNative
//
//  Created by 宋航 on 2018/11/13.
//  Copyright © 2018 宋航. All rights reserved.
//

#import "MoveView.h"
@interface MoveView ()
@property BOOL isMove;
@end
@implementation MoveView
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.isMove = NO;
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if(!self.isMove){
        [self.delegate tap];
    }
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.isMove = YES;
    UITouch *touch = [touches anyObject];
    // 当前的点
    CGPoint point = [touch locationInView:self.superview];
    // 上一个点
    CGPoint prePoint = [touch previousLocationInView:self.superview];
    // 当前的center
    CGPoint center = self.center;
    center.x += (point.x - prePoint.x);
    center.y += (point.y - prePoint.y);
    self.center = center;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
