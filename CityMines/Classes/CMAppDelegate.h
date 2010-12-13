//
//  CityMinesAppDelegate.h
//  CityMines
//
//  Created by Marius Bulla on 13.12.10.
//  Copyright 2010 Neue Digitale / Razorfish. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CMViewController;

@interface CMAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    CMViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet CMViewController *viewController;

@end

