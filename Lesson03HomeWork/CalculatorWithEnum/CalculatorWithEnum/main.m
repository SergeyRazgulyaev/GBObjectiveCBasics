//
//  main.m
//  CalculatorWithEnum
//
//  Created by Sergey Razgulyaev on 10.12.2020.
//

#import <Foundation/Foundation.h>
//Enumeration of Calculator arithmetic operations
typedef enum {
        addition = '+',
        subtraction = '-',
        multiplication = '*',
        division = '/',
        remainderOfDivision = '%'
} CalculatorOperation;

//Result calculation function
void funcCalculate(CalculatorOperation operation, int firstNumber, int secondNumber) {
    int result = 0;
    float resultOfdivision = 0.0;
    switch (operation) {
        case addition:
            result = firstNumber + secondNumber;
            printf("%d + %d = %d\n", firstNumber, secondNumber, result);
            break;
        case subtraction:
            result = firstNumber - secondNumber;
            printf("%d - %d = %d\n", firstNumber, secondNumber, result);
            break;
        case multiplication:
            result = firstNumber * secondNumber;
            printf("%d * %d = %d\n", firstNumber, secondNumber, result);
            break;
        case division:
            if (secondNumber != 0) {
                resultOfdivision = (float)firstNumber / secondNumber;
                printf("%d / %d = %.2f\n", firstNumber, secondNumber, resultOfdivision);
            } else {
                printf("You cannot divide by 0!\n");
            }
            break;
        case remainderOfDivision:
            if (secondNumber != 0) {
                result = firstNumber % secondNumber;
                printf("%d %% %d = %d\n", firstNumber, secondNumber, result);
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

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //Variable declaration
        int firstNumber = 0;
        int secondNumber = 0;
        char operation = ' ';
        
        //Arithmetic operations with two numbers
        printf("Enter two numbers and required arithmetic operation\n");
        printf("First number = ");
        scanf("%d", &firstNumber);
        printf("Arithmetic operation: ");
        scanf("%s", &operation);
        printf("Second number = ");
        scanf("%d", &secondNumber);
        
        printf("\nCalculation:\n");
        
        funcCalculate(operation, firstNumber, secondNumber);
    }
    return 0;
}
