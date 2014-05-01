//
//  CTResizeableCircle.h
//  CoffeeTime
//
//  Created by David Canavan on 30/04/2014.
//  Copyright (c) 2014 Fliphouse. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface CTResizeableCircleOverlay : NSObject<MKOverlay>

@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic) MKMapRect boundingMapRect;
@property (nonatomic) CLLocationDistance radius;
@property (nonatomic) BOOL alive; // Fudge property for correct KVO removal of overlay

+ (id)overlayWithCoordinate:(CLLocationCoordinate2D)coordinate radius:(CLLocationDistance)radius;
-(void)resetWithCoordinate:(CLLocationCoordinate2D)coordinate radius:(CLLocationDistance)radius;

@end
