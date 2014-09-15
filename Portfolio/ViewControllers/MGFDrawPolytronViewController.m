//
//  MGFDrawPolytronViewController.m
//  Portfolio
//
//  Created by Mark Feaver on 8/09/14.
//  Copyright (c) 2014 Mark Feaver. All rights reserved.
//

#import "MGFDrawPolytronViewController.h"

static CGFloat const MGFPolytronLineWidth     = 19.0;
static CGFloat const MGFPolytronInnerRadius   = MGFPolytronLineWidth * 2.0;

#define DEGREES_TO_RADIANS(degrees) ((M_PI / 180.0) * degrees)
#define RADIANS_TO_DEGREES(radians) ((180.0/ M_PI)  * radians)

@interface MGFDrawPolytronViewController ()

@property (strong, nonatomic) CALayer *polytronLogo;

@end

@implementation MGFDrawPolytronViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self mf_createScrollablePolytronAnimation];
//    [self mf_drawPolytronLogo];
    
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"polytron_reference"]];
//    imageView.frame = CGRectMake(self.view.frame.origin.x - 3.0, self.view.frame.origin.y + 33.5, self.view.frame.size.width, self.view.frame.size.height);
//    [self.view addSubview:imageView];
//    imageView.alpha = 0.3;
}

- (void)mf_createScrollablePolytronAnimation
{
    self.polytronLogo = [CALayer layer];

    CGFloat logoHeight = (MGFPolytronInnerRadius + MGFPolytronLineWidth * 3.0) * 2 + MGFPolytronLineWidth;
    CGPoint logoCenter = CGPointMake(CGRectGetMidX(self.view.frame), CGRectGetMidY(self.view.frame));
  
    CAShapeLayer *p1 = [self mf_generateShapeLayerWithPosition:logoCenter
                                                        radius:MGFPolytronInnerRadius
                                                        height:logoHeight
                                                         color:[UIColor blackColor].CGColor];
    CAShapeLayer *p2 = [self mf_generateShapeLayerWithPosition:logoCenter
                                                        radius:(MGFPolytronInnerRadius + MGFPolytronLineWidth * 1.0)
                                                        height:logoHeight
                                                         color:[UIColor colorWithRed:(254.0/255.0) green:(106.0/255.0) blue:(0.0/255.0) alpha:1.0].CGColor];
    CAShapeLayer *p3 = [self mf_generateShapeLayerWithPosition:logoCenter
                                                        radius:(MGFPolytronInnerRadius + MGFPolytronLineWidth * 2.0)
                                                        height:logoHeight
                                                         color:[UIColor colorWithRed:(255.0/255.0) green:(255.0/255.0) blue:(0.0/255.0) alpha:1.0].CGColor];
    CAShapeLayer *p4 = [self mf_generateShapeLayerWithPosition:logoCenter
                                                        radius:(MGFPolytronInnerRadius + MGFPolytronLineWidth * 3.0)
                                                        height:logoHeight
                                                         color:[UIColor colorWithRed:(0.0/255.0) green:(170.0/255.0) blue:(255.0/255.0) alpha:1.0].CGColor];

    p1.strokeEnd = 0.0;
    p2.strokeEnd = 0.0;
    p3.strokeEnd = 0.0;
    p4.strokeEnd = 0.0;
    
    [self.polytronLogo addSublayer:p4];
    [self.polytronLogo addSublayer:p3];
    [self.polytronLogo addSublayer:p2];
    [self.polytronLogo addSublayer:p1];
    
    [self.view.layer addSublayer:self.polytronLogo];
}

- (void)mf_drawPolytronLogo
{
    CGFloat logoHeight = (MGFPolytronInnerRadius + MGFPolytronLineWidth * 3.0) * 2 + MGFPolytronLineWidth;
    CGPoint logoCenter = CGPointMake(CGRectGetMidX(self.view.frame), CGRectGetMidY(self.view.frame));
    // Start outside in
    // Fourth shape
    [self mf_drawPWithPosition:logoCenter
                        radius:(MGFPolytronInnerRadius + MGFPolytronLineWidth * 3.0)
                        height:logoHeight
                      duration:1.6
                         color:[UIColor colorWithRed:(0.0/255.0) green:(170.0/255.0) blue:(255.0/255.0) alpha:1.0].CGColor];
    // Third shape
    [self mf_drawPWithPosition:logoCenter
                        radius:(MGFPolytronInnerRadius + MGFPolytronLineWidth * 2.0)
                        height:logoHeight
                      duration:1.4
                         color:[UIColor colorWithRed:(255.0/255.0) green:(255.0/255.0) blue:(0.0/255.0) alpha:1.0].CGColor];
    // Second shape
    [self mf_drawPWithPosition:logoCenter
                        radius:(MGFPolytronInnerRadius + MGFPolytronLineWidth * 1.0)
                        height:logoHeight
                      duration:1.2
                         color:[UIColor colorWithRed:(254.0/255.0) green:(106.0/255.0) blue:(0.0/255.0) alpha:1.0].CGColor];
    // First shape
    [self mf_drawPWithPosition:logoCenter
                        radius:(MGFPolytronInnerRadius + MGFPolytronLineWidth * 0.0)
                        height:logoHeight
                      duration:1.0
                         color:[UIColor blackColor].CGColor];
}

// TODO: Factory?
- (void)mf_drawPWithPosition:(CGPoint)position radius:(CGFloat)radius height:(CGFloat)height duration:(CGFloat)duration color:(CGColorRef)color
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration    = duration;
    animation.repeatCount = 1.0;
    animation.fromValue   = [NSNumber numberWithFloat:0.0];
    animation.toValue     = [NSNumber numberWithFloat:1.0];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    CAShapeLayer *pLayer = [self mf_generateShapeLayerWithPosition:position radius:radius height:height color:color];
    
    [self.view.layer addSublayer:pLayer];
    [pLayer addAnimation:animation forKey:@"polytronAnimation"];
}

- (CGPathRef)mf_generatePathWithRadius:(CGFloat)radius andHeight:(CGFloat)height
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

- (CAShapeLayer *)mf_generateShapeLayerWithPosition:(CGPoint)position radius:(CGFloat)radius height:(CGFloat)height color:(CGColorRef)color
{
    CAShapeLayer *layer = [CAShapeLayer layer];
    
    CGPathRef path = [self mf_generatePathWithRadius:radius andHeight:height];
    layer.path        = path;
    layer.position    = position;
    layer.lineWidth   = MGFPolytronLineWidth;
    layer.fillColor   = [UIColor clearColor].CGColor;
    layer.strokeColor = color;
    
    return layer;
}

- (IBAction)isScrolling:(UIPanGestureRecognizer *)sender
{
    for (CAShapeLayer *layer in self.polytronLogo.sublayers)
    {
        layer.strokeEnd = [sender locationInView:self.view].y / self.self.view.frame.size.height;
    }
}
@end
