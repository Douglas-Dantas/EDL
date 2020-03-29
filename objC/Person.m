#import "person.h"

@interface Person ()
    @property (nonatomic) NSInteger age; 
    @property (nonatomic, strong) NSString *firstName;
    @property (nonatomic, strong) NSString *lastName
    
    //by default, all property is strong if you dont explicit it
    //by default all variable are atomic, nonatomic isnt 
    //considered thread safety
    // every property has a backing ivar, wich name's is written with an underscore before it,
    // for exemple: the property age is _age on it's back ivar.

    // property fora do header tem propriedade privada, onde somente o arquivo Person.m pode
    // acessala
@end

@implementation Person

- (instancetype)initWithFirstName: (NSString *) firstName lastName: (NSString *) lastName age: (NSInteger)  age{

    if (self = [super init]){   //duvida
        _age = age;
        _firstName = firstName;
        _lastName = lastName;
        // to assign the age property to the value age that's passed into the construct
        //self.age = age; same as above
        // do initialization here
    }

    return self;

}
// - means an instance method, + a class method
- (NSString *)fullName{

    NSString *fullName = nil;
    if (self.firstName && self.lastName){
        fullName = [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
    }
    return fullNAme;
}

+ (Person *)constructPersonFromDictionary:(NSDictionary *)dictionary{

    Person *person = nil;

    NSNumber age = dictionary["@age"];
    NSString *firstName = dictionary["@firstName"];
    NSString *lastName = dictionary["@lastName"];

    if ( age && firstName && lastName) {

        person = [[person alloc] initWithFirstName:firstName lastName:lastName age:[age integerValue]]

    }


    return person;

}

//getter : Nao é necessario implementa-lo visto que o compilador automaticamente o introduz
// caso o mesmo nao esteja presente, seu uso é mais relevante nas situacoes onde há o inte-
// resse em editar, de alguma forma, a variavel.

- (NSInteger)age {
    return _age;
}

//setter:

- (void)setAge:(NSInteger)age {
    self.age = age - 24;
}


@end