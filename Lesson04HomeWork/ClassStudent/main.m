//
//  main.m
//  ClassStudent
//
//  Created by Sergey Razgulyaev on 11.12.2020.
//

#import <Foundation/Foundation.h>
#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *students = [[NSMutableArray alloc]init];
        
        Student *firstStudent = [[Student alloc] initWithName:@"John" surname:@"Sutter" andAge:23];
        [students addObject:firstStudent];
        
        Student *secondStudent = [[Student alloc] initWithName:@"Anna" surname:@"Reiner" andAge:21];
        [students addObject:secondStudent];

        Student *thirdStudent = [[Student alloc] initWithName:@"Benjamin" surname:@"Gready" andAge:22];
        [students addObject:thirdStudent];
        
        NSLog(@"\nStudents:\n%@", students);
        
        printf("\nChanges to the age of students\n");
        [firstStudent changeAge:3];
        [secondStudent changeAge:-2];
        [thirdStudent changeAge:0];
        NSLog(@"\nStudents:\n%@", students);
    }
    return 0;
}
