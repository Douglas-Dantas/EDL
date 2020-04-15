//
//  EstadosViewController.m
//  EX3 2
//
//  Created by Desenvolvedor Mobits on 02/04/20.
//  Copyright © 2020 Desenvolvedor Mobits. All rights reserved.
//

#import "EstadosViewController.h"
#import "PageViewController.h"

@interface EstadosViewController ()

@end

@implementation EstadosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSArray *) siteDosTimes{
    return nil;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton*)sender {
    
    NSInteger index = sender.tag;
    
    PageViewController *pageViewController = [segue destinationViewController];
    
    pageViewController.url = [self siteDosTimes][index];
    
}


@end
