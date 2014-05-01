//
//  CTMapSelectionViewController.h
//  CoffeeTime
//
//  Created by David Canavan on 29/04/2014.
//  Copyright (c) 2014 Fliphouse. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "TWTSideMenuViewController.h"

#define KM 1000
#define MINIMUM_CIRCLE_ANNOTATION_RADIUS 100
#define MAXIMUM_CIRCLE_ANNOTATION_RADIUS 5000
#define DEFAULT_CIRCLE_ANNOTATION_RADIUS 100

@interface CTMapSelectionViewController : UIViewController<MKMapViewDelegate, CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *placePickedButton;
@property (weak, nonatomic) TWTSideMenuViewController *sideMenuViewController;
- (IBAction)menuButtonPressed:(UIBarButtonItem *)sender;
- (IBAction)placePickedButtonPressed:(UIBarButtonItem *)sender;
- (IBAction)distanceSliderMoved:(UISlider *)sender;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
@property (weak, nonatomic) IBOutlet UISlider *distanceSlider;

@end
