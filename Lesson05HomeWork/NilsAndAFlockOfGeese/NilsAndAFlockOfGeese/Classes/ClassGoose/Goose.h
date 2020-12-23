//
//  Goose.h
//  NilsAndAFlockOfGeese
//
//  Created by Sergey Razgulyaev on 15.12.2020.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Goose : NSObject

@property (nonatomic, readonly, strong) NSString *name;

- (instancetype) initWithName: (NSString *) animalMoniker;

@end

NS_ASSUME_NONNULL_END
