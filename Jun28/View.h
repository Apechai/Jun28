//
//  View.h
//  Jun28
//
//  Created by Matthew Fong on 6/28/12.
//  Copyright (c) 2012. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Asteroid;
@class Ship;

@interface View : UIView {
    Asteroid *asteroid;
    Ship *ship;
    BOOL asteroidcolor;
}

-(void)animateAsteroid;

@end
