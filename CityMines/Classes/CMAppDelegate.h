//
//  CityMinesAppDelegate.h
//  CityMines
//
//  Created by Marius Bulla on 13.12.10.
//  Copyright 2010 Neue Digitale / Razorfish. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CityMinesViewController;

@interface CityMinesAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    CityMinesViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet CityMinesViewController *viewController;

@end

