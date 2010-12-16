//
//  CMBombAnnotation.h
//  CityMines
//
//  Created by Marco Köppel on 14.12.10.
//  Copyright 2010 Neue Digitale / Razorfish GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface CMBombAnnotation : NSObject<MKAnnotation> {

	CLLocationCoordinate2D coordinate;
	BOOL detonated;
}

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, assign) BOOL detonated;

- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate;

- (NSString *)subtitle;
- (NSString *)title;


@end