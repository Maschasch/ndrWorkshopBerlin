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
	
	bombLocation.latitude = 50.121603;
	bombLocation.longitude = 8.649582;
	
	bomb = [[CMBombAnnotation alloc] init];
	bomb.coordinate = bombLocation;
	
	[mapView addAnnotation:bomb];
	bomb = nil;
	
	bombLocation.latitude = 50.12362;
	bombLocation.longitude = 8.649582;
	
	bomb = [[CMBombAnnotation alloc] init];
	bomb.coordinate = bombLocation;
	
	[mapView addAnnotation:bomb];
	bomb = nil;
	
	bombLocation.latitude = 50.12162;
	bombLocation.longitude = 8.659582;
	
	bomb = [[CMBombAnnotation alloc] init];
	bomb.coordinate = bombLocation;
	
	[mapView addAnnotation:bomb];
	bomb = nil;
	
	
	[mapView setDelegate:self];
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
    [super dealloc];
}

#pragma mark -
#pragma mark MKMapViewDelegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation{
	
	CMBombAnnotationView *bombView = [[CMBombAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"bomb"];
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


@end
