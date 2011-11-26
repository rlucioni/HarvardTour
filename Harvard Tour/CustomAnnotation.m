/**
 *  Marker.m
 *  Section3App3
 *  Tommy MacWilliam, 2011
 *
 */

#import "CustomAnnotation.h"

@implementation CustomAnnotation

@synthesize coordinate=_coordinate, title=_title, subtitle=_subtitle;

/**
 * Create a new annotation from a given coordinate
 *
 */
- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate 
{
    self = [super init];
    
    if (self != nil) {
        self.coordinate = coordinate;
    }
    
    return self;
}

- (void)dealloc
{
    // release properties
    self.title = nil;
    self.subtitle = nil;
    
    [super dealloc];
}

@end
