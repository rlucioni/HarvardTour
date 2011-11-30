//
//  HTourViewController.h
//  Harvard Tour
//
//  Created by Renzo Lucioni on 11/25/11.
//

#import <UIKit/UIKit.h>
#import "MapKit/MapKit.h"
#import "SM3DAR.h"

@interface HTourViewController : UIViewController <SM3DARDelegate> 
{
    SM3DARMapView *_mapView;
}

@property (nonatomic, retain) IBOutlet SM3DARMapView *mapView;

@end
