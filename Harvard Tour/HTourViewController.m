//
//  HTourViewController.m
//  Harvard Tour
//
//  Created by Renzo Lucioni on 11/25/11.
//

#import "HTourViewController.h"
#import "MapKit/MapKit.h"
#import "CustomAnnotation.h"

@implementation HTourViewController

@synthesize mapView=_mapView;

// is this necessary with ARC?
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // define span for map: how much area will be shown on screen
    MKCoordinateSpan span;
    span.latitudeDelta = 0.002;
    span.longitudeDelta = 0.002;
    
    // define starting point for map (Harvard Yard)
    CLLocationCoordinate2D start;
    start.latitude = 42.37461191594064;
    start.longitude = -71.11746847629547;
    
    // create region consisting of span and location
    MKCoordinateRegion region;
    region.span = span;
    region.center = start;
    
    // move the map to our location
    [self.mapView setRegion:region animated:YES];
    
    // create location for John Harvard statue
    CLLocationCoordinate2D statueLocation;
    statueLocation.latitude = 42.374473211292376;
    statueLocation.longitude = -71.11719220876694;
    
    // create annotation for John Harvard statue
    CustomAnnotation *statue = [[CustomAnnotation alloc] initWithCoordinate:statueLocation];
    statue.title = @"John Harvard statue";
    statue.subtitle = @"A Puritan minister (c. 1630)";
    
    // create location for Hollis
    CLLocationCoordinate2D hollisLocation;
    hollisLocation.latitude = 42.37500623176736;
    hollisLocation.longitude = -71.11784666776657;
    
    // create annotation for Hollis
    CustomAnnotation *hollis = [[CustomAnnotation alloc] initWithCoordinate:hollisLocation];
    hollis.title = @"Hollis";
    hollis.subtitle = @"The best dorm";
    
    // create location for Stoughton
    CLLocationCoordinate2D stoughtonLocation;
    stoughtonLocation.latitude = 42.37538073043612;
    stoughtonLocation.longitude = -71.11772328615189;
    
    // create annotation for Stoughton
    CustomAnnotation *stoughton = [[CustomAnnotation alloc] initWithCoordinate:stoughtonLocation];
    stoughton.title = @"Stoughton";
    stoughton.subtitle = @"Hollis' twin dorm";
    
    // create location for Canaday
    CLLocationCoordinate2D canadayLocation;
    canadayLocation.latitude = 42.37520834243742;
    canadayLocation.longitude = -71.11585646867752;
    
    // create annotation for Canaday
    CustomAnnotation *canaday = [[CustomAnnotation alloc] initWithCoordinate:canadayLocation];
    canaday.title = @"Canaday";
    canaday.subtitle = @"The worst dorm";
    
    // TODO
    // hardcode other dorms and locations on campus here?
    
    // add annotations to map
    [self.mapView addAnnotation:statue];
    [self.mapView addAnnotation:hollis];
    [self.mapView addAnnotation:stoughton];
    [self.mapView addAnnotation:canaday];
    
}


/*
 * Define each annotation
 */

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    // attempt to re-use pin annotation view
    MKPinAnnotationView *pin = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"Marker"];
    
    // if none available in cache    
    if (pin == nil) 
    {
        // allocate new pin
        pin = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"Marker"];
        
        // add detail disclosure button
        pin.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    }
    
    // CODE HERE IS NOT EXECUTING - CONTROL CONNECT TO STORYBOARD MAY BE THE ISSUE
    
    // change pin color to purple
    pin.pinColor = MKPinAnnotationColorPurple;
    
    // animate pin drop (does not work - iOS SDK 5.0 change/Storyboard compatible?)
    pin.animatesDrop = YES;
    
    // show information callout when tapped
    pin.canShowCallout = YES;
    
    return pin;
}


/*
 * Executes when user taps detail disclosure button. Shows pop-up of location tapped.
 */

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    // annotation is a property of MKAnnotationView; using Marker class as the nnotation
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