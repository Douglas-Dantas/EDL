//
//  PageViewController.h
//  EX3 2
//
//  Created by Desenvolvedor Mobits on 03/04/20.
//  Copyright © 2020 Desenvolvedor Mobits. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PageViewController : UIViewController <WKUIDelegate, WKNavigationDelegate>

@property (nonatomic) NSURL *url;

@end

NS_ASSUME_NONNULL_END
