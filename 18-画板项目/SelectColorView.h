//
//  SelectColorView.h
//  18-画板项目
//
//  Created by pangrenmeng on 16/5/11.
//  Copyright © 2016年 pangrenmeng. All rights reserved.
//

#import "BaseView.h"

typedef void(^selectColorBlock)(UIColor *color);

@interface SelectColorView : BaseView

-(void)afterSelected:(selectColorBlock)selectColorBlock;

@end
