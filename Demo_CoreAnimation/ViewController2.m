//
//  ViewController2.m
//  Demo_CoreAnimation
//
//  Created by 吴珂 on 2018/1/9.
//  Copyright © 2018年 世纪阳天. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"CABasicAnimation");
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    CABasicAnimation *positionAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    positionAnimation.fromValue = [NSValue valueWithCGPoint:self.testLayer.presentationLayer.position];
    positionAnimation.toValue = [NSValue valueWithCGPoint:point];
    positionAnimation.duration = 1.f;//动画时长
    positionAnimation.removedOnCompletion = NO;//是否在完成时移除
    positionAnimation.fillMode = kCAFillModeForwards;//动画结束后是否保持状态
    [self.testLayer addAnimation:positionAnimation forKey:@"positionAnimation"];
}


@end
