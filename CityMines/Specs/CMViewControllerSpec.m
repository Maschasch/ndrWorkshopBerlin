//
//  CMViewControllerSpec.m
//  CityMines
//
//  Created by Marco Köppel on 14.12.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//


#import "CMRootViewController.h"

SPEC_BEGIN(CMRootViewControllerSpec)

describe(@"CMViewController", ^{
	__block CMRootViewController *viewController;
	
	
	beforeEach(^{
		viewController = [[CMRootViewController viewController] retain];
    });
	
	afterEach(^{
		[viewController release];
	});
	
    it(@"should have a map view when view was loaded", ^{
		[viewController viewDidLoad];
		assertThat(viewController.mapViewController, is(notNilValue()));
	});
	
});

SPEC_END
