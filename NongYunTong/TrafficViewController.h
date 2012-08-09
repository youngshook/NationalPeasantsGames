//
//  TrafficViewController.h
//  NongYunTong
//
//  Created by YoungShook on 12-5-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <QuartzCore/QuartzCore.h>
#import <Foundation/NSJSONSerialization.h>
#import <MapKit/MapKit.h>
#import "ASIHTTPRequest.h"

@interface TrafficViewController : UIViewController<CLLocationManagerDelegate,MKMapViewDelegate,UIAlertViewDelegate>
{
    CLLocation *current;
    MKMapView *_mapView;
    CLLocationCoordinate2D userCoor;
    
    
    UIImageView *route_view;
    NSArray *routes;
    UIColor *line_color;
    
    ASIHTTPRequest *request;
    CLGeocoder *geo;
    CLLocationManager *location;
    MKPointAnnotation *pointAnnotation;
}
@property (strong,nonatomic)ASIHTTPRequest *request;
@end