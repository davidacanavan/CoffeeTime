//
//  CTResizableCircleOverlay.h
//  CoffeeTime
//
//  Created by David Canavan on 30/04/2014.
//  Copyright (c) 2014 Fliphouse. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "CTResizeableCircleOverlay.h"

#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)

@interface CTResizableCircleOverlayRenderer : MKOverlayPathRenderer

@property (nonatomic) CTResizeableCircleOverlay *circleOverlay;

@end
