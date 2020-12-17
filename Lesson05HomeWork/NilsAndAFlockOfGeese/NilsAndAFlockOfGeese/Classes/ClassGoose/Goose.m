//
//  Goose.m
//  NilsAndAFlockOfGeese
//
//  Created by Sergey Razgulyaev on 15.12.2020.
//

#import "Goose.h"

@implementation Goose

- (instancetype)initWithName: (NSString *) name {
    if (self = [super init]) {
        _name = [name retain];
        NSLog(@"Create goose with name - %@", _name);
    }
    return self;
}

- (void)dealloc {
    NSLog(@"Dealloc goose with name - %@", _name);
    [_name release];
    [super dealloc];
}

@end
