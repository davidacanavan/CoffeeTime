//
//  CTResizeableCircle.m
//  CoffeeTime
//
//  Created by David Canavan on 30/04/2014.
//  Copyright (c) 2014 Fliphouse. All rights reserved.
//

#import "CTResizeableCircleOverlay.h"

@implementation CTResizeableCircleOverlay

+ (id)overlayWithCoordinate:(CLLocationCoordinate2D)coordinate radius:(CLLocationDistance)radius
{
    CTResizeableCircleOverlay* overlay = [CTResizeableCircleOverlay new];
    [overlay resetWithCoordinate:coordinate radius:radius];
    return overlay;
}

-(void)resetWithCoordinate:(CLLocationCoordinate2D)coordinate radius:(CLLocationDistance)radius
{
    self.coordinate = coordinate;
    self.radius = radius;
    self.alive = YES;
}

- (MKMapRect)boundingMapRect
{
    MKMapPoint upperLeft = MKMapPointForCoordinate(self.coordinate);
    MKMapRect bounds = MKMapRectMake(upperLeft.x, upperLeft.y, self.radius*2, self.radius*2);
    return bounds;
}

- (void)setCoordinate:(CLLocationCoordinate2D)coordinate
{
    _coordinate = coordinate;
    self.boundingMapRect = self.boundingMapRect;
}

@end
