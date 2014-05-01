//
//  CTResizableCircleOverlay.m
//  CoffeeTime
//
//  Created by David Canavan on 30/04/2014.
//  Copyright (c) 2014 Fliphouse. All rights reserved.
//

#import "CTResizableCircleOverlayRenderer.h"

@implementation CTResizableCircleOverlayRenderer

//- (void)createPath
//{
//    CGMutablePathRef path = CGPathCreateMutable();
//    CGPathAddEllipseInRect(path, nil, CGRectMake(0, 0, self.radius * 2, self.radius * 2));
//    self.path = path;
//}
- (id)initWithOverlay:(id<MKOverlay>)overlay
{
    if(self = [super initWithOverlay:overlay])
    {
        _circleOverlay = (CTResizeableCircleOverlay *) overlay;
        [_circleOverlay addObserver:self forKeyPath:@"radius" options:NSKeyValueObservingOptionNew context:nil];
        [_circleOverlay addObserver:self forKeyPath:@"alive" options:NSKeyValueObservingOptionNew context:nil];
        self.fillColor = [UIColor redColor];
        self.alpha = .7f;
    }
    return self;
}

- (void)createPath
{
    CGMutablePathRef path = CGPathCreateMutable();
    MKMapPoint mapPoint = MKMapPointForCoordinate(self.circleOverlay.coordinate);
    CGPoint point = [self pointForMapPoint:mapPoint];
    CGPathAddArc(path, nil, point.x, point.y, self.circleOverlay.radius * MKMapPointsPerMeterAtLatitude(self.circleOverlay.coordinate.latitude), 0, DEGREES_TO_RADIANS(360), YES);
    self.path = path;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"radius"])
        [self invalidatePath];
    else
    {
        // Since the overlay gets dealloced before this object we have to remove
        // our KVOs before it leaks
        [_circleOverlay removeObserver:self forKeyPath:@"radius"];
        [_circleOverlay removeObserver:self forKeyPath:@"alive"];
    }
}

@end




















