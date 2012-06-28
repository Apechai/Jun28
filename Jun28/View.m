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
        fueltank = 100;
        NSString *string = [NSString stringWithFormat:
                            @"Fuel %d",
                            fueltank];
        UIFont *font = [UIFont systemFontOfSize: 14.0 ];
        CGSize size = [string sizeWithFont: font];
        CGRect z = CGRectMake(
                              self.bounds.origin.x,
                              self.bounds.origin.y,
                              size.width,
                              size.height
                              );
        
		fuel = [[UILabel alloc] initWithFrame: z];
		fuel.backgroundColor = [UIColor clearColor];
        fuel.textColor = [UIColor greenColor];
		fuel.font = font;
		fuel.text = string;
		[self addSubview: fuel];
        
        NSString *targetstring = [NSString stringWithFormat: 
                                  @"Target Coordinates: %g, %g",
                                  self.bounds.size.width/2, 
                                  self.bounds.size.height/2] ;
        UIFont *targetfont = [UIFont systemFontOfSize: 14.0 ];
        CGSize targetsize = [targetstring sizeWithFont: targetfont];
        CGRect n = CGRectMake(
                              self.bounds.origin.x,
                              self.bounds.origin.y + 20,
                              targetsize.width + 20,
                              targetsize.height
                              );
        
		target = [[UILabel alloc] initWithFrame: n];
		target.backgroundColor = [UIColor clearColor];
        target.textColor = [UIColor greenColor];
		target.font = targetfont;
		target.text = targetstring;
		[self addSubview: target];
        
        asteroidcolor = YES;
        
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
    asteroidcolor = !asteroidcolor;
    [UIView animateWithDuration: 3
                          delay: 0
                        options: 	UIViewAnimationOptionCurveEaseInOut
                     animations: ^{
                         [UIView setAnimationRepeatCount: 1];
                         asteroid.center = CGPointMake(
                                                       arc4random() % (unsigned int)self.bounds.size.width, 
                                                       arc4random() % (unsigned int)self.bounds.size.height);;
                         
                         asteroid.transform = CGAffineTransformRotate(asteroid.transform, arc4random());;
                         asteroid.backgroundColor = asteroidcolor ? [UIColor blackColor] : [UIColor redColor];
                         
                     }
                     completion: ^(BOOL finished){
                         [self animateAsteroid];
                     }
     ];
}

// move ship according to touch

- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
	if (touches.count > 0) {
        
        fueltank = fueltank - 1;
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
                             target.text = [NSString stringWithFormat:
                                          @"Target coordinates: (%g, %g)",
                                          destination.x, destination.y];
                             fuel.text = [NSString stringWithFormat:
                                          @"Fuel %d",
                                          fueltank];
                         }
                         completion: NULL
         ];
	}
}




@end
