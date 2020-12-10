//
//  main.m
//  StringArray
//
//  Created by Sergey Razgulyaev on 10.12.2020.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *monthArray = [NSArray arrayWithObjects: @"January", @"February", @"March", @"April", @"May", @"June", @"July", @"August", @"September", @"October", @"November", @"December", nil];
        for (NSString *month in monthArray) {
            printf("%lu month is %s\n", ([monthArray indexOfObject:month] + 1), [month UTF8String]);
        }
    }
    return 0;
}
