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
    
    // define starting point for map (i.e., Harvard Yard, since POIs are centered there)
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



/*
 * Load points of interest (POIs): buildings and other structures in Harvard Yard
 */

- (void) sm3darLoadPoints:(SM3DARController *)sm3dar
{ 
     // [self set3darLocation];
 
     // create location for Canaday
     CLLocationCoordinate2D canadayLocation;
     canadayLocation.latitude = 42.37520834243742;
     canadayLocation.longitude = -71.11585646867752;
     
     // create annotation for Canaday
     CustomAnnotation *canaday = [[CustomAnnotation alloc] initWithCoordinate:canadayLocation];
     canaday.title = @"Canaday Hall";
     canaday.subtitle = @"Completed in 1974, Canaday is the newest dormitory in Harvard Yard. Canaday's architecture can be traced back to its period of construction, which immediately followed the student takeover of University Hall in 1969. Fearing further student unrest, College administrators fireproofed Canaday and reconfigured it around stairwells to foil student organizing. Past residents include Paul Wylie, Sean Gullette, and Charles Lane.";
     
     // create location for Hollis
     CLLocationCoordinate2D hollisLocation;
     hollisLocation.latitude = 42.37500623176736;
     hollisLocation.longitude = -71.11784666776657;
     
     // create annotation for Hollis
     CustomAnnotation *hollis = [[CustomAnnotation alloc] initWithCoordinate:hollisLocation];
     hollis.title = @"Hollis Hall";
     hollis.subtitle = @"Built in 1763, Hollis is one of the oldest buildings at Harvard. It housed George Washington's troops during the revolution. Past residents include Ralph Waldo Emerson, Henry David Thoreau, John Updike, Charles Sumner, and Jim Cramer.";
     
     // create location for John Harvard statue
     CLLocationCoordinate2D statueLocation;
     statueLocation.latitude = 42.374473211292376;
     statueLocation.longitude = -71.11719220876694;
     
     // create annotation for John Harvard statue
     CustomAnnotation *statue = [[CustomAnnotation alloc] initWithCoordinate:statueLocation];
     statue.title = @"John Harvard statue";
     statue.subtitle = @"An English minister, John Harvard was not, as is often said, the founder of Harvard College. Rather, he was its first benefactor. The childless Harvard bequeathed £780, half of his monetary estate, in addition to his 400 volume personal library to what had been called the 'New College.' It was soon after renamed 'Harvard College.'";
     
     // create location for Stoughton
     CLLocationCoordinate2D stoughtonLocation;
     stoughtonLocation.latitude = 42.37538073043612;
     stoughtonLocation.longitude = -71.11772328615189;
     
     // create annotation for Stoughton
     CustomAnnotation *stoughton = [[CustomAnnotation alloc] initWithCoordinate:stoughtonLocation];
     stoughton.title = @"Stoughton Hall";
     stoughton.subtitle = @"Stoughton was built in 1805 and was the second building to be named Stoughton Hall at Harvard. The original Stoughton Hall was built in 1700 and funded by Massachusetts Lieutenant Governor William Stoughton, who also presided over the Salem witch trials. Like its twin Hollis, Stoughton houses freshmen in large single room doubles with common bathrooms. Past residents include Oliver Wendell Holmes, Sydney Schanberg, and Horatio Alger.";
     
     // create location for Middle Wigg
     CLLocationCoordinate2D wiggmidLocation;
     wiggmidLocation.latitude = 42.373066332548795;
     wiggmidLocation.longitude = -71.11716270446777;
     
     // create annotation for Middle Wigg
     CustomAnnotation *wiggmid = [[CustomAnnotation alloc] initWithCoordinate:wiggmidLocation];
     wiggmid.title = @"Wigglesworth Hall (Middle)";
     wiggmid.subtitle = @"Wigglesworth Hall is the second-largest of the dormitories housing first-year students at Harvard College. Constructed in 1931, its location was part of President Lowell's plan to enclose the Yard from the traffic of Harvard Square. The dorm is actually disconnected and consists of three buildings of which this is the mid-sized one. Past residents include Bill Gates, Ted Kennedy, Leonard Bernstein, and Jared Diamond.";
     
     // create location for Big Wigg
     CLLocationCoordinate2D wiggbigLocation;
     wiggbigLocation.latitude = 42.372830528661574;
     wiggbigLocation.longitude = -71.11622929573059;
     
     // create annotation for Big Wigg
     CustomAnnotation *wiggbig = [[CustomAnnotation alloc] initWithCoordinate:wiggbigLocation];
     wiggbig.title = @"Wigglesworth Hall (Big)";
     wiggbig.subtitle = @"BigWigg is the largest of Wigglesworth Hall's three buildings. Moving between entryways within the buildings requires going outdoors or going through Wigglesworth's common basement.";
     
     // create location for Small Wigg
     CLLocationCoordinate2D wiggsmallLocation;
     wiggsmallLocation.latitude = 42.37328430174117;
     wiggsmallLocation.longitude = -71.11783862113953;
     
     // create annotation for Small Wigg
     CustomAnnotation *wiggsmall = [[CustomAnnotation alloc] initWithCoordinate:wiggsmallLocation];
     wiggsmall.title = @"Wigglesworth Hall (Small)";
     wiggsmall.subtitle = @"Wigglet is the smallest of Wigglesworth Hall's three buildings. Interestingly enough, the entire dorm building tends to vibrate whenever the Red Line subway (T) passes by.";
     
     // create location for Lamont 
     CLLocationCoordinate2D lamontLocation;
     lamontLocation.latitude = 42.372777026816046;
     lamontLocation.longitude = -71.11549973487854;
     
     // create annotation for Lamont
     CustomAnnotation *lamont = [[CustomAnnotation alloc] initWithCoordinate:lamontLocation];
     lamont.title = @"Lamont Library";
     lamont.subtitle = @"Lamont is one of the primary buildings of the library system of Harvard University. It was the first library at Harvard designed primarily for undergraduate students at Harvard College, to relieve pressure in the main Widener Library. Opened in 1949 and named for its principal donor, Harvard alumnus Thomas W. Lamont, this library contains the main collections for the undergraduate curriculum in the humanities and social sciences.";
     
     // create location for Houghton
     CLLocationCoordinate2D houghtonLocation;
     houghtonLocation.latitude = 42.373197114155;
     houghtonLocation.longitude = -71.11595571041107;
     
     // create annotation for Houghton
     CustomAnnotation *houghton = [[CustomAnnotation alloc] initWithCoordinate:houghtonLocation];
     houghton.title = @"Houghton Library";
     houghton.subtitle = @"Houghton is the primary repository for rare books and manuscripts at Harvard University. This library holds collections of papers by Emily Dickinson, Henry Wadsworth Longfellow, Margaret Fuller, John Keats, Ralph Waldo Emerson and other notable transcendentalists, in addition to papers by Theodore Roosevelt, T.S. Eliot, E.E. Cummings, Henry James, William James, James Joyce, and John Updike, among many others.";
     
     // create location for Loeb
     CLLocationCoordinate2D loebLocation;
     loebLocation.latitude = 42.37349434406542;
     loebLocation.longitude = -71.11532270908356;
     
     // create annotation for Loeb
     CustomAnnotation *loeb = [[CustomAnnotation alloc] initWithCoordinate:loebLocation];
     loeb.title = @"Loeb House";
     loeb.subtitle = @"For many years the residence of Harvard presidents, Loeb House is today the home of Harvard’s Governing Boards and their administrative offices. The first floor is decorated in classic 19th century style and is often used for weddings, reunions, meetings, and conferences.";
     
     // create location for Boylston
     CLLocationCoordinate2D boylstonLocation;
     boylstonLocation.latitude = 42.37335960001366;
     boylstonLocation.longitude = -71.1172753572464;
     
     // create annotation for Boylston
     CustomAnnotation *boylston = [[CustomAnnotation alloc] initWithCoordinate:boylstonLocation];
     boylston.title = @"Boylston Hall";
     boylston.subtitle = @"Boylston was built in 1858 for $50,000. In 1871 it was remodelled to add the top two floors. Originally, chemistry was taught on the top floor. Chemistry lectures moved to the basement after a professor accidentally let molten iron escape from a crucible, which burned through all three wooden floors. In 1959, the building was renovated and now holds the classics and linguistics departments. This building would have been torn down in the 1950s if it hadn't been for Boylston family will, which stated that Harvard would only continue to receive significant donations as long as the walls of the hall stood.";
     
     // create location for Widener
     CLLocationCoordinate2D widenerLocation;
     widenerLocation.latitude = 42.37347452878183;
     widenerLocation.longitude = -71.11648142337799;
     
     // create annotation for Widener
     CustomAnnotation *widener = [[CustomAnnotation alloc] initWithCoordinate:widenerLocation];
     widener.title = @"Widener Library";
     widener.subtitle = @"The largest library at Harvard, Widener is the center of Harvard University Library system, the largest university library system in the world. In memory of her son, Harry, who died on the Titanic in 1912, Eleanor Elkins Widener donated $3.5 million for the creation of the library, which opened in 1915. Widener holds more than 5.7 million volumes on more than 50 miles of shelves. By the 1930s the library found itself filled to capacity, which led to the creation of smaller libraries to hold specialized collections.";
     
     // create location for Wadsworth
     CLLocationCoordinate2D wadLocation;
     wadLocation.latitude = 42.37335167388397;
     wadLocation.longitude = -71.11813366413116;
     
     // create annotation for Wadsworth
     CustomAnnotation *wad = [[CustomAnnotation alloc] initWithCoordinate:wadLocation];
     wad.title = @"Wadsworth Hall";
     wad.subtitle = @"Built in 1726 for the current president of Harvard, Benjamin Wadsworth, this house that shares his name is the second oldest building at Harvard.General George Washington set up his first headquarters in the house. It is said that the plans to oust King George from Boston took form in Wadsworth Parlor. Today, the building houses the offices of the University Marshal, Commencement, the University Library, and several professors.";
     
     // create location for Grays
     CLLocationCoordinate2D graysLocation;
     graysLocation.latitude = 42.37365286610913;
     graysLocation.longitude = -71.11781179904938;
     
     // create annotation for Grays
     CustomAnnotation *grays = [[CustomAnnotation alloc] initWithCoordinate:graysLocation];
     grays.title = @"Grays Hall";
     grays.subtitle = @"Grays opened in Harvard Yard in 1863 and became Harvard College's first building with water taps in the basement. Known as 'The Harvard Hilton,' Grays Hall is used as a dormitory for freshmen and boasts spacious common rooms, exposed brick walls, and a room for housing high-security freshmen. Past residents include Natalie Portman, Norman Mailer, and Mo Rocca.";
     
     // create location for Dudley
     CLLocationCoordinate2D dudleyLocation;
     dudleyLocation.latitude = 42.373609272586975;
     dudleyLocation.longitude = -71.11851453781128;
     
     // create annotation for Dudley
     CustomAnnotation *dudley = [[CustomAnnotation alloc] initWithCoordinate:dudleyLocation];
     dudley.title = @"Dudley House";
     dudley.subtitle = @"Established in 1935, Dudley was named after Thomas Dudley (1576-1653), the second governor of the Massachusetts Bay Colony. Dudley now serves as a house for nonresident and off-campus students. It also contains the Graduate School of Arts and Sciences (GSAS) Graduate Student Center.";
     
     // create location for Strauss
     CLLocationCoordinate2D straussLocation;
     straussLocation.latitude = 42.3741403188867;
     straussLocation.longitude = -71.11858427524567;
     
     // create annotation for Strauss
     CustomAnnotation *strauss = [[CustomAnnotation alloc] initWithCoordinate:straussLocation];
     strauss.title = @"Strauss Hall";
     strauss.subtitle = @"Straus was built in 1926 by three brothers in memory of their parents Isador and Ida Straus, New York department store entrepreneurs (Abraham and Straus) who had died on the Titanic. Like residences in many other Yard dormitories, all suites in Straus Hall have wood-burning living room fireplaces. Straus residents also enjoy a spacious common room, furnished with the leather chairs, oriental rugs, and mahogany panelling. Past residents include Mark Zuckerberg, William S. Burroughs, and John Roberts.";    
     
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
     masshall.subtitle = @"The oldest surviving building at Harvard and the country’s oldest dormitory, Mass Hall has been given various roles since its construction in 1718. It served as home to five founding fathers, a refuge for American soldiers during the Siege of Boston, and an observatory when Thomas Hollis donated a 24-foot telescope to the university in 1722. Today, it is used as office space for the most significant administrators at Harvard, including the President, as well as home to a handful of lucky freshmen."; 
     
     // create location for Weld
     CLLocationCoordinate2D weldLocation;
     weldLocation.latitude = 42.37393820477954;
     weldLocation.longitude = -71.1171144247055;
     
     // create annotation for Weld
     CustomAnnotation *weld = [[CustomAnnotation alloc] initWithCoordinate:weldLocation];

     weld.title = @"Weld Hall";
     weld.subtitle = @"Built in 1870, Weld was originally divided into North and South entryways. It is now one continuous building representative of the new trend toward picturesque silhouettes that became important to American domestic architecture of the later nineteenth century. Past residents include John F. Kennedy, Michael Kinsley, Michael Crichton, and Ben Bernanke.";
     
     // create location for University Hall
     CLLocationCoordinate2D univLocation;
     univLocation.latitude = 42.374441507329784;
     univLocation.longitude = -71.11706078052521;
     
     // create annotation for University Hall
     CustomAnnotation *univ = [[CustomAnnotation alloc] initWithCoordinate:univLocation];
     univ.title = @"University Hall";
     univ.subtitle = @"Built in 1815, University Hall contained the Commons Dining Room until 1849. It is built out of white granite cut at the Charlestown Prison, making it Harvard's first stone building. The building also held a library and a chapel, but over the years all have been repartitioned into classrooms. The building also holds the administrative offices of the Faculty of Arts and Sciences. In 1884, Daniel Chester French's statue of John Harvard was placed in front of the western facade of the building.";
     
     // create location for Harvard Hall
     CLLocationCoordinate2D hhallLocation;
     hhallLocation.latitude = 42.37484771313964;
     hhallLocation.longitude = -71.11818462610245;
     
     // create annotation for Harvard Hall
     CustomAnnotation *hhall = [[CustomAnnotation alloc] initWithCoordinate:hhallLocation];
     hhall.title = @"Harvard Hall";
     hhall.subtitle = @"Harvard Hall was built in Harvard Yard between 1672 and 1682 and lasted for nearly a century before being destroyed by a fire. The hall had housed the college library and a collection of books donated by John Harvard (who the college and hall were named after). All but one of the books were consumed by the fire. Not giving up on the name or location, the university built another Harvard Hall in the same location in 1766. The building has since undergone massive additions, including the addition of a central pavilion in 1842 and wings on either side in 1870. Today, the building holds classrooms and several lecture halls.";
     
     // create location for Lionel
     CLLocationCoordinate2D lionelLocation;
     lionelLocation.latitude = 42.37512313899895;
     lionelLocation.longitude = -71.11835896968842;
     
     // create annotation for Lionel
     CustomAnnotation *lionel = [[CustomAnnotation alloc] initWithCoordinate:lionelLocation];
     lionel.title = @"Lionel Hall";
     lionel.subtitle = @"Located in Harvard Yard, Lionel is Mower's twin. Lionel Hall is a memorial to Lionel deJersey, the only relative of John Harvard to attend Harvard. Like Mower, Lionel has suites that house three or four freshmen. Past residents include Peter Benchley, Erich Segal, Lou Dobbs, and Grover Norquist.";
     
     // create location for Holden Chapel
     CLLocationCoordinate2D holdenLocation;
     holdenLocation.latitude = 42.37526580515624;
     holdenLocation.longitude = -71.11811220645905;
     
     // create annotation for Holden Chapel
     CustomAnnotation *holden = [[CustomAnnotation alloc] initWithCoordinate:holdenLocation];
     holden.title = @"Holden Chapel";
     holden.subtitle = @"Built in 1744, Holden Chapel is the third oldest building at Harvard University. Recognizable by its blue roof facade and small size, the building was built for Mrs. Samuel Holden, widow of a former governor of the Bank of England who offered 400 pounds sterling for the construction of a chapel on the campus. Throughout the 1900s, the chapel was home to the Harvard Glee Club, followed by the Radcliffe Choral Society and the Harvard-Radcliffe Collegium Musicum (the Holden Choir), the latter of which still rehearses here.";
     
     // create location for Mower
     CLLocationCoordinate2D mowerLocation;
     mowerLocation.latitude = 42.375471877922344;
     mowerLocation.longitude = -71.11824631690979;
     
     // create annotation for Mower
     CustomAnnotation *mower = [[CustomAnnotation alloc] initWithCoordinate:mowerLocation];
     mower.title = @"Mower Hall";
     mower.subtitle = @"Mower is Lionel's twin. It has suites that house three or four freshmen. Past residents include Al Gore, Tommy Lee Jones, and Al Franken.";
     
     // create location for PBHA
     CLLocationCoordinate2D pbhaLocation;
     pbhaLocation.latitude = 42.37564228373741;
     pbhaLocation.longitude = -71.11790835857391;
     
     // create annotation for PBHA
     CustomAnnotation *pbha = [[CustomAnnotation alloc] initWithCoordinate:pbhaLocation];
     pbha.title = @"Phillips Brooks House Association";
     pbha.subtitle = @"PBHA is a student-run, staff supported public service and social action organization at Harvard College. It tasks itself with providing a variety of services to the Greater Boston community. PBHA programs effect social change through service and activism in partnership with local communities. PBHA alumni include Justice David Souter, ACLU founder Roger Nash Baldwin, President Franklin Delano Roosevelt, and Massachusetts Governor Deval Patrick.";
     
     // create location for Holworthy
     CLLocationCoordinate2D holworthyLocation;
     holworthyLocation.latitude = 42.37553132186386;
     holworthyLocation.longitude = -71.11723244190216;
     
     // create annotation for Holworthy
     CustomAnnotation *holworthy = [[CustomAnnotation alloc] initWithCoordinate:holworthyLocation];
     holworthy.title = @"Holworthy Hall";
     holworthy.subtitle = @"Holworthy was founded in 1812 and named after Sir Matthew Holworthy, a wealthy merchant who made what was at the time the largest donation to Harvard in the university's history. Past occupants included Cornel West, Conan O'Brien, and Horatio Alger, Jr..";
     
     // create location for Thayer
     CLLocationCoordinate2D thayerLocation;
     thayerLocation.latitude = 42.375028028047396;
     thayerLocation.longitude = -71.11673355102539;
     
     // create annotation for Thayer
     CustomAnnotation *thayer = [[CustomAnnotation alloc] initWithCoordinate:thayerLocation];
     thayer.title = @"Thayer Hall";
     thayer.subtitle = @"Thayer was built in 1870 and originally offered housing to students who had trouble affording the ever-increasing prices of housing outside the university. It now serves as housing for first-years. Past residents include E. E. Cummings, His Royal Highness Crown Prince Hamzah bin al Hussein of Jordan, Steve Ballmer, Arthur Schlesinger Jr., Walter Isaacson.";
     
     // create location for Memorial Church
     CLLocationCoordinate2D churchLocation;
     churchLocation.latitude = 42.37490517618842;
     churchLocation.longitude = -71.11606299877167;
     
     // create annotation for Memorial Church
     CustomAnnotation *church = [[CustomAnnotation alloc] initWithCoordinate:churchLocation];
     church.title = @"Memorial Church";
     church.subtitle = @"University President Abbott Lawrence Lowell decided to build Memorial Church in 1931 as a place of worship as well as a memorial to the 373 Harvard men and women who died in the World War I. Since then, memorials to Harvard alumni who have died in WWII, the Korean War, and the Vietnam War have been added to the chapel.";
     
     // create location for Robinson
     CLLocationCoordinate2D robinsonLocation;
     robinsonLocation.latitude = 42.37470306454269;
     robinsonLocation.longitude = -71.11492574214935;
     
     // create annotation for Robinson
     CustomAnnotation *robinson = [[CustomAnnotation alloc] initWithCoordinate:robinsonLocation];
     robinson.title = @"Robinson Hall";
     robinson.subtitle = @"Completed in 1904 to house the Harvard architecture department, Robinson held the Harvard Graduate School of Design before the construction of Grund Hall in 1972. It now houses the History department.";
     
     // create location for Sever
     CLLocationCoordinate2D severLocation;
     severLocation.latitude = 42.37437809935653;
     severLocation.longitude = -71.11552655696869;
     
     // create annotation for Sever
     CustomAnnotation *sever = [[CustomAnnotation alloc] initWithCoordinate:severLocation];
     sever.title = @"Sever Hall";
     sever.subtitle = @"Sever Hall, built between 1878 and 1880, houses general-purpose small classrooms and larger lecture halls. The building was constructed with 1.3 million red bricks and is known for the elaborate carvings on its brick facade. The exterior facades used more than 100,000 red bricks composed of 60 different varieties. This style is now known as the Richardsonian Romanesque style.";
     
     // create location for Emerson
     CLLocationCoordinate2D emersonLocation;
     emersonLocation.latitude = 42.373862907200746;
     emersonLocation.longitude = -71.11521005630493;
     
     // create annotation for Emerson
     CustomAnnotation *emerson = [[CustomAnnotation alloc] initWithCoordinate:emersonLocation];
     emerson.title = @"Emerson Hall";
     emerson.subtitle = @"Emerson Hall, built in 1905 and named after Ralph Waldo Emerson, is home to the Philosphophy department. Note the inscription over the entrance. This is where William James taught while at Harvard.";
    
    // create location for Memorial Hall
    CLLocationCoordinate2D memHallLocation;
    memHallLocation.latitude = 42.34745959791106;
    memHallLocation.longitude = -71.08250856399536;
    
    // create annotation for Memorial Hall
    CustomAnnotation *memHall = [[CustomAnnotation alloc] initWithCoordinate:memHallLocation];
    memHall.title = @"Prudential Center";
    memHall.subtitle = @"The Top of the Hub Restaurant is located at the top of this building.";
    
    
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
    [self.mapView addAnnotation:memHall];
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
 * Defines an information callout to be displayed in 3D AR view
 */

- (void)arCallout:(NSString *)msg
{
    // annotation is a property of MKAnnotationView; using Marker class as the annotation
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Additional Details" 
                                                    message:msg
                                                   delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil];
    [alert show];
}



/*
 * Executes when user taps detail disclosure button in 2D map view. Shows a callout with information on location tapped.
 */

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    [self arCallout:((CustomAnnotation *)view.annotation).subtitle];
}



/*
 * Executes when user changes focus point (i.e., moves camera). Reports to the console, sets callout text.
 */

- (void) sm3dar:(SM3DARController *)sm3dar didChangeFocusToPOI:(SM3DARPoint*)newPOI fromPOI:(SM3DARPoint*)oldPOI {
    NSLog(@"didChangeFocusToPOI");
    sm3dar.focusView.content.text = @"foobar";
    
    [sm3dar.focusView addSubview:[UIButton buttonWithType:UIButtonTypeDetailDisclosure]];
}



/*
 * Executes when user taps focus point.
 */

- (void) sm3dar:(SM3DARController *)sm3dar didChangeSelectionToPOI:(SM3DARPoint*)newPOI fromPOI:(SM3DARPoint*)oldPOI {
    sm3dar.focusView.content.text = @"foobar";
    
    NSLog(@"didChangeSelectionToPOI");
}



/*
 * Executes when user taps a marker in 3D AR view. Fires a callout with information on location tapped. <-- not responding
 */

- (void) mapAnnotationView:(MKAnnotationView*)annotationView calloutAccessoryControlTapped:(UIControl*)control 
{
    NSLog(@"calloutAccessoryControlTapped");
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