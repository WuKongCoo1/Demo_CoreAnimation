//
//  ViewController1.m
//  Demo_CoreAnimation
//
//  Created by 吴珂 on 2018/1/9.
//  Copyright © 2018年 世纪阳天. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()



@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"隐式动画");
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    self.testLayer.position = [touch locationInView:self.view];//修改位置的隐式动画
    CGFloat WH = arc4random_uniform(100);
    if (WH < 20) {
        WH += 50;
    }
    self.testLayer.bounds = CGRectMake(0, 0, WH, WH);
    UIColor *color = [UIColor colorWithRed:arc4random_uniform(255) / 255.0 green:arc4random_uniform(255) / 255.0 blue:arc4random_uniform(255) / 255.0 alpha:1.f];
    self.testLayer.backgroundColor = color.CGColor;//修改背景色的隐式动画
}

@end
