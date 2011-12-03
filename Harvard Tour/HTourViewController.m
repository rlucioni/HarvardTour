//
//  HTourViewController.m
//  Harvard Tour
//
//  Created by Renzo Lucioni and Anuv Ratan on 11/25/11.
//

#import "HTourViewController.h"
#import "MapKit/MapKit.h"
#import "CustomAnnotation.h"

#define START_LATITUDE 42.37461191594064
#define START_LONGITUDE -71.11746847629547

@implementation HTourViewController


@synthesize mapView=_mapView;
@synthesize locationManager=_locationManager;


- (void)didReceiveMemoryWarning

{
    [super didReceiveMemoryWarning];
}


/*
 * Create an instance of the CLLocationManager
 */

/*
 - (void)trackUser
{
    self.locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [_locationManager startUpdatingLocation];
}
*/


/*
 * Get the current latitude and longitude using the delegate method
 */

/*
- (void)locationManager:(CLLocationManager *)manager 
    didUpdateToLocation:(CLLocation *)newLocation 
           fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"New latitude: %f", newLocation.coordinate.latitude);
    NSLog(@"New longitude: %f", newLocation.coordinate.longitude);
}
*/

#pragma mark - View lifecycle


- (void)setMapRegion
{
    // define span for map: how much area will be shown on screen
    MKCoordinateSpan span;
    span.latitudeDelta = 0.002;
    span.longitudeDelta = 0.002;
    
    // define starting point for map and AR view (currently Harvard Yard)
    CLLocationCoordinate2D start;
    start.latitude = START_LATITUDE; // ideally user's current latitude
    start.longitude = START_LONGITUDE; // ideally user's current longitude
    
    // create region consisting of span and location
    MKCoordinateRegion region;
    region.span = span;
    region.center = start;
    
    // move the map to our location
    [self.mapView setRegion:region animated:YES];
}



/*
 * Define starting point for AR view (e.g., Harvard Yard); commented out so that AR view initializes to current user location
 */

/*
- (void)set3darLocation
{
    CLLocation *startLocation = [[CLLocation alloc] initWithLatitude:START_LATITUDE longitude:START_LONGITUDE];
    NSLog(@"Moving 3DAR location to %@", startLocation);
    [self.mapView.sm3dar.locationManager stopUpdatingLocation];
    [self.mapView.sm3dar changeCurrentLocation:startLocation];
}
*/


- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void) sm3darLoadPoints:(SM3DARController *)sm3dar
{ 
     // [self set3darLocation];
 
     // create location for Canaday
     CLLocationCoordinate2D canadayLocation;
     canadayLocation.latitude = 42.37520834243742;
     canadayLocation.longitude = -71.11585646867752;
     
     // create annotation for Canaday
     CustomAnnotation *canaday = [[CustomAnnotation alloc] initWithCoordinate:canadayLocation];
     canaday.title = @"Canaday";
     canaday.subtitle = @"Canaday Hall, completed in 1974, is the newest dormitory in Harvard Yard, historical home of Harvard College freshmen for their first year in residence upon their initial arrival in Cambridge.Past residents include Paul Wylie, David Sacks, Ben Mezrich, Mira Sorvino, Sean Gullette, and Charles Lane.";
     
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
     statue.subtitle = @"John Harvard was not, as often said, the founder of Harvard College, though he was its first benefactor. The childless Harvard, who had inherited considerable sums from his father, mother, and brother, bequeathed £780 (half of his monetary estate) as well as (perhaps more importantly) his 400-volume library to what had been called the New College—which was soon renamed Harvard College.";
     
     // create location for Stoughton
     CLLocationCoordinate2D stoughtonLocation;
     stoughtonLocation.latitude = 42.37538073043612;
     stoughtonLocation.longitude = -71.11772328615189;
     
     // create annotation for Stoughton
     CustomAnnotation *stoughton = [[CustomAnnotation alloc] initWithCoordinate:stoughtonLocation];
     stoughton.title = @"Stoughton";
    stoughton.subtitle = @"Stoughton Hall Designed by Charles Bulfinch in 1804 is one of the dormitories housing first-year students at Harvard College. It is located in Harvard Yard. The rooms are spacious doubles. Past residents include Oliver Wendell Holmes, Sydney Schanberg, Horatio Alger ";
     
     // create location for Middle Wigg
     CLLocationCoordinate2D wiggmidLocation;
     wiggmidLocation.latitude = 42.373066332548795;
     wiggmidLocation.longitude = -71.11716270446777;
     
     // create annotation for Middle Wigg
     CustomAnnotation *wiggmid = [[CustomAnnotation alloc] initWithCoordinate:wiggmidLocation];
     wiggmid.title = @"Middle Wigglesworth";
    wiggmid.subtitle = @"Wigglesworth Hall is the second-largest of the dormitories housing first-year students at Harvard College. It was constructed in 1931, its location was part of President Lowell's plan to enclose the Yard from the traffic of Harvard Square.   Past residents include Bill Gates, Sen. Lee E. Rosenthal , Ted Kennedy, Leonard Bernstein. ";
     
     // create location for Big Wigg
     CLLocationCoordinate2D wiggbigLocation;
     wiggbigLocation.latitude = 42.372830528661574;
     wiggbigLocation.longitude = -71.11622929573059;
     
     // create annotation for Big Wigg
     CustomAnnotation *wiggbig = [[CustomAnnotation alloc] initWithCoordinate:wiggbigLocation];
     wiggbig.title = @"Big Wigglesworth";
     wiggbig.subtitle = @"Wigglesworth Hall is the second-largest of the dormitories housing first-year students at Harvard College. It was constructed in 1931, its location was part of President Lowell's plan to enclose the Yard from the traffic of Harvard Square.   Past residents include Bill Gates, Sen. Lee E. Rosenthal , Ted Kennedy, Leonard Bernstein. ";
     
     // create location for Small Wigg
     CLLocationCoordinate2D wiggsmallLocation;
     wiggsmallLocation.latitude = 42.37328430174117;
     wiggsmallLocation.longitude = -71.11783862113953;
     
     // create annotation for Small Wigg
     CustomAnnotation *wiggsmall = [[CustomAnnotation alloc] initWithCoordinate:wiggsmallLocation];
     wiggsmall.title = @"Small Wigglesworth";
     wiggsmall.subtitle = @"Wigglesworth Hall is the second-largest of the dormitories housing first-year students at Harvard College. It was constructed in 1931, its location was part of President Lowell's plan to enclose the Yard from the traffic of Harvard Square.   Past residents include Bill Gates, Sen. Lee E. Rosenthal , Ted Kennedy, Leonard Bernstein. ";
     
     // create location for Lamont 
     CLLocationCoordinate2D lamontLocation;
     lamontLocation.latitude = 42.372777026816046;
     lamontLocation.longitude = -71.11549973487854;
     
     // create annotation for Lamont
     CustomAnnotation *lamont = [[CustomAnnotation alloc] initWithCoordinate:lamontLocation];
     lamont.title = @"Lamont Library";
    lamont.subtitle = @"Lamont Library is one of the primary buildings of the library system of Harvard University, located in the south-east corner of Harvard Yard. It was the first library at Harvard designed primarily for undergraduate students at Harvard College, to relieve pressure in the main Widener Library. ";
     
     // create location for Houghton
     CLLocationCoordinate2D houghtonLocation;
     houghtonLocation.latitude = 42.373197114155;
     houghtonLocation.longitude = -71.11595571041107;
     
     // create annotation for Houghton
     CustomAnnotation *houghton = [[CustomAnnotation alloc] initWithCoordinate:houghtonLocation];
     houghton.title = @"Houghton Library";
     houghton.subtitle = @"Houghton Library is the primary repository for rare books and manuscripts at Harvard University. It is part of the Harvard College Library within the Harvard Faculty of Arts and Sciences.";
     
     // create location for Loeb
     CLLocationCoordinate2D loebLocation;
     loebLocation.latitude = 42.37349434406542;
     loebLocation.longitude = -71.11532270908356;
     
     // create annotation for Loeb
     CustomAnnotation *loeb = [[CustomAnnotation alloc] initWithCoordinate:loebLocation];
     loeb.title = @"Loeb House";
    loeb.subtitle = @" For many years the residence of Harvard presidents, Loeb House today is the home of Harvard’s Governing Boards and their administrative offices.The first floor is decorated in the 19th century style, forming an elegant, light-filled backdrop for special occasions including weddings and reunions, as well as meetings and conferences.";
     
     // create location for Boylston
     CLLocationCoordinate2D boylstonLocation;
     boylstonLocation.latitude = 42.37335960001366;
     boylstonLocation.longitude = -71.1172753572464;
     
     // create annotation for Boylston
     CustomAnnotation *boylston = [[CustomAnnotation alloc] initWithCoordinate:boylstonLocation];
     boylston.title = @"Boylston Hall";
     boylston.subtitle = @"Home to the Romance Languages Department. Built in 1859.";
     
     // create location for Widener
     CLLocationCoordinate2D widenerLocation;
     widenerLocation.latitude = 42.37347452878183;
     widenerLocation.longitude = -71.11648142337799;
     
     // create annotation for Widener
     CustomAnnotation *widener = [[CustomAnnotation alloc] initWithCoordinate:widenerLocation];
     widener.title = @"Widener Library";
     widener.subtitle = @"The Harry Elkins Widener Memorial Library, commonly known as Widener Library, is the primary building of the library system of Harvard University. Widener serves as the centerpiece of the 15.6 million-volume Harvard University Library system, the largest university library system in the world. ";
     
     // create location for Wadsworth
     CLLocationCoordinate2D wadLocation;
     wadLocation.latitude = 42.37335167388397;
     wadLocation.longitude = -71.11813366413116;
     
     // create annotation for Wadsworth
     CustomAnnotation *wad = [[CustomAnnotation alloc] initWithCoordinate:wadLocation];
     wad.title = @"Wadsworth Hall";
     wad.subtitle = @"Houses the headquarters of the Harvard Alumni Association and the university library system. ";
     
     // create location for Grays
     CLLocationCoordinate2D graysLocation;
     graysLocation.latitude = 42.37365286610913;
     graysLocation.longitude = -71.11781179904938;
     
     // create annotation for Grays
     CustomAnnotation *grays = [[CustomAnnotation alloc] initWithCoordinate:graysLocation];
     grays.title = @"Grays House";
     grays.subtitle = @"Grays Hall opened in Harvard Yard in 1863 and became Harvard College's first building with water taps in the basement. Residents of other buildings in Harvard Yard had to haul water from pumps in the Yard.Past residents include Norman Mailer, Harpoon Brewery co-founder Daniel Kenary, Natalie Portman, Frank Rich, Jeff Bingaman, Mo Rocca, Michael Weishan, and John Weidman.";
     
     // create location for Dudley
     CLLocationCoordinate2D dudleyLocation;
     dudleyLocation.latitude = 42.373609272586975;
     dudleyLocation.longitude = -71.11851453781128;
     
     // create annotation for Dudley
     CustomAnnotation *dudley = [[CustomAnnotation alloc] initWithCoordinate:dudleyLocation];
     dudley.title = @"Dudley House";
    dudley.subtitle = @"Dudley House is one of the thirteen undergraduate houses within Harvard College, serving the very few Harvard undergraduates not living in one of the other twelve (residential) houses; this includes student's living in the off-campus Dudley Co-ops.";
     
     // create location for Strauss
     CLLocationCoordinate2D straussLocation;
     straussLocation.latitude = 42.3741403188867;
     straussLocation.longitude = -71.11858427524567;
     
     // create annotation for Strauss
     CustomAnnotation *strauss = [[CustomAnnotation alloc] initWithCoordinate:straussLocation];
     strauss.title = @"Strauss House";
    strauss.subtitle = @"Straus Hall is one of the undergraduate dormitories. Three Harvard brothers built Straus Hall to commemorate their parents, Isidor Straus and Ida Straus, who died on the Titanic. Past residents include William S. Burroughs, David Souter, John Roberts, Phil Bredesen, Tom Ridge, Darren Aronofsky, Soledad O'Brien, Tim Wirth, Joseph Lelyveld and Mark Zuckerberg";    
     
     // create location for Matthews
     CLLocationCoordinate2D matthewsLocation;
     matthewsLocation.latitude = 42.37408879966625;
     matthewsLocation.longitude = -71.11815512180328;
     
     // create annotation for Matthews
     CustomAnnotation *matthews = [[CustomAnnotation alloc] initWithCoordinate:matthewsLocation];
     matthews.title = @"Matthews Hall";
     matthews.subtitle = @"Matthews Hall is one of the dormitories housing first-year students at Harvard College. It is located in the southwest portion of Harvard Yard. It was constructed in 1871 at a cost of $115,000. Past residents include Matt Damon, Robert Rubin, Chuck Schumer, Barney Frank, William Randolph Hearst, Mark Penn, and John Dos Passos.";
     
     // create location for Mass Hall
     CLLocationCoordinate2D masshallLocation;
     masshallLocation.latitude = 42.37444547032598;
     masshallLocation.longitude = -71.11830532550812;
     
     // create annotation for Mass Hall
     CustomAnnotation *masshall = [[CustomAnnotation alloc] initWithCoordinate:masshallLocation];
     masshall.title = @"Massachusets Hall";
     masshall.subtitle = @"Massachusetts Hall — The oldest surviving building at Harvard and the country’s oldest dormitory. The building has since been given various roles – as a refuge for American soldiers during the Siege of Boston, as well as an observatory. Today, it serves as office space for the most significant administrators at Harvard. "; 
     
     // create location for Weld
     CLLocationCoordinate2D weldLocation;
     weldLocation.latitude = 42.37393820477954;
     weldLocation.longitude = -71.1171144247055;
     
     // create annotation for Weld
     CustomAnnotation *weld = [[CustomAnnotation alloc] initWithCoordinate:weldLocation];

     weld.title = @"Weld House";
    weld.subtitle = @"Weld Hall, built in 1870, represented a new trend toward picturesque silhouettes that became important to American domestic architecture of the later nineteenth century. Past residents include John F. Kennedy, Michael Kinsley, Michael Crichton, Daniel Ellsberg, Christopher Durang, Douglas J. Feith, Neil H. McElroy, Ben Bernanke and Douglas Kenney.";

     
     // create location for University Hall
     CLLocationCoordinate2D univLocation;
     univLocation.latitude = 42.374441507329784;
     univLocation.longitude = -71.11706078052521;
     
     // create annotation for University Hall
     CustomAnnotation *univ = [[CustomAnnotation alloc] initWithCoordinate:univLocation];
     univ.title = @"University Hall";
     univ.subtitle = @"Designed by noted early American architect Charles Bulfinch, University Hall is now a National Historic Landmark. University Hall's first floor contained the College Commons (dining room) until 1849, now it is home to a host of Administrative departments";
     
     // create location for Harvard Hall
     CLLocationCoordinate2D hhallLocation;
     hhallLocation.latitude = 42.37484771313964;
     hhallLocation.longitude = -71.11818462610245;
     
     // create annotation for Harvard Hall
     CustomAnnotation *hhall = [[CustomAnnotation alloc] initWithCoordinate:hhallLocation];
     hhall.title = @"Harvard Hall";
     hhall.subtitle = @"The original Harvard Hall burned in 1764. The current building is home to several classrooms and lecture halls.";
     
     // create location for Lionel
     CLLocationCoordinate2D lionelLocation;
     lionelLocation.latitude = 42.37512313899895;
     lionelLocation.longitude = -71.11835896968842;
     
     // create annotation for Lionel
     CustomAnnotation *lionel = [[CustomAnnotation alloc] initWithCoordinate:lionelLocation];
     lionel.title = @"Lionel House";
     lionel.subtitle = @"Lionel Hall — Located in Harvard Yard, Mower Hall's twin. Tucked away in a corner of the Old Yard, Lionel, like Mower, is small, homey, and has fantastic rooms. Lionel Hall is a memorial to Lionel deJersey, the only relative of John Harvard to attend Harvard. Past residents include Peter Benchley, Erich Segal, Lou Dobbs, Grover Norquist.";
     
     // create location for Holden Chapel
     CLLocationCoordinate2D holdenLocation;
     holdenLocation.latitude = 42.37526580515624;
     holdenLocation.longitude = -71.11811220645905;
     
     // create annotation for Holden Chapel
     CustomAnnotation *holden = [[CustomAnnotation alloc] initWithCoordinate:holdenLocation];
     holden.title = @"Holden Chapel";
     holden.subtitle = @"Used for religious services and guest lectures";
     
     // create location for Mower
     CLLocationCoordinate2D mowerLocation;
     mowerLocation.latitude = 42.375471877922344;
     mowerLocation.longitude = -71.11824631690979;
     
     // create annotation for Mower
     CustomAnnotation *mower = [[CustomAnnotation alloc] initWithCoordinate:mowerLocation];
     mower.title = @"Mower Hall";
     mower.subtitle = @"Mower Hall — Located in Harvard Yard, Lionel Hall's twin. Mower has suites that house three or four freshmen, and all suites have bathrooms. Past residents include Al Gore, Tommy Lee Jones, Bob Somerby, Al Franken, Edward Gorey, Arthur Kopit, Mir Murtaza Bhutto, Thomas Oliphant, Timothy Crouse and Charles Murray.";
     
     // create location for PBHA
     CLLocationCoordinate2D pbhaLocation;
     pbhaLocation.latitude = 42.37564228373741;
     pbhaLocation.longitude = -71.11790835857391;
     
     // create annotation for PBHA
     CustomAnnotation *pbha = [[CustomAnnotation alloc] initWithCoordinate:pbhaLocation];
     pbha.title = @"Phillips Brooks House";
     pbha.subtitle = @"Phillips Brooks House Association (PBHA) is a student-run, staff supported public service/social action organization at Harvard College providing a variety of services to the Greater Boston community. PBHA programs effect social change through service and activism in partnership with local communities. Designed by Alexander Wadsworth Longfellow, Jr";
     
     // create location for Holworthy
     CLLocationCoordinate2D holworthyLocation;
     holworthyLocation.latitude = 42.37553132186386;
     holworthyLocation.longitude = -71.11723244190216;
     
     // create annotation for Holworthy
     CustomAnnotation *holworthy = [[CustomAnnotation alloc] initWithCoordinate:holworthyLocation];
     holworthy.title = @"Holworthy Hall";
     holworthy.subtitle = @"Holworthy was founded in 1812 and was named after Sir Matthew Holworthy, a wealthy merchant, who made what was at the time the largest donation to Harvard in the university's history. Holworthy is a first-year dormitory at Harvard College and is located in Harvard Yard. Past occupants have included Cornel West, Conan O'Brien, and Horatio Alger, Jr..";
     
     // create location for Thayer
     CLLocationCoordinate2D thayerLocation;
     thayerLocation.latitude = 42.375028028047396;
     thayerLocation.longitude = -71.11673355102539;
     
     // create annotation for Thayer
     CustomAnnotation *thayer = [[CustomAnnotation alloc] initWithCoordinate:thayerLocation];
     thayer.title = @"Thayer Hall";
     thayer.subtitle = @"Thayer Hall is one of the largest freshman dormitories on Harvard Yard. It was at times the home of American actor Jonathan Taylor Thomas and His Royal Highness Crown Prince Hamzah bin al Hussein of Jordan, as well as James Agee, Steve Ballmer, Andy Borowitz, and E. E. Cummings.";
     
     // create location for Memorial Church
     CLLocationCoordinate2D churchLocation;
     churchLocation.latitude = 42.37490517618842;
     churchLocation.longitude = -71.11606299877167;
     
     // create annotation for Memorial Church
     CustomAnnotation *church = [[CustomAnnotation alloc] initWithCoordinate:churchLocation];
     church.title = @"Memorial church";
    church.subtitle = @"The current Memorial Church was built in 1932 in honor of the men and women of Harvard University who died in World War I. The names of 373 alumni were engraved within alongside a sculpture named The Sacrifice by Malvina Hoffman. It was dedicated on Armistice Day on November 11, 1932.";
     
     // create location for Robinson
     CLLocationCoordinate2D robinsonLocation;
     robinsonLocation.latitude = 42.37470306454269;
     robinsonLocation.longitude = -71.11492574214935;
     
     // create annotation for Robinson
     CustomAnnotation *robinson = [[CustomAnnotation alloc] initWithCoordinate:robinsonLocation];
     robinson.title = @"Robinson ";
     robinson.subtitle = @"Home to multiple classrooms. Home to the history department";
     
     // create location for Sever
     CLLocationCoordinate2D severLocation;
     severLocation.latitude = 42.37437809935653;
     severLocation.longitude = -71.11552655696869;
     
     // create annotation for Sever
     CustomAnnotation *sever = [[CustomAnnotation alloc] initWithCoordinate:severLocation];
     sever.title = @"Sever Hall";
     sever.subtitle = @"Harvard's main class room building for non science classes. Sever Hall was built from 1878 to 1880 with a gift from Anne Sever in honor of her deceased husband, James Warren Sever. It is now a National Landmark";
     
     // create location for Emerson
     CLLocationCoordinate2D emersonLocation;
     emersonLocation.latitude = 42.373862907200746;
     emersonLocation.longitude = -71.11521005630493;
     
     // create annotation for Emerson
     CustomAnnotation *emerson = [[CustomAnnotation alloc] initWithCoordinate:emersonLocation];
     emerson.title = @"Emerson Hall";
     emerson.subtitle = @"Home to multiple classrooms. Home to the philosophy department";
    
    
    
    
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



- (void) viewDidAppear:(BOOL)animated 
{
	[super viewDidAppear:animated];
    
    // start the camera
    [_mapView.sm3dar startCamera];
    
    // bring back the status bar, make it solid black
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque animated:YES];
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
    
    // change pin color to purple
    pin.pinColor = MKPinAnnotationColorPurple;
    
    // animate pin drop
    // pin.animatesDrop = YES;
    
    // show information callout when tapped
    pin.canShowCallout = YES;
    
    return pin;
}


/*
 * Executes when user taps detail disclosure button in 2D map view. Shows a callout with information on location tapped.
 */

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    // annotation is a property of MKAnnotationView; using Marker class as the annotation
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Additional Details" 
                                                    message:((CustomAnnotation *)view.annotation).subtitle
                                                   delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil];
    [alert show];
}


/*
 * Defines an information callout to be displayed in 3D AR view
 */

- (void)arCallout:(NSString *)msg
{
    _mapView.calloutView.titleLabel.text = @"Additional Details";
    _mapView.calloutView.subtitleLabel.text = msg;
    _mapView.calloutView.disclosureButton= [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
}


/*
 * Executes when user taps a marker in 3D AR view. Fires a callout with information on location tapped.
 */

- (void) mapAnnotationView:(MKAnnotationView*)annotationView calloutAccessoryControlTapped:(UIControl*)control 
{
    [self arCallout:((CustomAnnotation *)annotationView.annotation).subtitle];
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