//
//  SuperViewController.m
//  Demo_CoreAnimation
//
//  Created by 吴珂 on 2017/12/27.
//  Copyright © 2017年 世纪阳天. All rights reserved.
//

#import "SuperViewController.h"

@interface SuperViewController ()

@end

@implementation SuperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = NSStringFromClass(self.class);
    
    NSLog(@"==========%@===========", NSStringFromClass(self.class));
    
    self.testLayer = ({
        CALayer *tempLayer = [CALayer new];
        tempLayer.backgroundColor = [UIColor cyanColor].CGColor;
        tempLayer.position = self.view.center;
        tempLayer.bounds = CGRectMake(0, 0, 100, 100);
        [self.view.layer addSublayer:tempLayer];
        tempLayer;
    });
}


@end
