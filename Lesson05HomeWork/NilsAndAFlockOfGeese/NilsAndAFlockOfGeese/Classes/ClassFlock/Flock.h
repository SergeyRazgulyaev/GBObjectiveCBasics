//
//  Flock.h
//  NilsAndAFlockOfGeese
//
//  Created by Sergey Razgulyaev on 15.12.2020.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class Human, Goose;

@interface Flock : NSObject

@property (nonatomic, strong) Human *boy;
@property (nonatomic, copy) NSArray<Goose *> *geese;

- (void) configureWithBoy: (Human *) boy andGeese: (NSArray<Goose *> *) geese;

@end

NS_ASSUME_NONNULL_END
