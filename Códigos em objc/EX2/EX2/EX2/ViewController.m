//
//  ViewController.m
//  EX2
//
//  Created by Desenvolvedor Mobits on 24/03/20.
//  Copyright © 2020 Desenvolvedor Mobits. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

typedef enum: NSInteger {
    ptbr, enus
}language;

- (IBAction)tocouBotaoConfirmarIdioma:(id)sender;
- (IBAction)tocouBotaoLinguagem:(id)sender;
- (IBAction)segmentedControlValueChange:(id)sender;
- (IBAction)tocouBotaoCancelar:(id)sender;


@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet WKWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadSymbol;
@property (weak, nonatomic) IBOutlet UIButton *botaoLinguagem;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cstrTop;
@property (weak, nonatomic) IBOutlet UIView *myView;
@property (strong, nonatomic) IBOutlet UIView *mySuperView;
@property (nonatomic) UITapGestureRecognizer* tapAnyware;

@property (nonatomic) NSArray * locale;
@property (nonatomic) NSMutableArray * siteTimes;
@property (nonatomic) language currentLocale;

@end

@implementation ViewController

#pragma mark UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.webView setUIDelegate:(id)self];
    [self.webView setNavigationDelegate:(id)self];
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    
    self.currentLocale = ptbr;
    self.locale = @[@"Português-BR", @"English"];
    
    self.siteTimes = [[NSMutableArray alloc] initWithCapacity:2];
    [self.siteTimes insertObject:[NSMutableArray arrayWithArray:@[@"https://pt.wikipedia.org/wiki/Clube_de_Regatas_do_Flamengo", @"https://pt.wikipedia.org/wiki/Club_de_Regatas_Vasco_da_Gama", @"https://pt.wikipedia.org/wiki/Fluminense_Football_Club"]] atIndex:0];
    [self.siteTimes insertObject:[NSMutableArray arrayWithArray:@[@"https://en.wikipedia.org/wiki/Clube_de_Regatas_do_Flamengo", @"https://en.wikipedia.org/wiki/Club_de_Regatas_Vasco_da_Gama", @"https://en.wikipedia.org/wiki/Fluminense_Football_Club"]] atIndex:1];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.siteTimes[self.currentLocale][0]]]];
    
}

#pragma mark WKWebView

- (void)webView:(WKWebView *)webView didFinishNavigation:( WKNavigation *)navigation{
    [self.loadSymbol stopAnimating];
    [self.webView setHidden:false];
}

#pragma mark UISegmentedControl

- (IBAction)segmentedControlValueChange:(UISegmentedControl*)sender {
    NSInteger index = sender.selectedSegmentIndex;
    [self.webView stopLoading];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.siteTimes[self.currentLocale][index]]]];
    
    [self.webView setHidden:true];
    [self.loadSymbol startAnimating];
}

#pragma mark UIPickerViewDelegate

- (NSInteger)numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.locale count];
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return self.locale[row];
}

#pragma mark screen events
- (IBAction)tocouBotaoLinguagem:(id)sender {
    [self.mySuperView layoutIfNeeded];
    [UIView animateWithDuration:0.6
                    animations:^{
        self.cstrTop.priority = UILayoutPriorityDefaultHigh;
        [self.mySuperView layoutIfNeeded];
    
   }];
        }

- (IBAction)tocouBotaoConfirmarIdioma:(id)sender {
    
    if (self.currentLocale != [self.pickerView selectedRowInComponent:0]){

        [self.loadSymbol startAnimating];
        [self.webView setHidden:true];
        
        self.currentLocale = [self.pickerView selectedRowInComponent:0];
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.siteTimes[self.currentLocale][self.segmentedControl.selectedSegmentIndex]]]];
        
    }
    
    if (_currentLocale == ptbr) [self.botaoLinguagem setTitle:@"ptBR" forState:UIControlStateNormal];
    else [self.botaoLinguagem setTitle:@"enUS" forState:UIControlStateNormal];
    
        [self.mySuperView layoutIfNeeded];
    [UIView animateWithDuration:0.6
                      animations:^{
        self.cstrTop.priority = UILayoutPriorityDefaultLow;
        [self.mySuperView layoutIfNeeded];
        
    }];
}

- (IBAction)tocouBotaoCancelar:(id)sender {
    [self.mySuperView layoutIfNeeded];
    [UIView animateWithDuration:0.6
                      animations:^{
        self.cstrTop.priority = UILayoutPriorityDefaultLow;
        [self.mySuperView layoutIfNeeded];
    }];
}

@end
     
