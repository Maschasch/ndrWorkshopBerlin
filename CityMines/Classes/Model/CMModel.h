//
//  CMModel.h
//  CityMines
//
//  Created by Marco Köppel on 14.12.10.
//  Copyright 2010 Neue Digitale / Razorfish GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface CMModel : NSObject<CLLocationManagerDelegate> {

	CLLocationManager *locationManager;
	CLLocation *currentUserLocation;
}

@property (nonatomic, retain) CLLocation *currentUserLocation;


+ (CMModel *)sharedModel;

- (void)captureCurrentUserLocation;

@end
