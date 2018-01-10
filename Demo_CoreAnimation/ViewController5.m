//
//  ViewController5.m
//  Demo_CoreAnimation
//
//  Created by 吴珂 on 2018/1/9.
//  Copyright © 2018年 世纪阳天. All rights reserved.
//

#import "ViewController5.h"

@interface ViewController5 ()

@end

@implementation ViewController5

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"CATransition");
    

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CATransition *transition = [CATransition animation];
    transition.startProgress = 0.5;//开始进度
    transition.endProgress = 1;//结束进度
    transition.type = kCATransitionReveal;//渐变类型
    transition.subtype = kCATransitionFromLeft;//渐变方向
    transition.duration = 1.f;
    
    UIColor *color = [UIColor colorWithRed:arc4random_uniform(255) / 255.0 green:arc4random_uniform(255) / 255.0 blue:arc4random_uniform(255) / 255.0 alpha:1.f];
    self.testLayer.backgroundColor = color.CGColor;
    
    [self.testLayer addAnimation:transition forKey:@"transition"];
}

@end
