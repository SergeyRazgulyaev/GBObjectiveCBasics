//
//  Calculator.m
//  CalculatorWithoutARC
//
//  Created by Sergey Razgulyaev on 17.12.2020.
//

#import "Calculator.h"

@implementation Calculator

- (instancetype) init {
    if (self = [super init]) {
        _firstNumber = [NSNumber numberWithFloat:0.0];
        _secondNumber = [NSNumber numberWithFloat:0.0];
        _operation = '+';
        [_firstNumber retain];
        [_secondNumber retain];
        NSLog(@"Calculator created");
    }
    return self;
}

- (void) calculateWithOperation: (CalculatorOperation) operation
                andFirstNumber: (NSNumber *) firstNumber
               andSecondNumber: (NSNumber *) secondNumber {
    _firstNumber = firstNumber;
    _secondNumber = secondNumber;
    _operation = operation;
    float result = 0.0;
    
    switch (_operation) {
        case addition:
            result = [_firstNumber floatValue] + [_secondNumber floatValue];
            printf("%.2f + %.2f = %.2f\n", [_firstNumber floatValue], [_secondNumber floatValue], result);
            break;
        case subtraction:
            result = [_firstNumber floatValue] - [_secondNumber floatValue];
            printf("%.2f - %.2f = %.2f\n", [_firstNumber floatValue], [_secondNumber floatValue], result);
            break;
        case multiplication:
            result = [_firstNumber floatValue] * [_secondNumber floatValue];
            printf("%.2f * %.2f = %.2f\n", [_firstNumber floatValue], [_secondNumber floatValue], result);
            break;
        case division:
            if ([_secondNumber floatValue] != 0) {
                result = [_firstNumber floatValue] / [_secondNumber floatValue];
                printf("%.2f / %.2f = %.2f\n", [_firstNumber floatValue], [_secondNumber floatValue], result);
            } else {
                printf("You cannot divide by 0!\n");
            }
            break;
        case remainderOfDivision:
            if ([_secondNumber floatValue] != 0) {
                result = [_firstNumber intValue] % [_secondNumber intValue];
                printf("%d %% %d = %d\n", [_firstNumber intValue], [_secondNumber intValue], (int)result);
            } else {
                printf("You cannot divide by 0!\n");
            }
            break;
        default:
            printf("An invalid value was entered for the required arithmetic operation or number.\n");
            break;
    }
    return;
}

- (void) dealloc {
    [_firstNumber release];
    [_secondNumber release];
    NSLog(@"Dealloc calculator");
    [super dealloc];
}

@end
