//
//  View.h
//  Jun28
//
//  Created by Matthew Fong on 6/28/12.
//  Copyright (c) 2012 Goldman Sachs. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Asteroid;
@class Ship;

@interface View : UIView {
    Asteroid *asteroid;
    Ship *ship;
}

@end
