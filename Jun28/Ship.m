//
//  Ship.m
//  Jun28
//
//  Created by Matthew Fong on 6/28/12.
//  Copyright (c) 2012. All rights reserved.
//

#import "Ship.h"

@implementation Ship

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
		self.backgroundColor = [UIColor blackColor];
        
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextBeginPath(ctx);
    CGContextMoveToPoint   (ctx, CGRectGetMinX(rect), CGRectGetMaxY(rect));  // bottom left
    CGContextAddLineToPoint(ctx, CGRectGetMidX(rect), CGRectGetMinY(rect));  // mid top
    CGContextAddLineToPoint(ctx, CGRectGetMaxX(rect), CGRectGetMaxY(rect));  // bottom right
    CGContextClosePath(ctx);
    
    CGContextSetRGBFillColor(ctx, 0, 0, 1, 1);
    CGContextFillPath(ctx);
}


@end


