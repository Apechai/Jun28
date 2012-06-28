//
//  View.m
//  Jun28
//
//  Created by Matthew Fong on 6/28/12.
//  Copyright (c) 2012 Goldman Sachs. All rights reserved.
//
#import "View.h"
#import "Asteroid.h"
#import "Ship.h"
#include <stdlib.h>

@implementation View

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor blackColor];
        
        CGRect f = CGRectMake(0, 0, 60, 60);
        asteroid = [[Asteroid alloc] initWithFrame: f];
        
        CGRect s = CGRectMake(160,230, 20, 20);
        ship = [[Ship alloc] initWithFrame: s];
        [self addSubview: asteroid];
        [self addSubview: ship];
        
    }
    return self;
}

- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
    if (touches.count > 0) {
        
		[UIView animateWithDuration: 1.0
                              delay: 0.0
                            options: UIViewAnimationOptionCurveEaseInOut
                         animations: ^{
                             //This block describes what the animation should do.
                             ship.center = [[touches anyObject] locationInView: self];
                             ship.transform = CGAffineTransformMakeRotation(90 * M_PI / 100);
                         }
                         completion: NULL
         ];
}
}




// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // generate random starting point
    asteroid.center = CGPointMake(
                                  arc4random() % (unsigned int)self.bounds.size.width, 
                                  arc4random() % (unsigned int)self.bounds.size.height);
    
    
    CGPoint destination = CGPointMake(
                                      arc4random() % (unsigned int)self.bounds.size.width, 
                                      arc4random() % (unsigned int)self.bounds.size.height);
    
    // animate to random destination
    [UIView animateWithDuration: 20
                          delay: 0
                        options: 	UIViewAnimationOptionCurveEaseInOut
                     animations: ^{
                         //Animate this indefinitely
                         [UIView setAnimationRepeatCount: 0];
                         asteroid.center = destination;
                         
                         asteroid.transform = CGAffineTransformMakeRotation(90 * M_PI / 180);
                         
                     }
                     completion: ^(BOOL finished){
                     }
     ];
    
}


@end
