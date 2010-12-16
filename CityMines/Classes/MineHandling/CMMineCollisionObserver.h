//
//  CMMineCollisionObserver.h
//  CityMines
//
//  Created by Marco Köppel on 15.12.10.
//  Copyright 2010 Neue Digitale / Razorfish GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CMModel.h"
#import "CMMineCollisionListener.h"

@interface CMMineCollisionObserver : NSObject {

	NSMutableArray *mines;
	NSMutableArray *collisionListener;
	
	NSTimer *detectionTimer;
	
}

@property (nonatomic, retain) NSMutableArray *mines;

+ (CMMineCollisionObserver *)sharedObserver;

- (void)registerListener: (id<CMMineCollisionListener>)listener;
- (void)unregisterListener: (id<CMMineCollisionListener>)listener;

- (void)start;
- (void)end;




@end