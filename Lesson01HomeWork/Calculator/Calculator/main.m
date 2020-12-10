//
//  main.m
//  Calculator
//
//  Created by Sergey Razgulyaev on 10.12.2020.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //Variables for input/output and arithmetic operations on two numbers
        int firstNumber = 0;
        int secondNumber = 0;
        
        //User input of two numbers for input/output and arithmetic operations on two numbers
        printf("Input/output and arithmetic operations on two numbers:\nEnter two numbers!\n");
        printf("First number = ");
        scanf("%d", &firstNumber);
        printf("Second number = ");
        scanf("%d", &secondNumber);

        //Arithmetic operations on two numbers
        printf("\nArithmetic operations:\n");
        NSLog(@"%d + %d = %d", firstNumber, secondNumber, firstNumber + secondNumber);
        NSLog(@"%d - %d = %d", firstNumber, secondNumber, firstNumber - secondNumber);
        NSLog(@"%d * %d = %d", firstNumber, secondNumber, firstNumber * secondNumber);
        if (secondNumber != 0) {
            NSLog(@"%d / %d = %.2f", firstNumber, secondNumber, (float)firstNumber / (float)secondNumber);
            NSLog(@"%d %% %d = %d", firstNumber, secondNumber, firstNumber % secondNumber);
        } else {
            printf("You cannot divide by 0!\n");
        }
        
        //One line output of the results of arithmetic operations
        printf("\nOne line output:\n");
        if (secondNumber != 0) {
            NSLog(@"First number = % d, Second number = %d, Arithmetic operations: %d + %d = %d, %d - %d = %d, %d * %d = %d, %d / %d = %.2f, %d %% %d = %d",
                  firstNumber, secondNumber,
                  firstNumber, secondNumber, firstNumber + secondNumber,
                  firstNumber, secondNumber, firstNumber - secondNumber,
                  firstNumber, secondNumber, firstNumber * secondNumber,
                  firstNumber, secondNumber, (float)firstNumber / secondNumber,
                  firstNumber, secondNumber, firstNumber % secondNumber);
        } else {
            NSLog(@"First number = % d, Second number = %d, Arithmetic operations: %d + %d = %d, %d - %d = %d, %d * %d = %d",
                  firstNumber, secondNumber,
                  firstNumber, secondNumber, firstNumber + secondNumber,
                  firstNumber, secondNumber, firstNumber - secondNumber,
                  firstNumber, secondNumber, firstNumber * secondNumber);
            printf("You cannot divide by 0!\n");
        }
    }
    return 0;
}
