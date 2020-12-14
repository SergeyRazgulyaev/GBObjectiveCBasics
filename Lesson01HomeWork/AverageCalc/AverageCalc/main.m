//
//  main.m
//  AverageCalc
//
//  Created by Sergey Razgulyaev on 10.12.2020.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //Variables for calculating the average
        float firstNumberForAverageCalc = 0.0;
        float secondNumberForAverageCalc = 0.0;
        float thirdNumberForAverageCalc = 0.0;
        
        //User input of three numbers for calculating the average
        printf("Calculating the average:\nEnter three numbers!\n");
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
