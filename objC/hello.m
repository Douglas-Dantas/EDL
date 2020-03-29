#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]){
    @autoreleasepool {
        NSLog(@"Hello, World!");

        NSString *nothing = nil;

        NSlog(@"location of nil: %p,", nothing); // location of nil: 0x0

        NSString *quote = @"Dogs have masters, while cats have staff";

        NSLog(@"Size of string: %d", (int)[quote length]); // 40

        Nlog(@"character at 5 : %c", [quote characterAtIndex:5]); // character at 5 : h

        char *name = "Derek";
        NSString *myName = [NSString stringWithFormat:@"-%s", name];

        BOOL isStringEqual = [quote isStringEqual:myName];
        printf("are strings equal : %d|n", isStringEqual);  // false

        const char *uCString = [[myName uppercaseString]UTF8String]; // UTF8String modifica a variavel para uma ponteiro de string, tipo primitivo
        printf ("%s\n", uCString); // DEREK

        NSString *wholeQuote = [quote stringByAppendingString: myName];
        NSRange searchResult = [wholeQuote rangeOfString:@"Derek"];

        if (searchResult.location == NSNot.Found){
            NSLog(@"String not found");
        }else{
            printf ("derek is at index %lu and is %lu long\n", searchResult.location, searchResult.length);
        }

        NSRange range = NSMakeRange(42, 5);
        const char *newQuote = [[wholeQuote stringByReplacingCharactersInRange: range whithString:@"Anon"]UTF8String];

        printf("%s", newQuote); // Dogs have masters, while cats have staff - Anon 

        NSMutableString *groceryList = [NSMutable stringWithCapacity:50];

        [groceryList appendFormat: @"%s", "Potato, Banana, Pasta"];
        NSLog(@"groceryList : %@", groceryList);
        [groceryList deleteCharactersInRange: NSMakeRange (0,8)];
        NSLog (@"groceryList : %@", groceryList);
        [groceryList insertString:@", Apple" atIndex:13];

    }
    return 0;
}