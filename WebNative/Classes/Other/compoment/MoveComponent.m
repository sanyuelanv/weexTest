//
//  MoveComponent.m
//  WebNative
//
//  Created by 宋航 on 2018/11/13.
//  Copyright © 2018 宋航. All rights reserved.
//

#import "MoveComponent.h"
#import "MoveView.h"


@interface MoveComponent()<MoveViewDelegate>

@end
@implementation MoveComponent:WXComponent
- (UIView *)loadView {
    return [MoveView new];
}
- (void)viewDidLoad {
    ((MoveView *)self.view).delegate = self;
}
- (void)addEvent:(NSString *)eventName {
//    if ([eventName isEqualToString:@"tap"]) {}
}

- (void)removeEvent:(NSString *)eventName{
//    if ([eventName isEqualToString:@"tap"]) {}
}
-(void)tap{
    NSLog(@"21213");
    [self fireEvent:@"tap" params:@{@"value":@"key"} domChanges:nil];
}
@end
