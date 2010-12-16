//
//  CMMineCollisionListener.h
//  CityMines
//
//  Created by Marco Köppel on 15.12.10.
//  Copyright 2010 Neue Digitale / Razorfish GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CMBombAnnotation.h"

@protocol CMMineCollisionListener

- (void)collisionDetected: (CMBombAnnotation *)mine;

@end
