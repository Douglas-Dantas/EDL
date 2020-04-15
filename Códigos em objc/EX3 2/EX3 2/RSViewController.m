//
//  RSViewController.m
//  EX3 2
//
//  Created by Desenvolvedor Mobits on 06/04/20.
//  Copyright © 2020 Desenvolvedor Mobits. All rights reserved.
//

#import "RSViewController.h"

@implementation RSViewController

- (NSArray *)siteDosTimes{
    
    return [NSArray arrayWithObjects:
                     [NSURL URLWithString:@"https://pt.wikipedia.org/wiki/Gr%C3%AAmio_Foot-Ball_Porto_Alegrense"],
                     [NSURL URLWithString:@"https://pt.wikipedia.org/wiki/Sport_Club_Internacional"],
                      nil];
}

@end
