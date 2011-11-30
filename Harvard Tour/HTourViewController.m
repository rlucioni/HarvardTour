//
//  HTourViewController.m
//  Harvard Tour
//
//  Created by Renzo Lucioni on 11/25/11.
//

#import "HTourViewController.h"
#import "MapKit/MapKit.h"
#import "CustomAnnotation.h"

#define START_LATITUDE 42.37461191594064
#define START_LONGITUDE -71.11746847629547

@implementation HTourViewController

@synthesize mapView=_mapView;


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle


- (void)setMapRegion
{
    // define span for map: how much area will be shown on screen
    MKCoordinateSpan span;
    span.latitudeDelta = 0.002;
    span.longitudeDelta = 0.002;
    
    // define starting point for map (Harvard Yard)
    CLLocationCoordinate2D start;
    start.latitude = START_LATITUDE;
    start.longitude = START_LONGITUDE;
    
    // create region consisting of span and location
    MKCoordinateRegion region;
    region.span = span;
    region.center = start;
    
    // move the map to our location
    [self.mapView setRegion:region animated:YES];
}

- (void)set3darLocation
{
    // define starting point for map (Harvard Yard)
    CLLocation *startLocation = [[CLLocation alloc] initWithLatitude:START_LATITUDE longitude:START_LONGITUDE];
    NSLog(@"Moving 3DAR location to %@", startLocation);
    [self.mapView.sm3dar.locationManager stopUpdatingLocation];
    [self.mapView.sm3dar changeCurrentLocation:startLocation];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void) sm3darLoadPoints:(SM3DARController *)sm3dar
{ 
    [self set3darLocation];
 
 // create location for Canaday
 CLLocationCoordinate2D canadayLocation;
 canadayLocation.latitude = 42.37520834243742;
 canadayLocation.longitude = -71.11585646867752;
 
 // create annotation for Canaday
 CustomAnnotation *canaday = [[CustomAnnotation alloc] initWithCoordinate:canadayLocation];
 canaday.title = @"Canaday";
 canaday.subtitle = @"The worst dorm. Shaped like a question mark.";
 
 // create location for Hollis
 CLLocationCoordinate2D hollisLocation;
 hollisLocation.latitude = 42.37500623176736;
 hollisLocation.longitude = -71.11784666776657;
 
 // create annotation for Hollis
 CustomAnnotation *hollis = [[CustomAnnotation alloc] initWithCoordinate:hollisLocation];
 hollis.title = @"Hollis";
 hollis.subtitle = @"Built in 1763, Hollis is one of the oldest buildings at Harvard. It housed George Washington's troops during the revolution. Past residents include Ralph Waldo Emerson, Henry David Thoreau, John Updike, Charles Sumner, and Jim Cramer.";
 
 // create location for John Harvard statue
 CLLocationCoordinate2D statueLocation;
 statueLocation.latitude = 42.374473211292376;
 statueLocation.longitude = -71.11719220876694;
 
 // create annotation for John Harvard statue
 CustomAnnotation *statue = [[CustomAnnotation alloc] initWithCoordinate:statueLocation];
 statue.title = @"John Harvard statue";
 statue.subtitle = @"A Puritan minister (c. 1630)";
 
 // create location for Stoughton
 CLLocationCoordinate2D stoughtonLocation;
 stoughtonLocation.latitude = 42.37538073043612;
 stoughtonLocation.longitude = -71.11772328615189;
 
 // create annotation for Stoughton
 CustomAnnotation *stoughton = [[CustomAnnotation alloc] initWithCoordinate:stoughtonLocation];
 stoughton.title = @"Stoughton";
 stoughton.subtitle = @"Hollis' twin dorm";
 
 // create location for Middle Wigg
 CLLocationCoordinate2D wiggmidLocation;
 wiggmidLocation.latitude = 42.373066332548795;
 wiggmidLocation.longitude = -71.11716270446777;
 
 // create annotation for Middle Wigg
 CustomAnnotation *wiggmid = [[CustomAnnotation alloc] initWithCoordinate:wiggmidLocation];
 wiggmid.title = @"Middle Wigglesworth";
 wiggmid.subtitle = @"Middle Wigglesworth is the best! ";
 
 // create location for Big Wigg
 CLLocationCoordinate2D wiggbigLocation;
 wiggbigLocation.latitude = 42.372830528661574;
 wiggbigLocation.longitude = -71.11622929573059;
 
 // create annotation for Big Wigg
 CustomAnnotation *wiggbig = [[CustomAnnotation alloc] initWithCoordinate:wiggbigLocation];
 wiggbig.title = @"Big Wigglesworth";
 wiggbig.subtitle = @"Not as cool as mid wigg";
 
 // create location for Small Wigg
 CLLocationCoordinate2D wiggsmallLocation;
 wiggsmallLocation.latitude = 42.372830528661574;
 wiggsmallLocation.longitude = -71.11622929573059;
 
 // create annotation for Small Wigg
 CustomAnnotation *wiggsmall = [[CustomAnnotation alloc] initWithCoordinate:wiggsmallLocation];
 wiggsmall.title = @"Small Wigglesworth";
 wiggsmall.subtitle = @"It's Tiny! ";
 
 // create location for Lamont 
 CLLocationCoordinate2D lamontLocation;
 lamontLocation.latitude = 42.372830528661574;
 lamontLocation.longitude = -71.11622929573059;
 
 // create annotation for Lamont
 CustomAnnotation *lamont = [[CustomAnnotation alloc] initWithCoordinate:lamontLocation];
 lamont.title = @"Lamont Library";
 lamont.subtitle = @"Not as cool as mid wigg";
 
 // create location for Houghton
 CLLocationCoordinate2D houghtonLocation;
 houghtonLocation.latitude = 42.372830528661574;
 houghtonLocation.longitude = -71.11622929573059;
 
 // create annotation for Houghton
 CustomAnnotation *houghton = [[CustomAnnotation alloc] initWithCoordinate:houghtonLocation];
 houghton.title = @"Houghton Library";
 houghton.subtitle = @"Not as cool as mid wigg";
 
 // create location for Loeb
 CLLocationCoordinate2D loebLocation;
 loebLocation.latitude = 42.372830528661574;
 loebLocation.longitude = -71.11622929573059;
 
 // create annotation for Loeb
 CustomAnnotation *loeb = [[CustomAnnotation alloc] initWithCoordinate:loebLocation];
 loeb.title = @"Loeb Building";
 loeb.subtitle = @"Not as cool as mid wigg";
 
 // create location for Boylston
 CLLocationCoordinate2D boylstonLocation;
 boylstonLocation.latitude = 42.372830528661574;
 boylstonLocation.longitude = -71.11622929573059;
 
 // create annotation for Boylston
 CustomAnnotation *boylston = [[CustomAnnotation alloc] initWithCoordinate:boylstonLocation];
 boylston.title = @"Boylston Hall";
 boylston.subtitle = @"Not as cool as mid wigg";
 
 // create location for Widener
 CLLocationCoordinate2D widenerLocation;
 widenerLocation.latitude = 42.372830528661574;
 widenerLocation.longitude = -71.11622929573059;
 
 // create annotation for Widener
 CustomAnnotation *widener = [[CustomAnnotation alloc] initWithCoordinate:widenerLocation];
 widener.title = @"Widener Library";
 widener.subtitle = @"Not as cool as mid wigg";
 
 // create location for Wadsworth
 CLLocationCoordinate2D wadLocation;
 wadLocation.latitude = 42.372830528661574;
 wadLocation.longitude = -71.11622929573059;
 
 // create annotation for Wadsworth
 CustomAnnotation *wad = [[CustomAnnotation alloc] initWithCoordinate:wadLocation];
 wad.title = @"Wadsworth Hall";
 wad.subtitle = @"Not as cool as mid wigg";
 
 // create location for Grays
 CLLocationCoordinate2D graysLocation;
 graysLocation.latitude = 42.372830528661574;
 graysLocation.longitude = -71.11622929573059;
 
 // create annotation for Grays
 CustomAnnotation *grays = [[CustomAnnotation alloc] initWithCoordinate:graysLocation];
 grays.title = @"Grays House";
 grays.subtitle = @"Not as cool as mid wigg";
 
 // create location for Dudley
 CLLocationCoordinate2D dudleyLocation;
 dudleyLocation.latitude = 42.372830528661574;
 dudleyLocation.longitude = -71.11622929573059;
 
 // create annotation for Dudley
 CustomAnnotation *dudley = [[CustomAnnotation alloc] initWithCoordinate:dudleyLocation];
 dudley.title = @"Dudley House";
 dudley.subtitle = @"Not as cool as mid wigg";
 
 // create location for Strauss
 CLLocationCoordinate2D straussLocation;
 straussLocation.latitude = 42.372830528661574;
 straussLocation.longitude = -71.11622929573059;
 
 // create annotation for Strauss
 CustomAnnotation *strauss = [[CustomAnnotation alloc] initWithCoordinate:straussLocation];
 strauss.title = @"Strauss House";
 strauss.subtitle = @"Not as cool as mid wigg";
 
 // create location for Matthews
 CLLocationCoordinate2D matthewsLocation;
 matthewsLocation.latitude = 42.372830528661574;
 matthewsLocation.longitude = -71.11622929573059;
 
 // create annotation for Matthews
 CustomAnnotation *matthews = [[CustomAnnotation alloc] initWithCoordinate:matthewsLocation];
 matthews.title = @"Matthews House";
 matthews.subtitle = @"Not as cool as mid wigg";
 
 // create location for Mass Hall
 CLLocationCoordinate2D masshallLocation;
 masshallLocation.latitude = 42.372830528661574;
 masshallLocation.longitude = -71.11622929573059;
 
 // create annotation for Mass Hall
 CustomAnnotation *masshall = [[CustomAnnotation alloc] initWithCoordinate:masshallLocation];
 masshall.title = @"Massachusets Hall";
 masshall.subtitle = @"Not as cool as mid wigg";
 
 // create location for Weld
 CLLocationCoordinate2D weldLocation;
 weldLocation.latitude = 42.372830528661574;
 weldLocation.longitude = -71.11622929573059;
 
 // create annotation for Weld
 CustomAnnotation *weld = [[CustomAnnotation alloc] initWithCoordinate:weldLocation];
 weld.title = @"Weld House";
 weld.subtitle = @"Not as cool as mid wigg";
 
 // create location for University Hall
 CLLocationCoordinate2D univLocation;
 univLocation.latitude = 42.372830528661574;
 univLocation.longitude = -71.11622929573059;
 
 // create annotation for University Hall
 CustomAnnotation *univ = [[CustomAnnotation alloc] initWithCoordinate:univLocation];
 univ.title = @"University Hall";
 univ.subtitle = @"Not as cool as mid wigg";
 
 // create location for Harvard Hall
 CLLocationCoordinate2D hhallLocation;
 hhallLocation.latitude = 42.372830528661574;
 hhallLocation.longitude = -71.11622929573059;
 
 // create annotation for Harvard Hall
 CustomAnnotation *hhall = [[CustomAnnotation alloc] initWithCoordinate:hhallLocation];
 hhall.title = @"Harvard Hall";
 hhall.subtitle = @"Not as cool as mid wigg";
 
 // create location for Lionel
 CLLocationCoordinate2D lionelLocation;
 lionelLocation.latitude = 42.372830528661574;
 lionelLocation.longitude = -71.11622929573059;
 
 // create annotation for Lionel
 CustomAnnotation *lionel = [[CustomAnnotation alloc] initWithCoordinate:lionelLocation];
 lionel.title = @"Lionel House";
 lionel.subtitle = @"Not as cool as mid wigg";
 
 // create location for Holden Chapel
 CLLocationCoordinate2D holdenLocation;
 holdenLocation.latitude = 42.372830528661574;
 holdenLocation.longitude = -71.11622929573059;
 
 // create annotation for Holden Chapel
 CustomAnnotation *holden = [[CustomAnnotation alloc] initWithCoordinate:holdenLocation];
 holden.title = @"Holden Chapel";
 holden.subtitle = @"Not as cool as mid wigg";
 
 // create location for Mower
 CLLocationCoordinate2D mowerLocation;
 mowerLocation.latitude = 42.372830528661574;
 mowerLocation.longitude = -71.11622929573059;
 
 // create annotation for Mower
 CustomAnnotation *mower = [[CustomAnnotation alloc] initWithCoordinate:mowerLocation];
 mower.title = @"Mower Hall";
 mower.subtitle = @"Not as cool as mid wigg";
 
 // create location for PBHA
 CLLocationCoordinate2D pbhaLocation;
 pbhaLocation.latitude = 42.372830528661574;
 pbhaLocation.longitude = -71.11622929573059;
 
 // create annotation for PBHA
 CustomAnnotation *pbha = [[CustomAnnotation alloc] initWithCoordinate:pbhaLocation];
 pbha.title = @"Loeb Building";
 pbha.subtitle = @"Not as cool as mid wigg";
 
 // create location for Holworthy
 CLLocationCoordinate2D holworthyLocation;
 holworthyLocation.latitude = 42.372830528661574;
 holworthyLocation.longitude = -71.11622929573059;
 
 // create annotation for Holworthy
 CustomAnnotation *holworthy = [[CustomAnnotation alloc] initWithCoordinate:holworthyLocation];
 holworthy.title = @"Holworthy Hall";
 holworthy.subtitle = @"Not as cool as mid wigg";
 
 // create location for Thayer
 CLLocationCoordinate2D thayerLocation;
 thayerLocation.latitude = 42.372830528661574;
 thayerLocation.longitude = -71.11622929573059;
 
 // create annotation for Thayer
 CustomAnnotation *thayer = [[CustomAnnotation alloc] initWithCoordinate:thayerLocation];
 thayer.title = @"Thayer Hall";
 thayer.subtitle = @"Not as cool as mid wigg";
 
 // create location for Memorial Church
 CLLocationCoordinate2D churchLocation;
 churchLocation.latitude = 42.372830528661574;
 churchLocation.longitude = -71.11622929573059;
 
 // create annotation for Memorial Church
 CustomAnnotation *church = [[CustomAnnotation alloc] initWithCoordinate:churchLocation];
 church.title = @"Memorial church";
 church.subtitle = @"Not as cool as mid wigg";
 
 // create location for Robinson
 CLLocationCoordinate2D robinsonLocation;
 robinsonLocation.latitude = 42.372830528661574;
 robinsonLocation.longitude = -71.11622929573059;
 
 // create annotation for Robinson
 CustomAnnotation *robinson = [[CustomAnnotation alloc] initWithCoordinate:robinsonLocation];
 robinson.title = @"Robinson ";
 robinson.subtitle = @"Not as cool as mid wigg";
 
 // create location for Sever
 CLLocationCoordinate2D severLocation;
 severLocation.latitude = 42.372830528661574;
 severLocation.longitude = -71.11622929573059;
 
 // create annotation for Sever
 CustomAnnotation *sever = [[CustomAnnotation alloc] initWithCoordinate:severLocation];
 sever.title = @"Sever Hall";
 sever.subtitle = @"Not as cool as mid wigg";
 
 // create location for Emerson
 CLLocationCoordinate2D emersonLocation;
 emersonLocation.latitude = 42.372830528661574;
 emersonLocation.longitude = -71.11622929573059;
 
 // create annotation for Emerson
 CustomAnnotation *emerson = [[CustomAnnotation alloc] initWithCoordinate:emersonLocation];
 emerson.title = @"Emerson Hall";
 emerson.subtitle = @"Not as cool as mid wigg";
 
 // add annotations to map
 [self.mapView addAnnotation:statue];
 [self.mapView addAnnotation:hollis];
 [self.mapView addAnnotation:stoughton];
 [self.mapView addAnnotation:canaday];
 [self.mapView addAnnotation:wiggmid];
 [self.mapView addAnnotation:wiggbig];
 [self.mapView addAnnotation:wiggsmall];
 [self.mapView addAnnotation:lamont];
 [self.mapView addAnnotation:houghton];
 [self.mapView addAnnotation:loeb];
 [self.mapView addAnnotation:boylston];
 [self.mapView addAnnotation:widener];
 [self.mapView addAnnotation:wad];
 [self.mapView addAnnotation:grays];
 [self.mapView addAnnotation:dudley];
 [self.mapView addAnnotation:strauss];
 [self.mapView addAnnotation:matthews];
 [self.mapView addAnnotation:masshall];
 [self.mapView addAnnotation:weld];
 [self.mapView addAnnotation:univ];
 [self.mapView addAnnotation:hhall];
 [self.mapView addAnnotation:lionel];
 [self.mapView addAnnotation:holden];
 [self.mapView addAnnotation:mower];
 [self.mapView addAnnotation:pbha];
 [self.mapView addAnnotation:holworthy];
 [self.mapView addAnnotation:thayer];
 [self.mapView addAnnotation:church];
 [self.mapView addAnnotation:robinson];
 [self.mapView addAnnotation:sever];
 [self.mapView addAnnotation:emerson];
}



/*
- (void)viewDidAppear
{
    [_mapView startCamera];
}
*/


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
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Detail Button Tapped" 
                                                    message:((CustomAnnotation *)view.annotation).title
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