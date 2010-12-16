//
//  CMMineCollisionObserver.m
//  CityMines
//
//  Created by Marco Köppel on 15.12.10.
//  Copyright 2010 Neue Digitale / Razorfish GmbH. All rights reserved.
//

#import "CMMineCollisionObserver.h"

@interface CMMineCollisionObserver ()

- (void)detectCollision: (NSTimer *)timer;

@end


@implementation CMMineCollisionObserver
@synthesize mines;

#pragma mark -
#pragma mark Singleton

static CMMineCollisionObserver *sharedInstance = nil;

+ (CMMineCollisionObserver *)sharedObserver{
	if (!sharedInstance){
		sharedInstance = [[[self class] alloc] init];
	}
	return sharedInstance;
}

- (id)init{
	if (self = [super init]){
		
		self.mines = [NSMutableArray array];
		collisionListener = [[NSMutableArray alloc] init];
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
    
	[collisionListener release];
	[mines release];
	
	[detectionTimer release];
    [super dealloc];
}

#pragma mark -
#pragma mark Public Methods

- (void)registerListener: (id<CMMineCollisionListener>)listener{
	
	if (![collisionListener containsObject:listener]){
		[collisionListener addObject:listener];
	}
}

- (void)unregisterListener: (id<CMMineCollisionListener>)listener{
	
	if ([collisionListener containsObject:listener]){
		[collisionListener removeObject:listener];
	}
}

- (void)start{
	
	[detectionTimer invalidate];
	detectionTimer = [[NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(detectCollision:) userInfo:nil repeats:YES] retain];
}

- (void)end{
	[detectionTimer invalidate];
}

#pragma mark -
#pragma mark Private

- (void)detectCollision: (NSTimer *)timer{
	
	for (CMBombAnnotation *mine in mines) {
		CLLocation *mineLocation = [[CLLocation alloc] initWithCoordinate:mine.coordinate altitude:1.0 horizontalAccuracy:1.0 verticalAccuracy:1.0 timestamp:nil];
		CLLocationDistance distance = [[[CMModel sharedModel] currentUserLocation] distanceFromLocation:mineLocation];
		NSLog(@"Distance: %f", distance);
		
		if (distance < 60 && !mine.detonated){
			for (id<CMMineCollisionListener> listener in collisionListener) {
				[listener collisionDetected:mine];
				
			}
			
			mine.detonated = YES;
		}
		
	}
	
}

@end