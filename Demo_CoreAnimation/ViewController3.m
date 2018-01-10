//
//  ViewController3.m
//  Demo_CoreAnimation
//
//  Created by 吴珂 on 2018/1/9.
//  Copyright © 2018年 世纪阳天. All rights reserved.
//

#import "ViewController3.h"

@interface ViewController3 ()
@property (nonatomic, strong) CAKeyframeAnimation *positionAnimation;
@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"CAKeyframeAnimation");
    //重新设置初始位置
    self.testLayer.position = CGPointMake(33.5, 409.5);
    self.testLayer.bounds = CGRectMake(0, 0, 50, 50);
    
    CGPathRef bezirePath = [self bezirePath];
    
    //绘制轨迹
    CAShapeLayer *positionTrackLayer = [[CAShapeLayer alloc] init];
    
    positionTrackLayer.path = bezirePath;
    positionTrackLayer.strokeColor = [UIColor redColor].CGColor;
    positionTrackLayer.fillColor = [UIColor clearColor].CGColor;
    [self.view.layer addSublayer:positionTrackLayer];
    
    //添加保存动画
    self.positionAnimation = [self keyframeAnimation:bezirePath];
}

- (CGPathRef)bezirePath
{
    UIBezierPath* bezierPath = UIBezierPath.bezierPath;
    CGPoint fromPoint = CGPointMake(33.5, 409.5);
    [bezierPath moveToPoint: fromPoint];
    [bezierPath addCurveToPoint: CGPointMake(127.5, 119.78) controlPoint1: CGPointMake(58.5, 433.93) controlPoint2: CGPointMake(86.5, 95.16)];
    [bezierPath addCurveToPoint: CGPointMake(183.5, 554.5) controlPoint1: CGPointMake(168.5, 144.4) controlPoint2: CGPointMake(112.5, 557.05)];
    [bezierPath addCurveToPoint: CGPointMake(251.5, 119.78) controlPoint1: CGPointMake(254.5, 551.95) controlPoint2: CGPointMake(251.5, 119.78)];
    return bezierPath.CGPath;
}

- (CAKeyframeAnimation *)keyframeAnimation:(CGPathRef)bezirePath
{
    CAKeyframeAnimation *moveAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    moveAnimation.path = bezirePath;
    moveAnimation.fillMode = kCAFillModeForwards;
    moveAnimation.removedOnCompletion = NO;
    moveAnimation.duration = 3.f;
    
    return moveAnimation;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.testLayer addAnimation:self.positionAnimation forKey:@"position"];
}

@end
