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

#define DEGREES_TO_RADIANS(degrees) ((M_PI / 180.0) * degrees)
#define RADIANS_TO_DEGREES(radians) ((180.0/ M_PI)  * radians)

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
    CGFloat logoHeight = (MGFPolytronInnerRadius + MGFPolytronLineWidth * 3.0) * 2 + MGFPolytronLineWidth;
    // Start outside in
    // Fourth shape
    [self mf_drawPWithRadius:(MGFPolytronInnerRadius + MGFPolytronLineWidth * 3.0)
                      height:logoHeight
                    duration:1.6
                       color:[UIColor colorWithRed:(0.0/255.0) green:(170.0/255.0) blue:(255.0/255.0) alpha:1.0].CGColor];
    // Third shape
    [self mf_drawPWithRadius:(MGFPolytronInnerRadius + MGFPolytronLineWidth * 2.0)
                      height:logoHeight
                    duration:1.4
                       color:[UIColor colorWithRed:(255.0/255.0) green:(255.0/255.0) blue:(0.0/255.0) alpha:1.0].CGColor];
    // Second shape
    [self mf_drawPWithRadius:(MGFPolytronInnerRadius + MGFPolytronLineWidth * 1.0)
                      height:logoHeight
                    duration:1.2
                       color:[UIColor colorWithRed:(254.0/255.0) green:(106.0/255.0) blue:(0.0/255.0) alpha:1.0].CGColor];
    // First shape
    [self mf_drawPWithRadius:(MGFPolytronInnerRadius + MGFPolytronLineWidth * 0.0)
                      height:logoHeight
                    duration:1.0
                       color:[UIColor blackColor].CGColor];
}

// TODO: Factory?
- (void)mf_drawPWithRadius:(CGFloat)radius height:(CGFloat)height duration:(CGFloat)duration color:(CGColorRef)color
{
    CGFloat viewWidth   = CGRectGetWidth (self.view.frame);
    CGFloat viewHeight  = CGRectGetHeight(self.view.frame);
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration    = duration;
    animation.repeatCount = 1.0;
    animation.fromValue   = [NSNumber numberWithFloat:0.0];
    animation.toValue     = [NSNumber numberWithFloat:1.0];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    CGPathRef path = [self mf_generatePWithRadius:radius andHeight:height];
    CAShapeLayer *innerP = [CAShapeLayer layer];
    innerP.path        = path;
    innerP.position    = CGPointMake(viewWidth/2.0, viewHeight/2.0 - 33.5);
    innerP.lineWidth   = MGFPolytronLineWidth;
    innerP.fillColor   = [UIColor clearColor].CGColor;
    innerP.strokeColor = color;
    
    [self.view.layer addSublayer:innerP];
    [innerP addAnimation:animation forKey:@"polytronAnimation"];
}

- (CGPathRef)mf_generatePWithRadius:(CGFloat)radius andHeight:(CGFloat)height
{
    CGFloat centerX = 0.0;
    CGFloat centerY = 0.0;
    UIBezierPath *path = [UIBezierPath bezierPath];

    [path moveToPoint:     CGPointMake(centerX - radius, centerY + height/2.0)];
    [path addLineToPoint:  CGPointMake(centerX - radius, centerY)];
    [path addArcWithCenter:CGPointMake(centerX, centerY) radius:radius startAngle:DEGREES_TO_RADIANS(180.0) endAngle:DEGREES_TO_RADIANS(90.0) clockwise:YES];
    [path addLineToPoint:  CGPointMake(centerX - radius, centerY + radius)];
    
    return path.CGPath;
}

@end
