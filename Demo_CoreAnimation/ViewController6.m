//
//  ViewController6.m
//  Demo_CoreAnimation
//
//  Created by 吴珂 on 2018/1/9.
//  Copyright © 2018年 世纪阳天. All rights reserved.
//

#import "ViewController6.h"

@interface ViewController6 ()

@property (nonatomic, strong) CAKeyframeAnimation *positionAnimation;
@property (nonatomic, assign) BOOL isPositionAnimation;

@end

@implementation ViewController6

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"动画的暂停与恢复");
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
    if ([self.testLayer animationForKey:[self.testLayer.animationKeys firstObject]] == nil) {
        [self.testLayer addAnimation:self.positionAnimation forKey:@"position"];
        
        self.isPositionAnimation = YES;
        return;
    }
    
    if (self.isPositionAnimation) {
        [self pauseLayer:self.testLayer];
        self.isPositionAnimation = NO;
    }else{
        self.isPositionAnimation = YES;
        [self resumeLayer:self.testLayer];
    }
}

#pragma mark - 动画的暂停与恢复

/**
 暂停动画

 @param layer 要暂停的layer
 */
-(void)pauseLayer:(CALayer *)layer {
    CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    layer.speed = 0.0;
    layer.timeOffset = pausedTime;
}

/**
 恢复动画

 @param layer 要恢复的layer
 */
-(void)resumeLayer:(CALayer *)layer {
    CFTimeInterval pausedTime = [layer timeOffset];
    layer.speed = 1.0;
    layer.timeOffset = 0.0;
    layer.beginTime = 0.0;
    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    layer.beginTime = timeSincePause;
}


@end
