//
//  ViewController7.m
//  Demo_CoreAnimation
//
//  Created by 吴珂 on 2018/1/10.
//  Copyright © 2018年 世纪阳天. All rights reserved.
//

#import "ViewController7.h"

@interface ViewController7 ()<CAAnimationDelegate>

@end

@implementation ViewController7

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"监听动画完成状态");
    CABasicAnimation *positionAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    CGPoint fromPoint = CGPointMake(100, 100);
    positionAnimation.fromValue = [NSValue valueWithCGPoint:fromPoint];
    positionAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(300, 300)];
    positionAnimation.duration = 3.f;
    positionAnimation.fillMode = kCAFillModeForwards;
    positionAnimation.removedOnCompletion = NO;
    
    positionAnimation.delegate = self;
    
    [positionAnimation setValue:@"位置动画" forKey:@"animationName"];//添加属性名
    
    [self.testLayer addAnimation:positionAnimation forKey:@"positionAnimation"];
}


//在动画开始时被调用
- (void)animationDidStart:(CAAnimation *)anim
{
    NSLog(@"%@-----动画开始", [anim valueForKey:@"animationName"]);
}

//在动画结束时被调用, 如果是动画被移除则flag为false，正常结束为true
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (flag) {
        NSLog(@"%@-----动画正常结束", [anim valueForKey:@"animationName"]);
    }else{
        NSLog(@"%@-----动画移除结束", [anim valueForKey:@"animationName"]);
    }
}

@end
