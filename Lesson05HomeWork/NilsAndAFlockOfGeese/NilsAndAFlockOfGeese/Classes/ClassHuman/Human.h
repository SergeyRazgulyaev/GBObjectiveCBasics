//
//  Human.h
//  NilsAndAFlockOfGeese
//
//  Created by Sergey Razgulyaev on 15.12.2020.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Human : NSObject

@property (nonatomic, copy) NSString *name;

- (instancetype) initWithName: (NSString *) name;

@end

NS_ASSUME_NONNULL_END
