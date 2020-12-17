//
//  Flock.m
//  NilsAndAFlockOfGeese
//
//  Created by Sergey Razgulyaev on 15.12.2020.
//

#import "Flock.h"
#import "Human.h"
#import "Goose.h"

@implementation Flock

- (instancetype) init {
    if (self = [super init]) {
        NSLog(@"Create flock");
    }
    return self;
}

- (void) configureWithBoy: (Human *) boy andGeese: (NSArray *) geese {
    [boy retain];
    [_boy release];
    _boy = boy;
    NSLog(@"Add boy %@ to the flock", _boy.name);
    
    NSArray *copy = [geese copy];
    [_geese release];
    _geese = copy;
    for (Goose *goose in geese) {
        NSLog(@"Add %@ the goose to the flock", goose.name);
    }
}

- (void) dealloc {
    NSLog(@"Dealloc the flock");
    [_boy release];
    [_geese release];
    [super dealloc];
}

@end
