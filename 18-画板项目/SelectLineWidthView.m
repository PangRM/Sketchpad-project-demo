//
//  SelectLineWidthView.m
//  18-画板项目
//
//  Created by pangrenmeng on 16/5/11.
//  Copyright © 2016年 pangrenmeng. All rights reserved.
//

#import "SelectLineWidthView.h"

@interface SelectLineWidthView ()
{
    selectLineWidthBlock _lineWindth;

}
@end

@implementation SelectLineWidthView

-(void)afterSelectWindthBlock:(selectLineWidthBlock)lineWindth{

    _lineWindth = lineWindth;

}


-(void)selectChangeItem:(UIButton *)sender{

    float lineWidth = [self.contentArray[sender.tag-100] floatValue];
    _lineWindth(lineWidth);

}



@end
