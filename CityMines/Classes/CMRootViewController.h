//
//  CityMinesViewController.h
//  CityMines
//
//  Created by Marius Bulla on 13.12.10.
//  Copyright 2010 Neue Digitale / Razorfish. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMMapViewController.h"

@interface CMRootViewController : UIViewController {

	CMMapViewController *mapViewController;
}

@property (nonatomic, retain) CMMapViewController *mapViewController;

+ (id)viewController;

@end

