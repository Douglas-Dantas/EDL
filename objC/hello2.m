#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]){

    NSArray *officeSupplies = @[@"pencils",@"paper"];

    NSLog(@"first : %@", officeSupplies[0]);
    NSLog (@"Office Supplies : %@", officeSupplies);

    BOOL containsItem = [officeSupplies containsObjects: @"Pencils"];
    NSLog(@"Ned Pencils : %d", containsItem);
    }
    return 0;
}