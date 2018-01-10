//
//  ViewController4.m
//  Demo_CoreAnimation
//
//  Created by 吴珂 on 2018/1/9.
//  Copyright © 2018年 世纪阳天. All rights reserved.
//

#import "ViewController4.h"

@interface ViewController4 ()

@end

@implementation ViewController4

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"CAAnimationGroup");
    
    //重新设置layer大小与圆角
    self.testLayer.bounds = CGRectMake(0, 0, 30, 30);
    self.testLayer.cornerRadius = 30 / 2;
    
    //设置x轴方向的缩放动画
    CAKeyframeAnimation *xScaleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale.x"];
    xScaleAnimation.values = @[@1, @0.9, @1, @1.1, @0.9, @1];
    xScaleAnimation.duration = 3.f;
    xScaleAnimation.repeatCount = CGFLOAT_MAX;
    xScaleAnimation.removedOnCompletion = NO;
    xScaleAnimation.fillMode = kCAFillModeForwards;
    
    //设置y轴方向的缩放动画
    CAKeyframeAnimation *yScaleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale.x"];
    yScaleAnimation.values = @[@0.9, @1, @1.1, @0.8, @1, @0.9];
    yScaleAnimation.duration = 3.f;
    yScaleAnimation.repeatCount = CGFLOAT_MAX;
    yScaleAnimation.removedOnCompletion = NO;
    yScaleAnimation.fillMode = kCAFillModeForwards;
    
    //设置x轴方向的移动动画
    CAKeyframeAnimation *xTranslationAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
    xTranslationAnimation.values = @[@0, @5, @(-5), @0, @5, @0];
    xTranslationAnimation.duration = 3.f;
    xTranslationAnimation.repeatCount = CGFLOAT_MAX;
    xTranslationAnimation.removedOnCompletion = NO;
    xTranslationAnimation.fillMode = kCAFillModeForwards;
    
    //设置y轴方向的移动动画
    CAKeyframeAnimation *yTranslationAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.y"];
    yTranslationAnimation.values = @[@0, @5, @1, @-5, @0];
    yTranslationAnimation.duration = 3.f;
    yTranslationAnimation.repeatCount = CGFLOAT_MAX;
    yTranslationAnimation.removedOnCompletion = NO;
    yTranslationAnimation.fillMode = kCAFillModeForwards;
    
    //组动画
    CAAnimationGroup *groupAnimation = [[CAAnimationGroup alloc] init];
    groupAnimation.animations = @[xScaleAnimation, yScaleAnimation, xTranslationAnimation, yTranslationAnimation];//将所有动画添加到动画组
    groupAnimation.duration = 3.f;
    groupAnimation.repeatCount = CGFLOAT_MAX;
    groupAnimation.removedOnCompletion = NO;
    groupAnimation.fillMode = kCAFillModeForwards;
    
    [self.testLayer addAnimation:groupAnimation forKey:@"groupAnimation"];
}

@end
