//
//  DrawView.h
//  18-画板项目
//
//  Created by pangrenmeng on 16/5/11.
//  Copyright © 2016年 pangrenmeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawView : UIView

@property(nonatomic,strong)UIColor *color;
@property(nonatomic,assign)CGFloat lineWidth;

-(void)undo;
-(void)clear;
-(void)save;

@end
