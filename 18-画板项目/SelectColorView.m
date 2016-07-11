//
//  SelectColorView.m
//  18-画板项目
//
//  Created by pangrenmeng on 16/5/11.
//  Copyright © 2016年 pangrenmeng. All rights reserved.
//

#import "SelectColorView.h"

@interface SelectColorView ()

{
    selectColorBlock _selectColorBlock;
}

@end

@implementation SelectColorView

-(void)afterSelected:(selectColorBlock)selectColorBlock{

    _selectColorBlock = selectColorBlock;

}


-(void)selectChangeItem:(UIButton *)sender{

    _selectColorBlock(self.contentArray[sender.tag-100]);

}







@end
