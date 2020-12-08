//
//  main.m
//  Lesson01HomeWork
//
//  Created by Sergey Razgulyaev on 07.12.2020.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //Variables for input/output and arithmetic operations on two numbers
        int firstNumber = 0;
        int secondNumber = 0;
        
        //Variables for calculating the average
        float firstNumberForAverageCalc = 0.0;
        float secondNumberForAverageCalc = 0.0;
        float thirdNumberForAverageCalc = 0.0;

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
        NSLog(@"%d / %d = %.2f", firstNumber, secondNumber, (float)firstNumber / (float)secondNumber);
        NSLog(@"%d %% %d = %d", firstNumber, secondNumber, firstNumber % secondNumber);
        
        //One line output of the results of arithmetic operations
        printf("\nOne line output:\n");
        NSLog(@"First number = % d, Second number = %d, Arithmetic operations: %d + %d = %d, %d - %d = %d, %d * %d = %d, %d / %d = %.2f, %d %% %d = %d",
              firstNumber, secondNumber,
              firstNumber, secondNumber, firstNumber + secondNumber,
              firstNumber, secondNumber, firstNumber - secondNumber,
              firstNumber, secondNumber, firstNumber * secondNumber,
              firstNumber, secondNumber, (float)firstNumber / (float)secondNumber,
              firstNumber, secondNumber, firstNumber % secondNumber);
        
        //User input of three numbers for calculating the average
        printf("\nCalculating the average:\nEnter three numbers!\n");
        printf("First number = ");
        scanf("%f", &firstNumberForAverageCalc);
        printf("Second number = ");
        scanf("%f", &secondNumberForAverageCalc);
        printf("Third number = ");
        scanf("%f", &thirdNumberForAverageCalc);
        
        //Calculating the average
        float average = (firstNumberForAverageCalc + secondNumberForAverageCalc + thirdNumberForAverageCalc) / 3;
        NSLog(@"Average for numbers %.3f, %.3f, %.3f = %.3f", firstNumberForAverageCalc, secondNumberForAverageCalc, thirdNumberForAverageCalc, average);
    }
    return 0;
}
