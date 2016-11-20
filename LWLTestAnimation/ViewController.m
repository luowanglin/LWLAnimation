//
//  ViewController.m
//  LWLTestAnimation
//
//  Created by luowanglin on 16/11/18.
//  Copyright © 2016年 luowanglin. All rights reserved.
//

#import "ViewController.h"
#import "LWLMenuAnimation.h"

static BOOL kIsOk = YES;

@interface ViewController ()

@end

@implementation ViewController
{
    LWLMenuAnimation *_aniV;
}


-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *testB = [UIButton buttonWithType:(UIButtonTypeCustom)];
    testB.frame = CGRectMake(0, 0, 170, 170);
    testB.backgroundColor = [UIColor grayColor];
    testB.center = self.view.center;
    [self.view addSubview:testB];
    [testB addTarget:self action:@selector(btnAction) forControlEvents:(UIControlEventTouchUpInside)];
    
    _aniV = [LWLMenuAnimation.alloc initWithFrame:CGRectMake(0, 0, 200, 200)];
    _aniV.backgroundColor = [UIColor clearColor];
    _aniV.linewidth = 170.f;
    _aniV.lineheight = 20.f;
    _aniV.lineColor = [UIColor cyanColor];
    _aniV.lineSpace = 40;
    [_aniV layoutAnimatio];
    [testB.layer addSublayer:_aniV.layer];
    
    
}


- (void)btnAction{
    if (kIsOk) {
        kIsOk = !kIsOk;
        [_aniV beginAnimation];
    }else{
        kIsOk = !kIsOk;
        [_aniV endAnimation];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
