//
//  LineView.m
//  Quartz 2D-lineView
//
//  Created by qingyun on 15/10/29.
//  Copyright (c) 2015年 HNqingyun. All rights reserved.
//

#import "LineView.h"

@implementation LineView


//当自定义view第一次显示出来的时候就会调用drawRect方法
- (void)drawRect:(CGRect)rect {
    
    // 1.取得和当前视图相关联的图形上下文(因为图形上下文决定绘制的输出目标)/
    // 如果是在drawRect方法中调用UIGraphicsGetCurrentContext方法获取出来的就是Layer的上下文
    CGContextRef context = UIGraphicsGetCurrentContext();//不需要*,同id,基于C语言
    
    // 2.绘图(绘制直线), 保存绘图信息
    // 设置起点
    CGContextMoveToPoint(context, 20, 100);
    //设置终点
    CGContextAddLineToPoint(context, 355, 100);
    
    //设置绘图的状态
    //设置线条的颜色为蓝色
    CGContextSetRGBStrokeColor(context, 1.0, 0, 0, 1.0);
    //设置线条的宽度
    CGContextSetLineWidth(context, 3);
    
    //设置线条起点和终点的样式为圆角
    CGContextSetLineCap(context, kCGLineCapRound);
    //设置线条的转角的样式为圆角
    CGContextSetLineJoin(context, kCGLineJoinBevel);
     //3.渲染（绘制出一条空心的线）
    CGContextStrokePath(context);
    
#pragma  mark 第二条线
    CGContextMoveToPoint(context, 20, 80);
    CGContextAddLineToPoint(context, 20, 480);
    
    CGContextSetLineWidth(context, 3);
    [[UIColor blueColor] set];
    CGContextSetLineCap(context, kCGLineCapButt);
    
    //渲染第二条线的图形到view上
    CGContextStrokePath(context);
    
    
#pragma mark 三角形
    
    //设置起点
    CGContextMoveToPoint(context, 200, 100);
    //设置第二个点
    CGContextAddLineToPoint(context, 80, 240);
    //设置第三个点
    CGContextAddLineToPoint(context, 320, 240);
    //关闭起点和终点
    CGContextClosePath(context);
    // 3.渲染图形到layer上
    CGContextStrokePath(context);
    
    
#pragma mark 矩形
    //矩形
    CGContextAddRect(context, CGRectMake(90, 240, 220, 220));
    [UIColor colorWithRed:0.5 green:0 blue:.7 alpha:1.0];
    
    //[[UIColor greenColor]setFill];
    //3.渲染图形到layer上
    //空心的
    CGContextStrokePath(context);
    //实心的
    //CGContextFillPath(context);
    
#pragma mark 圆形
    CGContextAddArc(context, 250, 350, 50, 0, 2 * M_PI, 0);
     // 3.渲染 (注意, 画线只能通过空心来画)
    CGContextStrokePath(context);
    
    //另一个圆
    //正方形
    CGContextAddEllipseInRect(context, CGRectMake(220, 320, 60, 60));
    [[UIColor whiteColor]set];
    CGContextFillPath(context);
    
    
#pragma mark 椭圆
    CGContextAddEllipseInRect(context, CGRectMake(100, 500, 250, 100));
    
    [[UIColor purpleColor]set];
    CGContextSetLineWidth(context, 10);
    [[UIColor yellowColor]setStroke];
    
    //渲染 (即描边又填充)
    CGContextDrawPath(context, kCGPathFillStroke);
    
    //CGContextFillPath(context);
    
#pragma mark 画圆弧
    // x/y 圆心
    // radius 半径
    // startAngle 开始的弧度
    // endAngle 结束的弧度
    // clockwise 画圆弧的方向 (0 顺时针, 1 逆时针)
    CGContextAddArc(context, 50, 450, 50, M_PI/2, -M_PI_4, 1);
    [[UIColor whiteColor]setFill];
    CGContextClosePath(context);
    
    CGContextFillPath(context);
    
#pragma mark 扇形
    
    //CGContextAddArc(context, 260, 260, 100, 0, 45 * (M_PI/180), 0);
    //画圆弧
    CGContextAddArc(context, 160, 200, 50, 0, -90*(M_PI/180), 1);
    //画三角
    CGContextMoveToPoint(context, 160, 200);
    CGContextAddLineToPoint(context, 160, 150);
    CGContextAddLineToPoint(context, 210, 200);
    //闭合三角路径
    CGContextClosePath(context);
    
    [[UIColor yellowColor]setFill];
    //渲染
    CGContextFillPath(context);
    
    
    //扇形
    //起始点
    CGContextMoveToPoint(context, 300, 180);
    //路径
    CGContextAddArc(context, 300, 180, 100,  -60 * M_PI / 180, -120 * M_PI / 180, 1);
    [[UIColor blackColor]setFill];
    //闭合
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathEOFill);
    
    
    
#pragma mark 圆角矩形  ?????????
    float fw = 180;
    float fh = 280;
    CGContextMoveToPoint(context, fw, fh-20);  // 开始坐标右边开始
    CGContextAddArcToPoint(context, fw, fh, fw-20, fh, 10);  // 右下角角度
    CGContextAddArcToPoint(context, 120, fh, 120, fh-20, 10); // 左下角角度
    CGContextAddArcToPoint(context, 120, 250, fw-20, 250, 10); // 左上角
    CGContextAddArcToPoint(context, fw, 250, fw, fh-20, 10); // 右上角
    CGContextClosePath(context);
    [[UIColor colorWithRed:.4 green:.5 blue:.9 alpha:.6]setFill];
    CGContextDrawPath(context, kCGPathFill); //根据坐标绘制路径
    
    
    // Drawing code
}


@end
