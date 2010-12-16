//
//  CMMapViewController.h
//  CityMines
//
//  Created by Marco Köppel on 14.12.10.
//  Copyright 2010 Neue Digitale / Razorfish GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#import "CMModel.h"
#import "CMMineCollisionObserver.h"
#import "CMMineCollisionListener.h"

@interface CMMapViewController : UIViewController <MKMapViewDelegate, CMMineCollisionListener> {

	MKMapView *mapView;
	UIView *deadLabelContainer;
}

@property (nonatomic, retain) IBOutlet MKMapView *mapView;

@end
