//
//  ViewController9.m
//  Demo_CoreAnimation
//
//  Created by 吴珂 on 2018/1/10.
//  Copyright © 2018年 世纪阳天. All rights reserved.
//

#import "ViewController9.h"

@interface ViewController9 ()

@end

@implementation ViewController9

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"CATransaction 修改动画参数");
    
    [CATransaction begin];
    
    [CATransaction setValue:[NSNumber numberWithFloat:5.f]
                     forKey:kCATransactionAnimationDuration];
    
    CABasicAnimation *positionAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    CGPoint fromPoint = CGPointMake(100, 100);
    positionAnimation.fromValue = [NSValue valueWithCGPoint:fromPoint];
    positionAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(300, 300)];
    positionAnimation.fillMode = kCAFillModeForwards;
    positionAnimation.removedOnCompletion = NO;
    
    [positionAnimation setValue:@"位置动画" forKey:@"animationName"];//添加属性名
    
    [self.testLayer addAnimation:positionAnimation forKey:@"positionAnimation"];
    
    
    
    
    
    [CATransaction commit];
}
@end
