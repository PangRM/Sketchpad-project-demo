//
//  ToolView.m
//  18-画板项目
//
//  Created by pangrenmeng on 16/5/11.
//  Copyright © 2016年 pangrenmeng. All rights reserved.
//

#import "ToolView.h"
#import "SelectColorView.h"
#import "SelectLineWidthView.h"

@interface ToolView ()
{
    selectColorBlock _colorBlock;
    selectLineWidthBlock _lineWidth;
    
    ToolActionBlock _araserBlock;
    ToolActionBlock _undoBlock;
    ToolActionBlock _clearBlock;
    ToolActionBlock _saveBlock;
    
    
}
@property (nonatomic,strong) SelectColorView *selectColorView;
@property (nonatomic,strong) SelectLineWidthView *selectLineWidthView;

@end

typedef enum : NSUInteger {
    kColorSelect = 100,
    kLineWidthSelect,
    KEraserSelect,
    kUndoSelect,
    kClearScreenSelect,
    kcameraSelect,
    kSaveSelect
} kSelectItem;

@implementation ToolView

-(void)selectChangeItem:(UIButton *)sender{
    switch (sender.tag) {
        case kColorSelect:{
            [self forceHideView:self.selectColorView];
            [self showHideColorSelectView];
        }break;
        case kLineWidthSelect:{
            [self forceHideView:self.selectLineWidthView];
            [self showHidelineWidthSelectView];
        }break;
        case KEraserSelect:{
            _araserBlock();
        }break;
        case kUndoSelect:{
            _undoBlock();
        }break;
        case kClearScreenSelect:{
            _clearBlock();
        }break;
        case kcameraSelect:{
            
        }break;
        case kSaveSelect:{
            _saveBlock();
        }break;
        default:
            break;
    }




}

//让颜色选择视图显示或隐藏
- (void)showHideColorSelectView{
    
        NSArray *contentArray = @[[UIColor redColor],[UIColor greenColor],[UIColor orangeColor],[UIColor yellowColor],[UIColor blueColor],[UIColor magentaColor],[UIColor cyanColor]];
    
    if (self.selectColorView == nil) {
        
        self.selectColorView = [[SelectColorView alloc]initWithFrame:CGRectMake(0, -50, 414, 50) WithArray:contentArray];
        
        [self.selectColorView afterSelected:^(UIColor *color) {
            _colorBlock(color);
            [self forceHideView:nil];
        }];
        
        self.selectColorView.backgroundColor = [UIColor lightGrayColor];
        
        [self addSubview:self.selectColorView];
    }
    
    [self showHideView:self.selectColorView];
    
}

-(void)showHidelineWidthSelectView{

    NSArray *contextArray = @[@"2",@"5",@"10",@"12",@"14",@"16"];
    
    if (self.selectLineWidthView== nil) {
        
        self.selectLineWidthView = [[SelectLineWidthView alloc]initWithFrame:CGRectMake(0, -50, 414, 50) WithArray:contextArray];
        
        [self.selectLineWidthView afterSelectWindthBlock:^(CGFloat LineWidth) {
            _lineWidth(LineWidth);
            [self forceHideView:nil];
        }];
        
         self.selectLineWidthView.backgroundColor = [UIColor lightGrayColor];
        
        [self addSubview:self.selectLineWidthView];
    }
   
    [self showHideView:self.selectLineWidthView];
    
}

//让视图动画式出现及消失
-(void)showHideView:(UIView *)view{

    //保存要消失或出现视图的frame
    CGRect toFrame = view.frame;
    //保存当前工具栏的frame
    CGRect toolFrame = self.frame;
    
    if (toFrame.origin.y > 0) {
        toFrame.origin.y = -50;
        toolFrame.size.height = 50;
    }else{
        toFrame.origin.y = 50;
        toolFrame.size.height = 100;
    }
    
    [UIView animateWithDuration:0.5 animations:^{
        
        view.frame = toFrame;
        self.frame = toolFrame;
        
    }];
    
}

-(void)forceHideView:(UIView *)view{
    
    UIView *showView = nil;
    if (self.selectColorView.frame.origin.y > 0) {
        showView = self.selectColorView;
    }else if (self.selectLineWidthView.frame.origin.y > 0){
        showView = self.selectLineWidthView;
    }else{
        return;
    };
    if (view == showView) {
        return;
    }
    
    CGRect toFrame = showView.frame;
    CGRect toolFrame = self.frame;
    
    toFrame.origin.y = -50;
    toolFrame.size.height = 50;
    
    [UIView animateWithDuration:0.5 animations:^{
        
        showView.frame = toFrame;
        self.frame = toolFrame;
        
    }];
}

-(void)afterSelectColor:(selectColorBlock)colorBlock WithSelectLineWidth:(selectLineWidthBlock)lineWidth{

    _colorBlock = colorBlock;
    _lineWidth = lineWidth;

}

-(void)clickEraserBlock:(ToolActionBlock)araserBlock WithUndoBlock:(ToolActionBlock)undoBlock WithClearBlock:(ToolActionBlock)clearBlock WithSaveBlock:(ToolActionBlock)saveBlock{

    _araserBlock = araserBlock;
    _undoBlock = undoBlock;
    _clearBlock =clearBlock;
    _saveBlock = saveBlock;


}



@end
