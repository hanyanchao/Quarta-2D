//
//  ViewController.m
//  Quartz 2D-lineView
//
//  Created by qingyun on 15/10/29.
//  Copyright (c) 2015年 HNqingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//在ViewController.m文件中重写-(void)loadView方法
- (void)loadView{
    
    [super loadView];
    LineView *lineView = [[LineView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    lineView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:lineView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
