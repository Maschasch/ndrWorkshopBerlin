//
//  CMAppDelegateTest.m
//
//  Copyright 2010 Neue Digitale. All rights reserved.
//

#import "CMAppDelegate.h"

@interface CMAppDelegateTest : GHTestCase 
{
	CMAppDelegate *appDelegate;
	id applicationMock;
}

- (void)testAppDelegate;
@end 


@implementation CMAppDelegateTest

- (void)setUp
{
	appDelegate = [[CMAppDelegate alloc] init];
	applicationMock = [[OCMockObject mockForClass:[UIApplication class]] retain];
}

- (void)tearDown
{
	[appDelegate release];
	[applicationMock release];
}

- (void)testAppDelegate
{
	[appDelegate application:applicationMock didFinishLaunchingWithOptions:nil];
	GHAssertNotNil(appDelegate.viewController, @"CMAppDelegate should have a root view controller");
}
@end
