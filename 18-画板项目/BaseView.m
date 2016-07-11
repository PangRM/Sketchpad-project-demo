//
//  BaseView.m
//  简易画板
//
//  Created by GG on 16/5/10.
//  Copyright © 2016年 GG. All rights reserved.
//

#import "BaseView.h"


#define kMargin 10

@implementation BaseView

- (instancetype)initWithFrame:(CGRect)frame WithArray:(NSArray *)contentArray
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _contentArray = contentArray;
        [self addColorBoard];
        
    }
    return self;
}


- (void)addColorBoard{
    
    CGFloat btnWidth = (CGRectGetWidth(self.frame)-(_contentArray.count+1)*kMargin)/_contentArray.count;
    
    for (int index = 0; index<_contentArray.count; index++) {
        
        UIButton *selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        selectBtn.frame = CGRectMake(kMargin+(btnWidth+kMargin)*index, kMargin, btnWidth, CGRectGetHeight(self.frame)-kMargin*2);
        
        selectBtn.tag = 100+index;
        [selectBtn addTarget:self action:@selector(selectChangeItem:) forControlEvents:UIControlEventTouchUpInside];
        
        if ([_contentArray[0] isKindOfClass:[UIColor class]]) {
            
             selectBtn.backgroundColor = _contentArray[index];
            
        }else{
            
            [selectBtn setTitle:_contentArray[index] forState:UIControlStateNormal];
        }
        
        [selectBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
       
        
        [self addSubview:selectBtn];
    }
}

@end