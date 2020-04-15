//
//  ViewController.m
//  ex1.1
//
//  Created by Desenvolvedor Mobits on 23/03/20.
//  Copyright © 2020 Desenvolvedor Mobits. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *lab1;
@property (weak, nonatomic) IBOutlet UITextField *textf;
@property (weak, nonatomic) IBOutlet UIButton *tocouBotaoEnviar;
@property (weak, nonatomic) IBOutlet UILabel *lab2;
- (IBAction)tocouBackground:(id)sender;

@end

@implementation ViewController

@synthesize textf,lab1,lab2;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)tocouBotaoEnviar:(id)sender {
    
    NSString * input = textf.text;
    
    lab2.text = input;
    [textf resignFirstResponder];
    
    //NSLog(@"%lu", (unsigned long)[textf.text length]);
    //NSString * auxiliar = textf.text;
    
    /*if ([[auxiliar stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] != 0){
        
        UIAlertController* alert = [UIAlertController
                                    alertControllerWithTitle:@"Texto digitado:"
                                    message: textf.text
                                    preferredStyle:UIAlertControllerStyleAlert];
         
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
           handler:^(UIAlertAction * action) {
            //self->lab.text = @"Concluido";
        }];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }*/
}
- (IBAction)tocouBackground:(id)sender {
    
    [self.view endEditing:YES];
    
}
@end
