//
//  SPViewController.m
//  EX3 2
//
//  Created by Desenvolvedor Mobits on 06/04/20.
//  Copyright © 2020 Desenvolvedor Mobits. All rights reserved.
//

#import "SPViewController.h"
#import "PageViewController.h"

@implementation SPViewController

- (NSArray *)siteDosTimes{
    
    return [NSArray arrayWithObjects:
                     [NSURL URLWithString:@"https://pt.wikipedia.org/wiki/Sport_Club_Corinthians_Paulista"],
                     [NSURL URLWithString:@"https://pt.wikipedia.org/wiki/Sociedade_Esportiva_Palmeiras"],
                     [NSURL URLWithString:@"https://pt.wikipedia.org/wiki/Santos_Futebol_Clube"],
                     [NSURL URLWithString:@"https://pt.wikipedia.org/wiki/S%C3%A3o_Paulo_Futebol_Clube"],
                      nil];
}

@end
