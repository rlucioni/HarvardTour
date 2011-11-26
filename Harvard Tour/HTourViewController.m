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
    
    // define starting point for map (Harvard Yard)
    CLLocationCoordinate2D start;
    start.latitude = 42.37461191594064;
    start.longitude = -71.11746847629547;
    
    // create region, consisting of span and location
    MKCoordinateRegion region;
    region.span = span;
    region.center = start;
    
    // move the map to our location
    [self.mapView setRegion:region animated:YES];
    
    // create location for Hollis
    CLLocationCoordinate2D hollisLocation;
    hollisLocation.latitude = 42.37500623176736;
    hollisLocation.longitude = -71.11784666776657;
    
    // create annotation for Hollis
    CustomAnnotation *hollis = [[CustomAnnotation alloc] initWithCoordinate:hollisLocation];
    hollis.title = @"Hollis";
    hollis.subtitle = @"The best dorm";
    
    // create location for Canaday
    CLLocationCoordinate2D canadayLocation;
    canadayLocation.latitude = 42.37520834243742;
    canadayLocation.longitude = -71.11585646867752;
    
    // create annotation for Canaday
    CustomAnnotation *canaday = [[CustomAnnotation alloc] initWithCoordinate:canadayLocation];
    canaday.title = @"Canaday";
    canaday.subtitle = @"The worst dorm (historical info here)";
    
    // add annotations to map
    [self.mapView addAnnotation:hollis];
    [self.mapView addAnnotation:canaday];
    
}

/*
 * Define each annotation
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
    
    // change color to red
    pin.pinColor = MKPinAnnotationColorRed;
    
    // animate pin dropping
    pin.animatesDrop = YES;
    
    // show callout when tapped
    pin.canShowCallout = YES;
    
    return pin;
}

/*
 * Fired when user taps detail disclosure button
 * Show pop-up of location tapped
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