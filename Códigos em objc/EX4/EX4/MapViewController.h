//
//  MapViewController.h
//  EX4
//
//  Created by Desenvolvedor Mobits on 07/04/20.
//  Copyright © 2020 Desenvolvedor Mobits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
NS_ASSUME_NONNULL_BEGIN

@interface MapViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>

@property (nonatomic) NSString *cidade;
@property (nonatomic) NSNumber *latitude;
@property (nonatomic) NSNumber *longitude;

@end

NS_ASSUME_NONNULL_END
