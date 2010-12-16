//
//  CMBombAnnotation.m
//  CityMines
//
//  Created by Marco Köppel on 14.12.10.
//  Copyright 2010 Neue Digitale / Razorfish GmbH. All rights reserved.
//

#import "CMBombAnnotation.h"


@implementation CMBombAnnotation
@synthesize detonated;

@synthesize coordinate;

- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate{
	coordinate = newCoordinate;
}

- (NSString *)subtitle{
	return @""; 
}

- (NSString *)title{
	return @"Landmine";
}

@end