//
//  main.m
//  CalculatorWithFunctions
//
//  Created by Sergey Razgulyaev on 10.12.2020.
//

#import <Foundation/Foundation.h>

//Functions
int funcAddition(int firstNumber, int secondNumber) {
    return firstNumber + secondNumber;
}

int funcSubtraction(int firstNumber, int secondNumber) {
    return firstNumber - secondNumber;
}

int funcMultiplication(int firstNumber, int secondNumber) {
    return firstNumber * secondNumber;
}
float funcDivision(int firstNumber, int secondNumber) {
    if (secondNumber != 0) {
        return (float)firstNumber / secondNumber;
    } else {
        printf("You cannot divide by 0!\n");
        return 0;
    }
}

int funcRemainderOfDivision(int firstNumber, int secondNumber) {
    if (secondNumber != 0) {
        return firstNumber % secondNumber;
    } else {
        printf("You cannot divide by 0!\n");
        return 0;
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //Variable declaration
        int firstNumber = 0;
        int secondNumber = 0;
        
        //Arithmetic operations with two numbers
        printf("Enter two numbers to perform arithmetic operations\n");
        printf("First number = ");
        scanf("%d", &firstNumber);
        printf("Second number = ");
        scanf("%d", &secondNumber);
        
        printf("\nArithmetic operations:\n");
        printf("%d + %d = %d\n", firstNumber, secondNumber, funcAddition(firstNumber, secondNumber));
        printf("%d - %d = %d\n", firstNumber, secondNumber, funcSubtraction(firstNumber, secondNumber));
        printf("%d * %d = %d\n", firstNumber, secondNumber, funcMultiplication(firstNumber, secondNumber));
        if (secondNumber != 0) {
            printf("%d / %d = %.2f\n", firstNumber, secondNumber, funcDivision(firstNumber, secondNumber));
            printf("%d %% %d = %d\n", firstNumber, secondNumber, funcRemainderOfDivision(firstNumber, secondNumber));
        } else {
            printf("You cannot divide by 0!\n");
        }
    }
    return 0;
}
