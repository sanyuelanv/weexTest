//
//  ReloadButton.m
//  WebNative
//
//  Created by 宋航 on 2018/11/13.
//  Copyright © 2018 宋航. All rights reserved.
//

#import "ReloadButton.h"

@implementation ReloadButton

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
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
