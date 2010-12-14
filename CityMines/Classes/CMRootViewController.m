//
//  CityMinesViewController.m
//  CityMines
//
//  Created by Marius Bulla on 13.12.10.
//  Copyright 2010 Neue Digitale / Razorfish. All rights reserved.
//

#import "CMRootViewController.h"

@interface CMRootViewController ()

- (void)initialize;

@end


@implementation CMRootViewController

@synthesize mapViewController;

+ (id)viewController
{
	return [[[CMRootViewController alloc] initWithNibName:@"CityMinesViewController" bundle:nil] autorelease];
}


// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		[self initialize];
    }
    return self;
}


- (void)initialize{
	
	CMMapViewController *aMapViewController = [[CMMapViewController alloc] initWithNibName:@"CMMapViewController" bundle:nil];
	self.mapViewController = aMapViewController;
	
	[aMapViewController release];
	
}

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	[self.view addSubview:mapViewController.view];
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[mapViewController release];
    [super dealloc];
}

@end