//
//  HTourViewController.h
//  Harvard Tour
//
//  Created by Renzo Lucioni on 11/25/11.
//

#import <UIKit/UIKit.h>
#import "MapKit/MapKit.h"
#import "SM3DAR.h"

@interface HTourViewController : UIViewController <SM3DARDelegate, CLLocationManagerDelegate> 
{
    SM3DARMapView *_mapView;
    
    CLLocationManager *_locationManager;
}


// declare properties mapView and locationManager
@property (nonatomic, retain) IBOutlet SM3DARMapView *mapView;
@property (nonatomic, retain) IBOutlet CLLocationManager *locationManager;

@end
