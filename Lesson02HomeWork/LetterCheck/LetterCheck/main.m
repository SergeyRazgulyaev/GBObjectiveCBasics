//
//  main.m
//  LetterCheck
//
//  Created by Sergey Razgulyaev on 10.12.2020.
//

#import <Foundation/Foundation.h>

//Function Letter Check
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

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //Variable declaration
        char userLetter = ' ';
        
        //Сhecking a letter for entry into the English alphabet
        printf("Enter a letter to check its occurrence in the English alphabet: ");
        scanf(" %c", &userLetter);
        funcLetterCheck(userLetter);
    }
    return 0;
}
