//
//  Human.m
//  NilsAndAFlockOfGeese
//
//  Created by Sergey Razgulyaev on 15.12.2020.
//

#import "Human.h"

@implementation Human

- (instancetype)initWithName:(NSString *)name {
    if (self = [super init]) {
        _name = [name copy];
        NSLog(@"Create boy with name - %@", _name);
    }
    return self;
}

- (void)dealloc {
    NSLog(@"Dealloc boy with name - %@", _name);
    [_name release];
    [super dealloc];
}

@end
