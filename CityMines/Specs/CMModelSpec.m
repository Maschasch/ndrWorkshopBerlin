//
//  CMModelSpec.m
//  CityMines
//
//  Created by Marco Köppel on 14.12.10.
//  Copyright 2010 Neue Digitale / Razorfish GmbH. All rights reserved.
//


#import <CoreLocation/CoreLocation.h>
#import "CMModel.h"


SPEC_BEGIN(CMModelSpec)

describe(@"CMModel", ^{
	
	beforeEach(^{
		
    });
	
	afterEach(^{
		
	});
	
    it(@"should have at least 1 mine", ^{
		NSArray *mines = [[CMModel sharedModel] mines];
		assertThatInteger([mines count], isNot(equalToInt(0)));
		
	});
	
	it(@"should respond to Location Updates", ^{
		BOOL respond = [[CMModel sharedModel] respondsToSelector:@selector(locationManager:didUpdateToLocation:fromLocation:)];
		assertThatBool(respond, is(equalToBool(YES)));
	});
	
	it(@"should store a User Location when location was updated", ^{
		
		CLLocation *aLocation = [[CLLocation alloc] initWithLatitude:50.32 longitude:8.03];
		[[CMModel sharedModel] locationManager:[[CMModel sharedModel] locationManager] didUpdateToLocation:aLocation fromLocation:nil];
		
		CLLocation *userLocation = [[CMModel sharedModel] currentUserLocation];
		assertThat(userLocation, is(notNilValue()));
		
	});
	
	
});

SPEC_END
