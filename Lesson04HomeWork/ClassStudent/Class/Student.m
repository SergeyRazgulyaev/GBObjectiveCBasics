//
//  Student.m
//  ClassStudent
//
//  Created by Sergey Razgulyaev on 11.12.2020.
//

#import "Student.h"

@implementation Student
@synthesize age, fullName;

- (instancetype) initWithName: (NSString *) name surname: (NSString *) surname andAge: (int) age {
    self = [super init];
    if (self != nil) {
        self.name = name;
        self.surname = surname;
        self.fullName = [NSString stringWithFormat:@"%@ %@", name, surname];
        self.age = age;
    }
    return self;
}

- (NSString *) description {
    return [NSString stringWithFormat:@"%@ is a %d year old student", self.fullName, self.age];
}

- (void) setFullName: (NSString *) studentFullName {
    fullName = studentFullName;
}

- (void) setAge: (int) studentAge {
    age = studentAge;
}

- (void) changeAge: (int) addedOrRemovedNumberOfYears {
    age += addedOrRemovedNumberOfYears;
}

@end
