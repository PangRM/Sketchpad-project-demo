//
//  PathModel.h
//  18-画板项目
//
//  Created by pangrenmeng on 16/5/11.
//  Copyright © 2016年 pangrenmeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PathModel : NSObject

@property (nonatomic,strong) UIBezierPath *bezierPath;

@property (nonatomic,strong) UIColor *color;

@property (nonatomic,assign) CGFloat lineWidth;

@end
