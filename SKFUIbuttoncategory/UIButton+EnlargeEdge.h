//
//  UIButton+EnlargeEdge.h
//  UIButton+EnlargeEdge
//
//  Created by 孙凯峰 on 16/8/28.
//  Copyright © 2016年 孙凯峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (EnlargeEdge)
- (void)setEnlargeEdge:(CGFloat) size;
- (void)setEnlargeEdgeWithTop:(CGFloat) top right:(CGFloat) right bottom:(CGFloat) bottom left:(CGFloat) left;
@end
