//
//  MGFDrawPolytronViewController.m
//  Portfolio
//
//  Created by Mark Feaver on 8/09/14.
//  Copyright (c) 2014 Mark Feaver. All rights reserved.
//

#import "MGFDrawPolytronViewController.h"

static CGFloat const MGFPolytronLineWidth     = 20.0;
static CGFloat const MGFPolytronInnerRadius   = 28.0;
static CGFloat const MGFPolytronBaseHeight    = 75.0;
static CGFloat const MGFPolytronLogoHeight    = 216.0;

#define DEGREES_TO_RADIANS(degrees) ((M_PI / 180.0) * degrees)
#define RADIANS_TO_DEGREES(radians) ((180.0/ M_PI)  * radians)

@interface MGFDrawPolytronViewController ()

@end

@implementation MGFDrawPolytronViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self mf_drawPolytronLogo];
    
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"polytron_reference"]];
//    imageView.frame = self.view.frame;
//    [self.view addSubview:imageView];
//    imageView.alpha = 0.5;
}

- (void)mf_drawPolytronLogo
{
    CGFloat viewWidth   = CGRectGetWidth (self.view.frame);
    CGFloat viewHeight  = CGRectGetHeight(self.view.frame);
    
    // First Shape
    CGPathRef firstShape = [self mf_generateFirstShape];
    
    CAShapeLayer *innerP = [CAShapeLayer layer];
    innerP.path        = firstShape;
    innerP.position    = CGPointMake(viewWidth/2.0, viewHeight/2.0 - 33.5);
    innerP.lineWidth   = MGFPolytronLineWidth;
    innerP.fillColor   = [UIColor clearColor].CGColor;
    innerP.strokeColor = [UIColor blackColor].CGColor;
    
    [self.view.layer addSublayer:innerP];
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration    = 1.0;
    animation.repeatCount = 1.0;
    animation.fromValue   = [NSNumber numberWithFloat:0.0];
    animation.toValue     = [NSNumber numberWithFloat:1.0];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [innerP addAnimation:animation forKey:@"innerPolytronAnimation"];
    
    // Second Shape
    CGPathRef secondShape = [self mf_generateSecondShape];
    
    CAShapeLayer *secondP = [CAShapeLayer layer];
    secondP.path        = secondShape;
    secondP.position    = CGPointMake(viewWidth/2.0, viewHeight/2.0 - 33.5);
    secondP.lineWidth   = MGFPolytronLineWidth;
    secondP.fillColor   = [UIColor clearColor].CGColor;
    secondP.strokeColor = [UIColor colorWithRed:(254.0/255.0) green:(106.0/255.0) blue:(0.0/255.0) alpha:1.0].CGColor;
    
    [self.view.layer addSublayer:secondP];
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation2.duration    = 1.2;
    animation2.repeatCount = 1.0;
    animation2.fromValue   = [NSNumber numberWithFloat:0.0];
    animation2.toValue     = [NSNumber numberWithFloat:1.0];
    animation2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [secondP addAnimation:animation2 forKey:@"innerPolytronAnimation"];
    
    // Third Shape
    CGPathRef thirdShape = [self mf_generateThirdShape];
    
    CAShapeLayer *thirdP = [CAShapeLayer layer];
    thirdP.path        = thirdShape;
    thirdP.position    = CGPointMake(viewWidth/2.0, viewHeight/2.0 - 33.5);
    thirdP.lineWidth   = MGFPolytronLineWidth;
    thirdP.fillColor   = [UIColor clearColor].CGColor;
    thirdP.strokeColor = [UIColor colorWithRed:(255.0/255.0) green:(255.0/255.0) blue:(0.0/255.0) alpha:1.0].CGColor;
    
    [self.view.layer addSublayer:thirdP];
    CABasicAnimation *animation3 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation3.duration    = 1.4;
    animation3.repeatCount = 1.0;
    animation3.fromValue   = [NSNumber numberWithFloat:0.0];
    animation3.toValue     = [NSNumber numberWithFloat:1.0];
    animation3.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [thirdP addAnimation:animation3 forKey:@"innerPolytronAnimation"];
    
    // Fourth Shape
    CGPathRef fourthShape = [self mf_generateFourthShape];
    
    CAShapeLayer *fourthP = [CAShapeLayer layer];
    fourthP.path        = fourthShape;
    fourthP.position    = CGPointMake(viewWidth/2.0, viewHeight/2.0 - 33.5);
    fourthP.lineWidth   = MGFPolytronLineWidth;
    fourthP.fillColor   = [UIColor clearColor].CGColor;
    fourthP.strokeColor = [UIColor colorWithRed:(0.0/255.0) green:(170.0/255.0) blue:(255.0/255.0) alpha:1.0].CGColor;
    
    [self.view.layer addSublayer:fourthP];
    CABasicAnimation *animation4 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation4.duration    = 1.6;
    animation4.repeatCount = 1.0;
    animation4.fromValue   = [NSNumber numberWithFloat:0.0];
    animation4.toValue     = [NSNumber numberWithFloat:1.0];
    animation4.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [fourthP addAnimation:animation4 forKey:@"innerPolytronAnimation"];
}

- (CGPathRef)mf_generateFirstShape
{
    CGFloat centerX = 0.0;
    CGFloat centerY = 0.0;
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:     CGPointMake(centerX - MGFPolytronInnerRadius - MGFPolytronLineWidth/4.0, centerY + MGFPolytronLogoHeight/2.0)];
    [path addLineToPoint  :CGPointMake(centerX - MGFPolytronInnerRadius - MGFPolytronLineWidth/4.0, centerY + MGFPolytronLineWidth/2.0)];
    [path addArcWithCenter:CGPointMake(centerX + MGFPolytronLineWidth/4.0, centerY) radius:(MGFPolytronInnerRadius + MGFPolytronLineWidth/2.0) startAngle:DEGREES_TO_RADIANS(180.0) endAngle:DEGREES_TO_RADIANS(90.0) clockwise:YES];
    [path addLineToPoint:CGPointMake(centerX - MGFPolytronInnerRadius, centerY + MGFPolytronInnerRadius + MGFPolytronLineWidth/2.0)];
    
    return path.CGPath;
}

- (CGPathRef)mf_generateSecondShape
{
    CGFloat centerX = 0.0;
    CGFloat centerY = 0.0;
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:     CGPointMake(centerX - MGFPolytronInnerRadius - MGFPolytronLineWidth/4.0 - MGFPolytronLineWidth, centerY + MGFPolytronLogoHeight/2.0)];
    [path addLineToPoint  :CGPointMake(centerX - MGFPolytronInnerRadius - MGFPolytronLineWidth/4.0 - MGFPolytronLineWidth, centerY + MGFPolytronLineWidth/2.0)];
    [path addArcWithCenter:CGPointMake(centerX + MGFPolytronLineWidth/4.0, centerY) radius:(MGFPolytronInnerRadius + MGFPolytronLineWidth/2.0 + MGFPolytronLineWidth) startAngle:DEGREES_TO_RADIANS(180.0) endAngle:DEGREES_TO_RADIANS(90.0) clockwise:YES];
    [path addLineToPoint:CGPointMake(centerX - MGFPolytronInnerRadius + MGFPolytronLineWidth/4.0, centerY + MGFPolytronInnerRadius + MGFPolytronLineWidth/2.0 + MGFPolytronLineWidth)];
    
    return path.CGPath;
}

- (CGPathRef)mf_generateThirdShape
{
    CGFloat centerX = 0.0;
    CGFloat centerY = 0.0;
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:     CGPointMake(centerX - MGFPolytronInnerRadius - MGFPolytronLineWidth/4.0 - MGFPolytronLineWidth*2, centerY + MGFPolytronLogoHeight/2.0)];
    [path addLineToPoint  :CGPointMake(centerX - MGFPolytronInnerRadius - MGFPolytronLineWidth/4.0 - MGFPolytronLineWidth*2, centerY + MGFPolytronLineWidth/2.0)];
    [path addArcWithCenter:CGPointMake(centerX + MGFPolytronLineWidth/4.0, centerY) radius:(MGFPolytronInnerRadius + MGFPolytronLineWidth/2.0 + MGFPolytronLineWidth*2) startAngle:DEGREES_TO_RADIANS(180.0) endAngle:DEGREES_TO_RADIANS(90.0) clockwise:YES];
    [path addLineToPoint:CGPointMake(centerX - MGFPolytronInnerRadius + MGFPolytronLineWidth/4.0, centerY + MGFPolytronInnerRadius + MGFPolytronLineWidth/2.0 + MGFPolytronLineWidth*2)];
    
    return path.CGPath;
}

- (CGPathRef)mf_generateFourthShape
{
    CGFloat centerX = 0.0;
    CGFloat centerY = 0.0;
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:     CGPointMake(centerX - MGFPolytronInnerRadius - MGFPolytronLineWidth/4.0 - MGFPolytronLineWidth*3, centerY + MGFPolytronLogoHeight/2.0)];
    [path addLineToPoint  :CGPointMake(centerX - MGFPolytronInnerRadius - MGFPolytronLineWidth/4.0 - MGFPolytronLineWidth*3, centerY + MGFPolytronLineWidth/2.0)];
    [path addArcWithCenter:CGPointMake(centerX + MGFPolytronLineWidth/4.0, centerY) radius:(MGFPolytronInnerRadius + MGFPolytronLineWidth/2.0 + MGFPolytronLineWidth*3) startAngle:DEGREES_TO_RADIANS(180.0) endAngle:DEGREES_TO_RADIANS(90.0) clockwise:YES];
    [path addLineToPoint:CGPointMake(centerX - MGFPolytronInnerRadius + MGFPolytronLineWidth/4.0, centerY + MGFPolytronInnerRadius + MGFPolytronLineWidth/2.0 + MGFPolytronLineWidth*3)];
    
    return path.CGPath;
}

@end
