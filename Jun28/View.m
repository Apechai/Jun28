//
//  View.m
//  Jun28
//
//  Created by Matthew Fong on 6/28/12.
//  Copyright (c) 2012. All rights reserved.
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
        CGRect s = CGRectMake(self.bounds.size.width/2, self.bounds.size.height/2, 30, 30);
        asteroid = [[Asteroid alloc] initWithFrame: f];
        [self addSubview: asteroid];
        ship = [[Ship alloc] initWithFrame:s];
        [self addSubview: ship];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // generate random starting point
    asteroid.center = CGPointMake(
                                  arc4random() % (unsigned int)self.bounds.size.width, 
                                  arc4random() % (unsigned int)self.bounds.size.height);
    
    [self animateAsteroid];
}

//move asteroid randomly across screen and rotating
- (void)animateAsteroid {
    
    [UIView animateWithDuration: 3
                          delay: 0
                        options: 	UIViewAnimationOptionCurveEaseInOut
                     animations: ^{
                         [UIView setAnimationRepeatCount: 1];
                         asteroid.center = CGPointMake(
                                                       arc4random() % (unsigned int)self.bounds.size.width, 
                                                       arc4random() % (unsigned int)self.bounds.size.height);;
                         
                         asteroid.transform = CGAffineTransformRotate(asteroid.transform, arc4random());;
                         
                     }
                     completion: ^(BOOL finished){
                         [self animateAsteroid];
                     }
     ];
}

// move ship according to touch

- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
	if (touches.count > 0) {
        CGPoint destination = [[touches anyObject] locationInView: self];
        CGFloat delta_x = destination.x - ship.center.x;
        CGFloat delta_y = destination.y - ship.center.y;
        
        CGFloat directiontouched = atan2(delta_x, -delta_y);
		[UIView animateWithDuration: 2.0
                              delay: 0.1
                            options: 	UIViewAnimationOptionCurveEaseInOut
         | UIViewAnimationOptionAllowUserInteraction
         | UIViewAnimationOptionBeginFromCurrentState
                         animations: ^{
                             //This block describes what the animation should do.
                             [UIView setAnimationRepeatCount: 1];
                             ship.center = [[touches anyObject] locationInView: self];
                             ship.transform = CGAffineTransformMakeRotation(directiontouched);
                         }
                         completion: NULL
         ];
	}
}




@end
