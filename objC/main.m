#import <Foundation/Foundation.h>
#import "Person.h"

int main (int argc, const char * argv[]){

    @autoreleasepool {
        NSLog(@"Hello, World!");

        //Person *person = [[Person alloc] init]; // aloca e inicializa a classe person.

        person *person = [Person new]; // versao mais enxuta.

        Person douglas = [[Person alloc]initWithFirstName: @"Douglas" lastName: @"Dantas" age:65];
        
        //NSInteger = douglas->age; ultrapassado

        NSInteger age = douglas.age;

        douglas.age = 20;

        NSlog(@"%@", [douglas fullName]); // square brackets means im getting an instance method DUVIDA
        // full name on the douglas instance of the person class 

        Person * kaianSantos = [Person constructPersonFromDictionary:@{
                                                @"firstName":@"Kaian",
                                                @"lastName":@"Santos",
                                                @"age":@(65)
                                                }];

        NSLog(@"%@", [kaianSantos fullName]);


    }
    return 0;

}