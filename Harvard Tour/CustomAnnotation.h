//
//  CustomAnnotation.h
//  Harvard Tour
//
//  Created by Renzo Lucioni on 11/25/11.
//

#import <Foundation/Foundation.h>
#import "MapKit/Mapkit.h"

@interface CustomAnnotation : NSObject <MKAnnotation> {
    CLLocationCoordinate2D _coordinate;
    NSString *_title;
    NSString *_subtitle;   
}

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

// inheritance issues?
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *subtitle;

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate;

@end
