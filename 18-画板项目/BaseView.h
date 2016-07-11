//
//  BaseView.h
//  简易画板
//
//  Created by GG on 16/5/10.
//  Copyright © 2016年 GG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseView : UIView

@property (nonatomic,copy) NSArray *contentArray;

- (instancetype)initWithFrame:(CGRect)frame WithArray:(NSArray *)contentArray;

- (void)selectChangeItem:(UIButton *)sender;

@end
