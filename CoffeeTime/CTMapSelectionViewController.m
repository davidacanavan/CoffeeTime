//
//  CTMapSelectionViewController.m
//  CoffeeTime
//
//  Created by David Canavan on 29/04/2014.
//  Copyright (c) 2014 Fliphouse. All rights reserved.
//

#import "CTMapSelectionViewController.h"
#import "CTResizeableCircleOverlay.h"
#import "CTResizableCircleOverlayRenderer.h"

@implementation CTMapSelectionViewController
{
    CLLocationManager *_locationManager;
    MKPointAnnotation *_centrePoint;
    CTResizeableCircleOverlay *_circleOverlay;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Track user location for first position
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;
    _locationManager.distanceFilter = kCLDistanceFilterNone;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [_locationManager startUpdatingLocation];
    
    // Distance slider setup
//    self.distanceSlider.value = MINIMUM_CIRCLE_ANNOTATION_RADIUS;
//    self.distanceSlider.maximumValue = MAXIMUM_CIRCLE_ANNOTATION_RADIUS;
//    self.distanceSlider.minimumValue = MINIMUM_CIRCLE_ANNOTATION_RADIUS;
//    self.distanceSlider.continuous = YES;
    
    // Configure the map view
    _centrePoint = [[MKPointAnnotation alloc] init];
    [self.mapView addAnnotation:_centrePoint];
    self.mapView.delegate = self;
}

- (IBAction)menuButtonPressed:(UIBarButtonItem *)sender
{
    [self.sideMenuViewController openMenuAnimated:YES completion:nil];
}

- (IBAction)placePickedButtonPressed:(UIBarButtonItem *)sender
{
    if ([sender.title isEqualToString:@"Go"])
    {
        sender.title = @"Stop";
        self.toolbar.hidden = NO;
        self.distanceSlider.value = 0;
        [self.mapView removeAnnotation:_centrePoint];
        _circleOverlay = [CTResizeableCircleOverlay overlayWithCoordinate:self.mapView.centerCoordinate radius:DEFAULT_CIRCLE_ANNOTATION_RADIUS];
        [self.mapView addOverlay:_circleOverlay];
    }
    else
    {
        sender.title = @"Go";
        self.toolbar.hidden = YES;
        [self.mapView addAnnotation:_centrePoint];
        _circleOverlay.alive = NO;
        [self.mapView removeOverlay:_circleOverlay];
        _circleOverlay = nil;
    }
}

- (IBAction)distanceSliderMoved:(UISlider *)sender
{
    CLLocationDistance radius = (sender.value * (MAXIMUM_CIRCLE_ANNOTATION_RADIUS - MINIMUM_CIRCLE_ANNOTATION_RADIUS) + MINIMUM_CIRCLE_ANNOTATION_RADIUS) / 2;
    _circleOverlay.radius = radius;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(newLocation.coordinate, 4 * KM, 4 * KM)];
    [_locationManager stopUpdatingLocation];
    _locationManager = nil;
    _centrePoint.coordinate = newLocation.coordinate;
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id < MKAnnotation >)annotation
{
    return [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"CentrePin"];
}

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id < MKOverlay >)overlay
{
    CTResizableCircleOverlayRenderer *renderer = [[CTResizableCircleOverlayRenderer alloc] initWithOverlay:overlay];
    renderer.fillColor = [UIColor colorWithRed:0.6 green:0.8 blue:1 alpha:0.7];
    return renderer;
}

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    _centrePoint.coordinate = self.mapView.centerCoordinate;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end





















