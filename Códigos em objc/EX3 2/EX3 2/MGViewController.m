//
//  MGViewController.m
//  EX3 2
//
//  Created by Desenvolvedor Mobits on 06/04/20.
//  Copyright © 2020 Desenvolvedor Mobits. All rights reserved.
//

#import "MGViewController.h"

@implementation MGViewController

- (NSArray *)siteDosTimes{
    
    return [NSArray arrayWithObjects:
                     [NSURL URLWithString:@"https://pt.wikipedia.org/wiki/Clube_Atl%C3%A9tico_Mineiro"],
                     [NSURL URLWithString:@"https://pt.wikipedia.org/wiki/Cruzeiro_Esporte_Clube"],
                      nil];
}

@end
