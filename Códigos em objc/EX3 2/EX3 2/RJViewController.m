//
//  RJViewController.m
//  EX3 2
//
//  Created by Desenvolvedor Mobits on 02/04/20.
//  Copyright © 2020 Desenvolvedor Mobits. All rights reserved.
//

#import "RJViewController.h"
#import "PageViewController.h"

@implementation RJViewController

- (NSArray *)siteDosTimes{
    
    return [NSArray arrayWithObjects:
                     [NSURL URLWithString:@"https://pt.wikipedia.org/wiki/Clube_de_Regatas_do_Flamengo"],
                     [NSURL URLWithString:@"https://pt.wikipedia.org/wiki/Botafogo_de_Futebol_e_Regatas"],
                     [NSURL URLWithString:@"https://pt.wikipedia.org/wiki/Club_de_Regatas_Vasco_da_Gama"],
                     [NSURL URLWithString:@"https://pt.wikipedia.org/wiki/Fluminense_Football_Club"],
                      nil];
}

@end
