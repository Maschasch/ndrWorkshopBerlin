//
//  CMModelSpec.m
//  CityMines
//
//  Created by Marco Köppel on 14.12.10.
//  Copyright 2010 Neue Digitale / Razorfish GmbH. All rights reserved.
//


#import "CMModel.h"

SPEC_BEGIN(CMModelSpec)

describe(@"CMModel", ^{
	
	beforeEach(^{
		
    });
	
	afterEach(^{
		
	});
	
    it(@"should gather the current User Location", ^{
		[[CMModel sharedModel] captureCurrentUserLocation];
		//assertThat([[CMModel sharedModel] currentUserLocation], is(notNilValue()));
	});
	
});

SPEC_END
