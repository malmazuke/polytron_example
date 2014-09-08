//
//  MGFViewController.m
//  Portfolio
//
//  Created by Mark Feaver on 3/09/14.
//  Copyright (c) 2014 Mark Feaver. All rights reserved.
//

#import "MGFViewController.h"

@interface MGFViewController ()

@end

@implementation MGFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self mf_drawCurve];
}

- (void)mf_drawCurve
{
    CGFloat viewWidth   = CGRectGetWidth (self.view.frame);
    CGFloat viewHeight  = CGRectGetHeight(self.view.frame);
    CGFloat pathLength  = viewWidth * 0.75;
    CGFloat curveHeight = 50.0;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    // Start left side, mid Y
    CGFloat center = 0.0;
    CGFloat startX = center - pathLength/2.0;
    CGFloat startY = center;
    [path moveToPoint:CGPointMake(startX, startY)];
    [path addCurveToPoint:CGPointMake(-1.0 * startX, startY) controlPoint1:CGPointMake(center, center - curveHeight) controlPoint2:CGPointMake(center, center + curveHeight)];
    
    CAShapeLayer *curve = [CAShapeLayer layer];
    curve.path     = path.CGPath;
    curve.position = CGPointMake(viewWidth/2.0, viewHeight/2.0);
    
    curve.fillColor   = [UIColor clearColor].CGColor;
    curve.strokeColor = [UIColor blackColor].CGColor;
    curve.lineWidth   = 5.0;
    
    [self.view.layer addSublayer:curve];
    
    CABasicAnimation *drawAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    drawAnimation.duration    = 1.0;
    drawAnimation.repeatCount = 1.0;
    
    drawAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    drawAnimation.toValue   = [NSNumber numberWithFloat:1.0];
    
    drawAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    [curve addAnimation:drawAnimation forKey:@"drawCurveAnimation"];
}

@end
