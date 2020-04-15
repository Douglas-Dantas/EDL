//
//  ViewController.m
//  EX4
//
//  Created by Desenvolvedor Mobits on 06/04/20.
//  Copyright © 2020 Desenvolvedor Mobits. All rights reserved.
//

#import "ViewController.h"
#import "MapViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSDictionary *mainDictionary;
@property (nonatomic) NSArray *regioes;
@property (nonatomic) id value;
@property (nonatomic) NSInteger i;

@end

@implementation ViewController

 - (void) viewDidLoad {
     [super viewDidLoad];
     self.tableView.dataSource = self;
     self.tableView.delegate = self;
     
     NSString *path = [[NSBundle mainBundle] pathForResource:@"cities" ofType:@"plist"];
     self.mainDictionary = [NSDictionary dictionaryWithContentsOfFile:path];
     self.regioes = self.mainDictionary.allKeys;
     
     NSLog(@"%@", _mainDictionary.allValues);
 }

#pragma mark Navigation

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    MapViewController *mapViewController = [segue destinationViewController];
    NSIndexPath * index = (NSIndexPath *)sender;
    
    NSString *regiao = self.regioes[index.section];
    NSDictionary * dicCidade = self.mainDictionary[regiao][index.row];
    
    mapViewController.cidade = [dicCidade valueForKey:@"nome"];
    mapViewController.latitude = [dicCidade valueForKey:@"latitude"];
    mapViewController.longitude = [dicCidade valueForKey:@"longitude"];
    
}

#pragma mark - UITableViewDelegate

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"MapOpener" sender:indexPath];
}


 #pragma mark - UITableViewDataSource

 - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
     return [[self.mainDictionary[self.regioes[section]] valueForKey:@"nome"] count];
 }

 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     
     static NSString *cellid = @"MyCell";
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid ];
     
     NSString *regiao = self.regioes[indexPath.section];
     NSDictionary *dicCidade = self.mainDictionary[regiao][indexPath.row];
     
     cell.textLabel.text = [dicCidade valueForKey:@"nome"];
     cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ %@", [dicCidade valueForKey:@"latitude"], [dicCidade valueForKey:@"longitude"]];
     return cell;
 }

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.regioes count];
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [self.regioes objectAtIndex:section];
}

@end
    
