//
//  WebViewController.m
//  EX3 2
//
//  Created by Desenvolvedor Mobits on 03/04/20.
//  Copyright © 2020 Desenvolvedor Mobits. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@property (weak, nonatomic) IBOutlet WKWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadSymbol;

@end

@implementation WebViewController

- (void) webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    [self.loadSymbol stopAnimating];
    [self.webView setHidden:false];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.webView setNavigationDelegate:(id)self];
    [self.webView setUIDelegate:(id)self];
    [self.loadSymbol startAnimating];
    [self.webView setHidden:true];
    [self.webView loadRequest:[NSURLRequest requestWithURL:self.siteAddress]];
}



@end
