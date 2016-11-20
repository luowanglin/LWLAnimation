//
//  LWLMenuAnimation.h
//  LampApp
//
//  Created by luowanglin on 16/11/18.
//  Copyright © 2016年 luowanglin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LWLMenuAnimation : UIView

/*
 *@param 线条间距
 */
@property(nonatomic, assign)CGFloat lineSpace;

/*
 *@param 线条高度
 */
@property(nonatomic, assign)CGFloat lineheight;

/*
 *@param  默认为self视图的宽度
 */
@property(nonatomic, assign)CGFloat linewidth;

/*
 *@param 线条颜色
 */
@property(nonatomic, strong)UIColor *lineColor;

/*
 *开始动画
 */
- (void)endAnimation;

/*
 *结束动画
 */
- (void)beginAnimation;

/*
 *部署动画（该方法需属性自定义完毕后，方可调用，否则为默认样式）
 */
- (void)layoutAnimatio;

@end
