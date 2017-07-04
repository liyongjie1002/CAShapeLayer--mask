//
//  ViewController.m
//  遮罩效果
//
//  Created by liyongjie on 2017/7/4.
//  Copyright © 2017年 liyongjie. All rights reserved.
//

#import "ViewController.h"

//弧度转角度
#define RADIANS_TO_DEGREES(radians) ((radians) * (180.0 / M_PI))
//角度转弧度
#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 300)];
    view.center = self.view.center;
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];

    CAShapeLayer *layer = [self createMaskLayer];
    //利用layer的mask属性实现遮罩效果
    view.layer.mask = layer;

}



-(CAShapeLayer *)createMaskLayer{
 
 //五角星位置可能不太准确，请见谅😯
    CGFloat width = 65.29;
 
    
    //五角星的十个顶点
    CGPoint point0 = CGPointMake(100, 0);
    CGPoint point1 = CGPointMake(100+width*sin(DEGREES_TO_RADIANS(18)), 69);
    CGPoint point2 = CGPointMake(195,69);
    CGPoint point3 = CGPointMake(195 - width*cos(DEGREES_TO_RADIANS(36)),69+width*cos(DEGREES_TO_RADIANS(36)));
    CGPoint point4 = CGPointMake(159,181);
    CGPoint point5 = CGPointMake(100,181 - width*sin(DEGREES_TO_RADIANS(36)));
    CGPoint point6 = CGPointMake(41,181);
    CGPoint point7 = CGPointMake(5 + width*cos(DEGREES_TO_RADIANS(36)),69+width*cos(DEGREES_TO_RADIANS(36)));
    CGPoint point8 = CGPointMake(5, 69);
    CGPoint point9 = CGPointMake(100 - width*sin(DEGREES_TO_RADIANS(18)), 69);
 
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:point0];
    [path addLineToPoint:point1];
    [path addLineToPoint:point2];
    [path addLineToPoint:point3];
    [path addLineToPoint:point4];
    [path addLineToPoint:point5];
    [path addLineToPoint:point6];
    [path addLineToPoint:point7];
    [path addLineToPoint:point8];
    [path addLineToPoint:point9];

    [path closePath];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    return layer;
}

@end
