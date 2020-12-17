//
//  Calculator.h
//  CalculatorWithoutARC
//
//  Created by Sergey Razgulyaev on 17.12.2020.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum {
        addition = '+',
        subtraction = '-',
        multiplication = '*',
        division = '/',
        remainderOfDivision = '%'
} CalculatorOperation;

@interface Calculator : NSObject

@property (nonatomic, readonly) char operation;
@property (nonatomic, readonly, strong) NSNumber *firstNumber;
@property (nonatomic, readonly, strong) NSNumber *secondNumber;

- (void) calculateWithOperation: (CalculatorOperation) operation
                andFirstNumber: (NSNumber *) firstNumber
               andSecondNumber: (NSNumber *) secondNumber;
@end

NS_ASSUME_NONNULL_END
