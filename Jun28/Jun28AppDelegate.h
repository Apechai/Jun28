//
//  Jun28AppDelegate.h
//  Jun28
//
//  Created by Matthew Fong on 6/28/12.
//  Copyright (c) 2012 Goldman Sachs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "View.h"

@interface Jun28AppDelegate : UIResponder <UIApplicationDelegate> {
    View *view;
    UIWindow *_window;
}

@property (strong, nonatomic) UIWindow *window;

@end

