//
//  LWLMenuAnimation.m
//  LampApp
//
//  Created by luowanglin on 16/11/18.
//  Copyright © 2016年 luowanglin. All rights reserved.
//

#import "LWLMenuAnimation.h"

static CGFloat kDefaultLineHeight = 2.0;
static CGFloat kDefaultLineSpace = 3.0;

@interface LWLMenuAnimation ()

@property(nonatomic ,strong) UIView *upline;
@property(nonatomic ,strong) UIView *midline;
@property(nonatomic ,strong) UIView *downline;

@end

@implementation LWLMenuAnimation

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
    
}


/*
 *@overWriter get function for lineSpace
 */

-(CGFloat)lineSpace{
    
    if (_lineSpace) {
        NSLog(@"zhixing line space");
        return _lineSpace;
    }else{
        return kDefaultLineSpace;
    }
    
}


/*
 * @overWriter get function for lineWidth
 */
-(CGFloat)linewidth{
    
    if (_linewidth) {
        NSLog(@"zhixing line width");
        return _linewidth;
    }else{
        return self.frame.size.width;
    }
    
}

/*
 *@overWriter get function for lineHeight
 */
-(CGFloat)lineheight{
    
    if (_lineheight) {
        NSLog(@"zhixing line height");
        return _lineheight;
    }else{
        return kDefaultLineHeight;
    }
    
}


/*
 *@overWriter get function for lineColor
 */
-(UIColor *)lineColor{
    
    if (_lineColor) {
        return _lineColor;
    }else{
        return [UIColor whiteColor];
    }
    
}


#pragma mark Initial for menu
- (void)layoutAnimatio{
    _upline = [[UIView alloc]initWithFrame:CGRectMake(0, self.lineSpace, self.linewidth, self.lineheight)];
    _upline.layer.cornerRadius = self.lineheight/2;
    _upline.layer.masksToBounds = YES;
    _upline.backgroundColor = self.lineColor;
    [_upline.layer setAnchorPoint:CGPointMake(0,0.5)];
    [_upline.layer setPosition:CGPointMake(0, self.lineSpace)];
    
    CGFloat midSpaceLine = (self.frame.size.height - 2 * self.lineSpace - 3 * self.lineheight) / 2 + self.lineSpace + self.lineheight;
    _midline = [[UIView alloc]initWithFrame:CGRectMake(0, midSpaceLine, self.linewidth, self.lineheight)];
    _midline.layer.cornerRadius = self.lineheight/2;
    _midline.layer.masksToBounds = YES;
    _midline.backgroundColor = self.lineColor;
    //[midline.layer setAnchorPoint:CGPointMake(0.5,0.5)];
    //[midline.layer setPosition:CGPointMake(10, 25)];
    
    _downline = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height - self.lineSpace, self.linewidth, self.lineheight)];
    _downline.backgroundColor = self.lineColor;
    _downline.layer.cornerRadius = self.lineheight/2;
    _downline.layer.masksToBounds = YES;
    [_downline.layer setAnchorPoint:CGPointMake(0,0.5)];
    [_downline.layer setPosition:CGPointMake(0, self.frame.size.height-self.lineSpace)];
    
    [self.layer addSublayer:_upline.layer];
    [self.layer addSublayer:_midline.layer];
    [self.layer addSublayer:_downline.layer];
}

#pragma Close animation action....
- (void)endAnimation{
    
    CASpringAnimation *springAni = [CASpringAnimation animationWithKeyPath:@"transform.rotation.z"];
    springAni.damping = 9;
    springAni.stiffness = 70;
    springAni.fillMode = kCAFillModeForwards;
    springAni.repeatCount = 1;
    springAni.removedOnCompletion = NO;
    springAni.duration = 2.f;
    springAni.fromValue = [NSNumber numberWithFloat: M_PI * 0.25 ];
    springAni.toValue = [NSNumber numberWithFloat:0];
    [_upline.layer addAnimation:springAni forKey:@"springAnimation"];
    
    //    CASpringAnimation *moveUS = [CASpringAnimation animationWithKeyPath:@"position"];
    //    moveUS.fromValue = [NSValue valueWithCGPoint:CGPointMake(midline.bounds.origin.x-1, midline.center.y)];
    //    moveUS.toValue = [NSValue valueWithCGPoint:CGPointMake(0, 9)];
    //    moveUS.repeatCount = 1;
    //    moveUS.removedOnCompletion = NO;
    //    moveUS.fillMode = kCAFillModeForwards;
    //    moveUS.damping = 5;
    //    moveUS.stiffness = 100;
    //    moveUS.duration = 0.5;
    //    [midline.layer addAnimation:moveUS forKey:@"moveAnimation"];
    
    CASpringAnimation *sprMidS = [CASpringAnimation animationWithKeyPath:@"bounds.size.width"];
    //sprAU.mass = 0;
    sprMidS.damping = 9;
    sprMidS.stiffness = 80;
    sprMidS.fillMode = kCAFillModeForwards;
    sprMidS.repeatCount = 1;
    sprMidS.removedOnCompletion = NO;
    sprMidS.duration = 2.f;
    sprMidS.fromValue = [NSNumber numberWithInt:1];
    sprMidS.toValue = [NSNumber numberWithInt:self.linewidth];
    [_midline.layer addAnimation:sprMidS forKey:@"springAnimationU"];
    
    
    CASpringAnimation *sprAU = [CASpringAnimation animationWithKeyPath:@"transform.rotation.z"];
    //    sprAU.mass = 0;
    sprAU.damping = 9;
    sprAU.stiffness = 70;
    sprAU.fillMode = kCAFillModeForwards;
    sprAU.repeatCount = 1;
    sprAU.removedOnCompletion = NO;
    sprAU.duration = 2.f;
    sprAU.toValue = [NSNumber numberWithFloat: 0];
    sprAU.fromValue = [NSNumber numberWithFloat: -M_PI * 0.25];
    [_downline.layer addAnimation:sprAU forKey:@"springAnimationU"];
    
}

#pragma mark start animation action...
- (void)beginAnimation{
    
    CASpringAnimation *springAni = [CASpringAnimation animationWithKeyPath:@"transform.rotation.z"];
    springAni.damping = 9;
    springAni.stiffness = 70;
    springAni.fillMode = kCAFillModeForwards;
    springAni.repeatCount = 1;
    springAni.removedOnCompletion = NO;
    springAni.duration = 2.f;
    springAni.toValue = [NSNumber numberWithFloat: M_PI * 0.25 ];
    [_upline.layer addAnimation:springAni forKey:@"springAnimation"];
    
    //    CASpringAnimation *moveUS = [CASpringAnimation animationWithKeyPath:@"position"];
    //    moveUS.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, midline.center.y)];
    //    moveUS.toValue = [NSValue valueWithCGPoint:CGPointMake(1, 9)];
    //    moveUS.repeatCount = 1;
    //    moveUS.removedOnCompletion = NO;
    //    moveUS.fillMode = kCAFillModeForwards;
    //    moveUS.damping = 5;
    //    moveUS.stiffness = 100;
    //    moveUS.duration = 0.5;
    //    [midline.layer addAnimation:moveUS forKey:@"moveAnimation"];
    
    CASpringAnimation *sprAU = [CASpringAnimation animationWithKeyPath:@"transform.rotation.z"];
    //    sprAU.mass = 0;
    sprAU.damping = 9;
    sprAU.stiffness = 70;
    sprAU.fillMode = kCAFillModeForwards;
    sprAU.repeatCount = 1;
    sprAU.removedOnCompletion = NO;
    sprAU.duration = 2.f;
    sprAU.toValue = [NSNumber numberWithFloat: -M_PI * 0.25 ];
    [_downline.layer addAnimation:sprAU forKey:@"springAnimationU"];
    
    
    CABasicAnimation *aniMid = [CABasicAnimation animationWithKeyPath:@"bounds.size.width"];
//    aniMid.fromValue = [NSNumber numberWithInt:40];
    aniMid.toValue = [NSNumber numberWithInt:0];
    aniMid.duration = 0.2;
    //aniMid.cumulative = YES;
    aniMid.repeatCount = 1;
    aniMid.removedOnCompletion = NO;
    aniMid.fillMode = kCAFillModeForwards;
    aniMid.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [_midline.layer addAnimation:aniMid forKey:@"scaleAnimation"];
    
}


@end
