//
//  CityMinesAppDelegate.m
//  CityMines
//
//  Created by Marius Bulla on 13.12.10.
//  Copyright 2010 Neue Digitale / Razorfish. All rights reserved.
//

#import "CMAppDelegate.h"
#import "CMRootViewController.h"

@implementation CMAppDelegate
@synthesize defaultImageView;

@synthesize window;
@synthesize viewController;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
	self.viewController = [CMRootViewController viewController];
	// Add the view controller's view to the window and display.
    //[self.window addSubview:viewController.view];
	[self.window insertSubview:viewController.view atIndex:0];
	
//	UIImageView *defaultImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
//	[defaultImageView setImage:[UIImage imageNamed:@"Default.png"]];
//	[self.window addSubview:defaultImageView];
	
//	[defaultImageView release];
	
	
    [self.window makeKeyAndVisible];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [viewController release];
    [window release];
	[defaultImageView release];
    [super dealloc];
}

#pragma mark -
#pragma mark Handler

-(IBAction)handleButton: (id)sender{
	
	UIButton *senderAsButton = (UIButton *)sender;
	
	[UIView animateWithDuration:0.8 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
		[senderAsButton setTransform:CGAffineTransformMakeRotation(M_PI*1)];
		
	} completion:^(BOOL finished){
		[UIView animateWithDuration:0.45 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
			[defaultImageView setCenter:CGPointMake(defaultImageView.center.x, -480)];
		} completion:^(BOOL finished){
			[defaultImageView removeFromSuperview];
			[[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
		}];
		[senderAsButton removeFromSuperview];
	}];
	
}


@end