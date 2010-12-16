//
//  CMModel.m
//  CityMines
//
//  Created by Marco Köppel on 14.12.10.
//  Copyright 2010 Neue Digitale / Razorfish GmbH. All rights reserved.
//

#import "CMModel.h"

@implementation CMModel

@synthesize currentUserLocation;

#pragma mark -
#pragma mark Singleton

static CMModel *sharedInstance = nil;

+ (CMModel *)sharedModel{
	
	if (!sharedInstance){
		sharedInstance = [[[self class] alloc] init];
	}
	return sharedInstance;
}

- (id)init{
	if (self = [super init]){
		locationManager = [[CLLocationManager alloc] init];
		locationManager.delegate = self;
		
	}
	
	return self;
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

- (id)retain
{
    return self;
}

- (NSUInteger)retainCount
{
    return NSUIntegerMax;  //denotes an object that cannot be released
}

- (void)release
{
    //do nothing
}

- (id)autorelease
{
    return self;
}

- (void)dealloc {
    
	[locationManager release];
    [super dealloc];
}

#pragma mark -
#pragma mark Setter

- (void)setCurrentUserLocation:(CLLocation *)value{
	if ([self.currentUserLocation isEqual:value])return;
	
	[currentUserLocation release];
	currentUserLocation = nil;
	currentUserLocation = [value retain];
	
	[[NSNotificationCenter defaultCenter] postNotificationName:@"CMModelCurrentUserLocationDidChange" object:nil];
}

#pragma mark -
#pragma mark Location 

- (void)captureCurrentUserLocation{
	[locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
	[locationManager startUpdatingLocation];
}

#pragma mark -
#pragma mark CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
	self.currentUserLocation = newLocation;
	//[locationManager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
	
}

@end
