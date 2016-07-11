//
//  DrawView.m
//  18-画板项目
//
//  Created by pangrenmeng on 16/5/11.
//  Copyright © 2016年 pangrenmeng. All rights reserved.
//

#import "DrawView.h"
#import "PathModel.h"

@interface DrawView()

//当前正在绘制的路径
@property(nonatomic,assign)CGMutablePathRef path;
//已经绘制的路径
@property(nonatomic,retain)NSMutableArray *pathArray;
//判断当前路劲是否被释放
@property(nonatomic,assign)BOOL isReleasePath;

@end


@implementation DrawView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.color = [UIColor blackColor];
        self.lineWidth = 10;
    }
    return self;
}


-(void)drawRect:(CGRect)rect{
//1.获取与上文对象
    CGContextRef context = UIGraphicsGetCurrentContext();

    [self drawView:context];

}

-(void)drawView:(CGContextRef )context{
    
    for (PathModel *model in self.pathArray) {
        CGContextAddPath(context, model.bezierPath.CGPath);
        [model.color setStroke];
        CGContextSetLineWidth(context, model.lineWidth);
        CGContextDrawPath(context, kCGPathStroke);
    }
    
////2.创建路径
    
//    CGMutablePathRef path = CGPathCreateMutable();
////2.1.设置路径顶点
//    CGPathMoveToPoint(path, NULL, 50, 50);
////2.2 追加路径
//    CGPathAddLineToPoint(path, NULL, 50, 200);

    if (self.isReleasePath == NO) {
//3.把路径添加到上下文
        CGContextAddPath(context, self.path);
//4.给上下文设置状态
       [self.color setStroke];
        CGContextSetLineCap(context, kCGLineCapRound);
        CGContextSetLineJoin(context, kCGLineJoinRound);
        CGContextSetLineWidth(context, self.lineWidth);
//5.绘制路径
       CGContextDrawPath(context, kCGPathStroke);
////6.释放路径
//    CGPathRelease(self.path);
    }
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    CGPoint point = [[touches anyObject]locationInView:self];
    //2.创建路径
    self.path = CGPathCreateMutable();
    //2.1.设置路径顶点
    CGPathMoveToPoint(self.path, NULL, point.x , point.y);
    
    self.isReleasePath = NO;

}


-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    CGPoint point = [[touches anyObject]locationInView:self];
    //2.2 追加路径
    CGPathAddLineToPoint(self.path, NULL, point.x, point.y);
    //不能直接调用DrawRect方法，使用它来触发DrawRect方法执行
    [self setNeedsDisplay];

}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    
    //保存路径
    if (self.pathArray == nil) {
        self.pathArray = [[NSMutableArray alloc]init];
    }
    
    //使用贝塞尔曲线，将CGPath包装成对象
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithCGPath:self.path];
    
    PathModel *model = [[PathModel alloc]init];
    
    model.bezierPath = bezierPath;
    model.color = self.color;
    model.lineWidth = self.lineWidth;
    
    [self.pathArray addObject:model];
    
    //6.释放路径
        CGPathRelease(self.path);

    self.isReleasePath = YES;
}
/////////////////////////////////////////////////////////////////////
-(void)undo{

    [self.pathArray removeLastObject];
    [self setNeedsDisplay];
    
}

-(void)clear{
    
    [self.pathArray removeAllObjects];
    [self setNeedsDisplay];

}

-(void)save{
    
    UIGraphicsBeginImageContext(CGSizeMake(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))); //currentView 当前的view
    
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    UIImageWriteToSavedPhotosAlbum(viewImage, nil, nil, nil);


}



@end
