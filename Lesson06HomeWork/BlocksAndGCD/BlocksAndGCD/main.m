//
//  main.m
//  BlocksAndGCD
//
//  Created by Sergey Razgulyaev on 21.12.2020.
//

#import <Foundation/Foundation.h>
#import "MyOperation.h"

//1. Block with typedef
typedef void(^ArintArrayElementsBlock)(NSArray *);

//2. A global block that outputs the sum of two numbers
int (^sumOfTwoNumbers) (int, int) = ^(int a, int b) {
    return a + b;
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //1.1 Print Array Elements
        NSArray *arrayWithNumbers = @[@1, @2, @3];
        ArintArrayElementsBlock printaArrayBlock = ^(NSArray* arrayToPrint){
            NSLog(@"1. %@", arrayToPrint);
        };
        printaArrayBlock(arrayWithNumbers);
        
        //2.1 Print with block: sumOfTwoNumbers(a,b)
        NSLog(@"2. a + b = %d", sumOfTwoNumbers(35, 56));
        
        //3. A simple message is printed to the console
        void (^simpleMessage)(void) = ^(void){
            NSLog(@"3. This is a simple message without any calculations");
        };
        simpleMessage();
        
        //4. Bocks with immutable and mutable variable
        int immutableVariable = 22;
        __block int mutableVariable = 33;
        
        void (^immutableVariableBlock)(void) = ^(void){
            NSLog(@"4.1 ImmutableVariable after block implementation is: %d", immutableVariable);
        };
        immutableVariable = 2;
        immutableVariableBlock();
        
        void (^mutableVariableBlock)(void) = ^(void){
            NSLog(@"4.2 MutableVariable after block implementation is: %d", mutableVariable);
        };
        mutableVariable = 3;
        mutableVariableBlock();
        
        //5. Delete 1, 2, 3, 4 using block transfer
        NSArray *numbersArray = @[@"12103411", @"30102114", @"03102410", @"40102300", @"02101043"];
        NSMutableArray *onlyZeroArray = [NSMutableArray array];
        NSArray *deletedNumbers = @[@"1", @"2", @"3", @"4"];
        
        void (^numbersDeleterBlock)(id, NSUInteger, BOOL *);
        numbersDeleterBlock = ^(id string, NSUInteger i, BOOL *stop) {
            NSMutableString *newString = [NSMutableString stringWithString:string];
            for (NSString *s in deletedNumbers) {
                NSRange fullRange = NSMakeRange(0, [newString length]);
                [newString replaceOccurrencesOfString:s
                                           withString:@""
                                              options:NSCaseInsensitiveSearch
                                                range:fullRange];
            }
            [onlyZeroArray addObject:newString];
        };
        [numbersArray enumerateObjectsUsingBlock:numbersDeleterBlock];
        NSLog(@"5. Only zero strings: %@", onlyZeroArray);
        
        
        //6. Blocks with GCD
        //6.1 Global queue(QOS_CLASS_BACKGROUND)
        dispatch_queue_t queue = dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0);
        __block int counter = 0;
        void (^counterIncrementBlock)(void) = ^(void){
            counter += 1;
        };
        dispatch_async(queue, counterIncrementBlock);
        sleep(2);
        NSLog(@"6.1 Counter incremented in background and now is equal: %d", counter);
        
        //6.2 Group
        __block NSString *myName = @"S";
        __block NSString *mySurname = @"R";
        dispatch_group_t myFullNameAndSurnameGroup = dispatch_group_create();
        dispatch_queue_t myFullNameAndSurnameQueue = dispatch_get_global_queue(QOS_CLASS_UTILITY, 0);
        dispatch_group_async(myFullNameAndSurnameGroup, myFullNameAndSurnameQueue, ^{
            myName = @"Sergey";
        });
        dispatch_group_async(myFullNameAndSurnameGroup, myFullNameAndSurnameQueue, ^{
            mySurname = @"Razgulyaev";
        });
        dispatch_group_notify(myFullNameAndSurnameGroup, myFullNameAndSurnameQueue, ^{
            NSLog(@"6.2 My full name is: %@ %@", myName, mySurname);
        });
        sleep(2);
        
        //6.3 Barrier
        dispatch_queue_t barrierQueue = dispatch_queue_create("homeWork06", NULL);
        dispatch_barrier_async(barrierQueue, ^{
            NSLog(@"6.3 First task");
            NSLog(@"There is a Barrier");
        });
        dispatch_async(barrierQueue, ^{
            NSLog(@"Second task");
        });
        sleep(2);
        
        //6.4 NSOperationQueue with block
        NSOperationQueue *customQueue = [[NSOperationQueue alloc]init];
        [customQueue addOperationWithBlock: ^{
            NSLog(@"6.4 Print to console by NSOperationQueue with block");
        }];
        sleep(2);
        
        //6.5 NSOperationQueue with Class MyOperation
        NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
        
        MyOperation *myOperation = [[MyOperation alloc] init];
        NSLog(@"6.5 Print to console by NSOperationQueue with Class MyOperation");
        [mainQueue addOperation: myOperation];
    }
    return 0;
}
