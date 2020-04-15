//
//  MapViewController.m
//  EX4
//
//  Created by Desenvolvedor Mobits on 07/04/20.
//  Copyright © 2020 Desenvolvedor Mobits. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

- (IBAction)tocouLocalizacaoAtual:(id)sender;
- (IBAction)tocouStepper:(id)sender;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIStepper *stepper;
@property (nonatomic) CLLocationManager *locationManager;
@property (nonatomic) CLLocation *currentLocation;
@property (nonatomic) MKCoordinateRegion ultimaRegiao;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mapView.showsUserLocation = true;
    self.mapView.mapType = MKMapTypeStandard;
    self.mapView.delegate = self;
    
    [self mapaEmLatitude: [self.latitude doubleValue] eLongitude: [self.longitude doubleValue] comNome:self.cidade usandoPin:true];
    
    self.stepper.minimumValue = 1;
    self.stepper.maximumValue = 28;
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    self.currentLocation = [locations lastObject];
}

#pragma mark - screen events

- (IBAction)tocouLocalizacaoAtual:(id)sender {
    if ( [CLLocationManager locationServicesEnabled] ) {
        if (self.locationManager == nil) {
            self.locationManager = [[CLLocationManager alloc] init];
            self.locationManager.delegate = self;
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
            self.locationManager.distanceFilter = kCLDistanceFilterNone;
        }
        [self.locationManager startUpdatingLocation];
    }
    [self mapaEmLatitude:self.locationManager.location.coordinate.latitude
              eLongitude:self.locationManager.location.coordinate.longitude
                 comNome:@"Você está aqui!"
               usandoPin:true];
}

- (IBAction)tocouStepper:(id)sender {
    double zoomValue = 0.0;
    
    if (self.stepper.value < 10) {
        zoomValue += (self.stepper.value / 500);
    }else{
        zoomValue += (self.stepper.value / 500) * pow(self.stepper.value - 9, 2.0);
    }
    
    NSLog(@"%f",self.stepper.value);
    NSLog(@"%f",zoomValue);
    
    MKCoordinateRegion region = self.ultimaRegiao;
    MKCoordinateSpan span;
    span.latitudeDelta = zoomValue;
    span.longitudeDelta = zoomValue;
    region.span = span;
    self.ultimaRegiao = region;
       
    [self.mapView setRegion:self.ultimaRegiao];
    
}


#pragma mark - Private

-(void) mapaEmLatitude: (double)latitude eLongitude: (double)longitude comNome: (NSString *)cidade usandoPin: (bool)boolean{
    
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.latitudeDelta = 0.002;
    span.longitudeDelta = 0.002;
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = latitude ;
    zoomLocation.longitude = longitude;
    region.span = span;
    region.center = zoomLocation;
    
    self.ultimaRegiao = region;
    
    [self.mapView setRegion:region animated:true];
    
    if (boolean) {
        MKPointAnnotation *pin = [[MKPointAnnotation alloc] init];
        [pin setCoordinate:zoomLocation];
        [pin setTitle:cidade];
        [pin setSubtitle:[NSString stringWithFormat:@"%f %f", latitude, longitude]];
        [self.mapView addAnnotation:pin];
    }
    
}
@end
