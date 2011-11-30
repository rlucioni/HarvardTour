//
//  CustomAnnotation.m
//  Harvard Tour
//
//  Created by Renzo Lucioni on 11/25/11.
//

#import "CustomAnnotation.h"

@implementation CustomAnnotation

@synthesize coordinate=_coordinate, title=_title, subtitle=_subtitle;


/*
 * Create a new annotation from a given coordinate
 */

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate 
{
    self = [super init];
    
    if (self != nil)
    {
        self.coordinate = coordinate;
    }
    
    return self;
}

@end