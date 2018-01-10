//
//  ViewController8.m
//  Demo_CoreAnimation
//
//  Created by 吴珂 on 2018/1/10.
//  Copyright © 2018年 世纪阳天. All rights reserved.
//

#import "ViewController8.h"

@interface ViewController8 ()

@end

@implementation ViewController8

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSLog(@"CATransaction 关闭隐式动画");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [CATransaction begin];
    [CATransaction setDisableActions:YES];//关闭动画行为
    
    UITouch *touch = [touches anyObject];
    self.testLayer.position = [touch locationInView:self.view];//修改位置的隐式动画
    CGFloat WH = arc4random_uniform(100);
    if (WH < 20) {
        WH += 50;
    }
    self.testLayer.bounds = CGRectMake(0, 0, WH, WH);
    [CATransaction commit];
}

@end
