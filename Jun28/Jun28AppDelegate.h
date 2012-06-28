//
//  Jun28AppDelegate.h
//  Jun28
//
//  Created by Matthew Fong on 6/28/12.
//  Copyright (c) 2012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVAudioPlayer.h>  //needed for AVAudioPlayer
#import "View.h"

@interface Jun28AppDelegate : UIResponder <UIApplicationDelegate> {
    View *view;
    UIWindow *_window;
    AVAudioPlayer *player;
}

@property (strong, nonatomic) UIWindow *window;

@end

