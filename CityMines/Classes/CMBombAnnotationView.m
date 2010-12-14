//
//  CMBombAnnotationView.m
//  CityMines
//
//  Created by Marco Köppel on 14.12.10.
//  Copyright 2010 Neue Digitale / Razorfish GmbH. All rights reserved.
//

#import "CMBombAnnotationView.h"


@implementation CMBombAnnotationView

- (id)initWithAnnotation:(id <MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier{
	
	if ([annotation isKindOfClass:[MKUserLocation class]]) return nil;
	
	if (self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier]){
		self.image = [UIImage imageNamed:@"bomb.png"];
	}
	return self;
}

/*
- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
    }
    return self;
}
*/

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
}
*/

- (void)dealloc {
    [super dealloc];
}


@end
