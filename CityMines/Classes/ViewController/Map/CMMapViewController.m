//
//  CMMapViewController.m
//  CityMines
//
//  Created by Marco Köppel on 14.12.10.
//  Copyright 2010 Neue Digitale / Razorfish GmbH. All rights reserved.
//

#import "CMMapViewController.h"

#import "CMBombAnnotation.h"
#import "CMBombAnnotationView.h"

@interface CMMapViewController ()

- (void)updateUserLocation:(NSNotification *)notification;

@end


@implementation CMMapViewController
@synthesize mapView;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateUserLocation:) name:@"CMModelCurrentUserLocationDidChange" object:nil];

	[[CMModel sharedModel] captureCurrentUserLocation];
	
	CLLocationCoordinate2D bombLocation;
	CMBombAnnotation *bomb = nil;
	
	for (NSDictionary *mineDict in [[CMModel sharedModel] mines]) {
		bombLocation.latitude = [[mineDict objectForKey:@"lat"] floatValue];
		bombLocation.longitude = [[mineDict objectForKey:@"long"] floatValue];
		
		bomb = [[CMBombAnnotation alloc] init];
		bomb.coordinate = bombLocation;
		
		[mapView addAnnotation:bomb];
		[[[CMMineCollisionObserver sharedObserver] mines] addObject:bomb];
		
		[bomb release];
		bomb = nil;
	}
	
	
	[mapView setDelegate:self];
	
	[[CMMineCollisionObserver sharedObserver] registerListener:self];
	[[CMMineCollisionObserver sharedObserver] start];

	
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[mapView release];
	[deadLabelContainer release];
    [super dealloc];
}

#pragma mark -
#pragma mark MKMapViewDelegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation{
	
	CMBombAnnotationView *bombView = [[CMBombAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"bomb"];
	//if ([(CMBombAnnotation *)annotation detonated]) bombView.image = [UIImage imageNamed:@"explosion.png"];
	return [bombView autorelease];
	
}

#pragma mark -
#pragma mark NotificationHandling

- (void)updateUserLocation:(NSNotification *)notification{
	MKCoordinateRegion region;
	region.center = [[CMModel sharedModel] currentUserLocation].coordinate;
	
	MKCoordinateSpan span;
	span.latitudeDelta = 0.01;
	span.longitudeDelta = 0.01;
	
	region.span = span;
	
	[mapView setRegion:region animated:YES];
	[mapView regionThatFits:region];
	
	
}

#pragma mark -
#pragma mark CMMineCollisionListener

- (void)collisionDetected: (CMBombAnnotation *)mine{
	
	CMBombAnnotationView *mineAnnotationView = (CMBombAnnotationView *)[mapView viewForAnnotation:mine];
	mineAnnotationView.image = [UIImage imageNamed:@"explosion.png"];
	
	[deadLabelContainer release];
	deadLabelContainer = nil;
	deadLabelContainer = [[UIView alloc] initWithFrame:CGRectMake(130.0, 200.0, 190.0, 160.0)];
	[self.view addSubview:deadLabelContainer];
	
	[self performSelector:@selector(showEnd) withObject:nil afterDelay:3.5];
	
}

- (void)showEnd{

	UILabel *deadLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 190.0, 160.0)];
	deadLabel.numberOfLines = 0;
	deadLabel.text = NSLocalizedString(@"DEAD", @"DEAD");
	deadLabel.backgroundColor = [UIColor colorWithRed:145.0/255.0 green:13.0/255.0 blue:14.0/255.0 alpha:0.6];
	deadLabel.textColor = [UIColor whiteColor];
	deadLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:35];
	
	[UIView transitionWithView:deadLabelContainer duration:2.0 options:UIViewAnimationOptionTransitionCurlDown animations:^{
		[deadLabelContainer addSubview:deadLabel];		
	} completion:nil];
}


@end
