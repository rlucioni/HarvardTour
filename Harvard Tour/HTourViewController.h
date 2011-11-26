//
//  HTourViewController.h
//  Harvard Tour
//
//  Created by Renzo Lucioni on 11/25/11.
//

#import <UIKit/UIKit.h>
#import "MapKit/MapKit.h"

@interface HTourViewController : UIViewController <MKMapViewDelegate> {
    MKMapView *_mapView;
}

@property (nonatomic, retain) IBOutlet MKMapView *mapView;

@end
