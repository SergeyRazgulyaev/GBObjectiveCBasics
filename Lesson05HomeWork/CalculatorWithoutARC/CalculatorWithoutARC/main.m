//
//  main.m
//  CalculatorWithoutARC
//
//  Created by Sergey Razgulyaev on 17.12.2020.
//

#import <Foundation/Foundation.h>
#import "Calculator.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //Variable declaration
        float userFirstNumber = 0.0;
        float userSecondNumber = 0.0;
        char userOperation = ' ';
        Calculator *calculator = [[Calculator alloc] init];
        
        //Arithmetic operations with two numbers
        printf("Enter two numbers and required arithmetic operation\n");
        printf("First number = ");
        scanf("%f", &userFirstNumber);
        printf("Arithmetic operation: ");
        scanf("%s", &userOperation);
        printf("Second number = ");
        scanf("%f", &userSecondNumber);
        
        printf("\nCalculation:\n");
        
        [calculator calculateWithOperation:userOperation andFirstNumber: [NSNumber numberWithFloat: userFirstNumber] andSecondNumber: [NSNumber numberWithFloat: userSecondNumber]];
        [calculator release];
    }
    return 0;
}
