//
//  CMAppDelegateSpec.m
//
//  Copyright 2010 Neue Digitale. All rights reserved.
//

#import <Cedar-iPhone/SpecHelper.h>
#define HC_SHORTHAND
#import <OCHamcrest-iPhone/OCHamcrest.h>
#import <OCMock-iPhone/OCMock.h>

#import "CMAppDelegate.h"

SPEC_BEGIN(CMAppDelegateSpec)

describe(@"CMAppDelegate", ^{
	__block CMAppDelegate *appDelegate;
	__block id applicationMock;
	
	beforeEach(^{
        appDelegate = [[CMAppDelegate alloc] init];
		applicationMock = [[OCMockObject mockForClass:[UIApplication class]] retain];
    });
	
	afterEach(^{
	    [appDelegate release];
		[applicationMock release];
	});

    it(@"should have a root view controller if the view was loaded", ^{
		[appDelegate application:applicationMock didFinishLaunchingWithOptions:nil];
		assertThat(appDelegate.viewController, is(notNilValue()));
	});

});

SPEC_END
