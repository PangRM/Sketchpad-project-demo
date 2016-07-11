//
//  ViewController.m
//  18-画板项目
//
//  Created by pangrenmeng on 16/5/11.
//  Copyright © 2016年 pangrenmeng. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"
#import "ToolView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DrawView *drawView = [[DrawView alloc]initWithFrame:self.view.frame];
    drawView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:drawView];
    
    NSArray *array = @[@"颜色",@"线宽",@"橡皮",@"撤销",@"清屏",@"相机",@"保存"];
    ToolView *toolView = [[ToolView alloc]initWithFrame:CGRectMake(0, 0, 414, 50) WithArray:array];
    
    [toolView afterSelectColor:^(UIColor *color) {
        
        drawView.color = color;
        NSLog(@"%@",color);
        
    } WithSelectLineWidth:^(CGFloat LineWidth) {
        
        drawView.lineWidth = LineWidth;
        NSLog(@"%f",LineWidth);
        
    }];
    
    [toolView clickEraserBlock:^{
        drawView.color = [UIColor whiteColor];
    } WithUndoBlock:^{
        [drawView undo];
    } WithClearBlock:^{
        [drawView clear];
    } WithSaveBlock:^{
        [drawView save];
    }];
    
    toolView.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:toolView];
    
    
    
}



@end
