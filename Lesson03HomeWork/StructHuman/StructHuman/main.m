//
//  main.m
//  StructHuman
//
//  Created by Sergey Razgulyaev on 10.12.2020.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger) {
    Man,
    Woman,
} Gender;

typedef struct {
    Gender gender;
    NSInteger age;
    __unsafe_unretained NSString *name;
} Human;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Human husband;
        husband.gender = Man;
        husband.age = 31;
        husband.name = @"Fred Flintstone";
        
        Human wife;
        wife.gender = Woman;
        wife.age = 26;
        wife.name = @"Wilma Flintstone";
        
        Human daughter;
        daughter.gender = Woman;
        daughter.age = 2;
        daughter.name = @"Pebbles Flintstone";

        NSLog(@"The Flintstone family lives in the Stone Age. Father - the head of the family %@, he is a real man. He is %ld years old. Mother - %@. She is a caring woman, she recently turned %ld and she is worried about this. Such wonderful parents have a daughter %@. She is only %ld years old.", husband.name, husband.age, wife.name, wife.age, daughter.name, daughter.age);
    }
    return 0;
}
