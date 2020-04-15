//
//  PageViewController.m
//  EX3 2
//
//  Created by Desenvolvedor Mobits on 03/04/20.
//  Copyright © 2020 Desenvolvedor Mobits. All rights reserved.
//

#import "PageViewController.h"

@interface PageViewController ()

@property (weak, nonatomic) IBOutlet WKWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadSymbol;

@end

@implementation PageViewController

- (void) webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    [self.webView setHidden:false];
    [self.loadSymbol stopAnimating];
    
}

- (void) viewWillAppear:(BOOL)animated{
    [self.webView setUIDelegate:(id)self];
    [self.webView setNavigationDelegate:(id)self];
    [self.loadSymbol startAnimating];
    [self.webView setHidden:true];
    [self.webView loadRequest:[NSURLRequest requestWithURL:self.url]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
