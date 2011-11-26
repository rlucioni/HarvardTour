//
//  HTourViewController.m
//  Harvard Tour
//
//  Created by Renzo Lucioni on 11/25/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "HTourViewController.h"
#import "MapKit/MapKit.h"
#import "CustomAnnotation.h"

@implementation HTourViewController

@synthesize mapView=_mapView;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // define span for map: how much area will be shown
    MKCoordinateSpan span;
    span.latitudeDelta = 0.002;
    span.longitudeDelta = 0.002;
    
    // define starting point for map
    CLLocationCoordinate2D start;
    start.latitude = 42.36873056998856;
    start.longitude = -71.11504912376404;
    
    // create region, consisting of span and location
    MKCoordinateRegion region;
    region.span = span;
    region.center = start;
    
    // move the map to our location
    [self.mapView setRegion:region animated:YES];
    
    // create annotation for mather
    CustomAnnotation *mather = [[CustomAnnotation alloc] initWithCoordinate:start];
    mather.title = @"Mather House";
    mather.subtitle = @"The best house";
    
    // create location for dunster
    CLLocationCoordinate2D dunsterLocation;
    dunsterLocation.latitude = 42.36846289215954;
    dunsterLocation.longitude = -71.11598941345215;
    
    // create annotation for dunster
    CustomAnnotation *dunster = [[CustomAnnotation alloc] initWithCoordinate:dunsterLocation];
    dunster.title = @"Dunster House";
    dunster.subtitle = @"The worst house";
    
    // add annotations to map
    [self.mapView addAnnotation:mather];
    [self.mapView addAnnotation:dunster];
    
}

/**
 * Just like we did for table cells, define each annotation
 *
 */
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    // try to re-use pin annotation view
    MKPinAnnotationView *pin = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"Marker"];
    
    // none available in the cache    
    if (pin == nil) {
        // allocate new pin
        pin = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"Marker"];
        
        // add detail disclosure button
        pin.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    }
    
    // change color to green (Red and Purple also available)
    pin.pinColor = MKPinAnnotationColorGreen;
    
    // animate pin dropping
    pin.animatesDrop = YES;
    
    // show callout when tapped
    pin.canShowCallout = YES;
    
    return pin;
}

/**
 * Fired when user taps detail disclosure button
 * Show pop-up of house tapped
 *
 */
- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    // annotation is a property of MKAnnotationView, and we are using our Marker class as the nnotation
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Detail Button Tapped" message:((CustomAnnotation *)view.annotation).title
                                                   delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil];
    [alert show];
}

- (void)viewDidUnload
{
    // release properties
    self.mapView = nil;
    
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end