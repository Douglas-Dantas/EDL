#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface person: NSObject // { @public NSInteger age;} Instance Variable IVar outdated

- (instancetype)initWithFirstName: (NSString *) firstName  // construtor, ou, em outras palavras
                         lastName: (NSString *) lastName   // inicializador.
                              age: (NSInteger)  age;       //

- (NSString *)fullName;

+ (Person *)constructPersonFromDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END