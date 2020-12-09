//
//  main.m
//  Lesson02HomeWork
//
//  Created by Sergey Razgulyaev on 08.12.2020.
//

#import <Foundation/Foundation.h>

//Functions
void funcLetterCheck (char letter) {
    if ((letter >= 'a' && letter <= 'z') ||
        (letter >= 'A' && letter <= 'Z')) {
        printf("Yes! The letter %c is in the English alphabet.\n", letter);
    } else if (letter >= '0' && letter <= '9') {
        printf("Error! %c is a number, but not a letter.\n", letter);
    } else {
        printf("No! The entered character is not included in the English alphabet.\n");
    }
}

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
        char userLetter = ' ';
        int firstNumber = 0;
        int secondNumber = 0;
        
        //Сhecking a letter for entry into the English alphabet
        printf("Enter a letter to check its occurrence in the English alphabet: ");
        scanf(" %c", &userLetter);
        funcLetterCheck(userLetter);
        
        //Arithmetic operations with two numbers
        printf("\nEnter two numbers to perform arithmetic operations\n");
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
