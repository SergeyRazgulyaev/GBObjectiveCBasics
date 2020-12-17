//
//  Student.h
//  ClassStudent
//
//  Created by Sergey Razgulyaev on 11.12.2020.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *surname;
@property (nonatomic, readonly) NSString *fullName;
@property (nonatomic, readonly) int age;

- (instancetype) initWithName: (NSString *) name surname: (NSString *) surname andAge: (int) age;
- (void) changeAge: (int) addedOrRemovedNumberOfYears;

@end

NS_ASSUME_NONNULL_END
