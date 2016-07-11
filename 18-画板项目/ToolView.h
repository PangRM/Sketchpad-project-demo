//
//  ToolView.h
//  18-画板项目
//
//  Created by pangrenmeng on 16/5/11.
//  Copyright © 2016年 pangrenmeng. All rights reserved.
//

#import "BaseView.h"

#import "SelectColorView.h"
#import "SelectLineWidthView.h"

typedef void(^ToolActionBlock)(void);

@interface ToolView : BaseView

-(void)afterSelectColor:(selectColorBlock)colorBlock WithSelectLineWidth:(selectLineWidthBlock)lineWidth;

- (void)clickEraserBlock:(ToolActionBlock)araserBlock WithUndoBlock:(ToolActionBlock)undoBlock WithClearBlock:(ToolActionBlock)clearBlock WithSaveBlock:(ToolActionBlock)saveBlock;

@end
