//
//  MyOperation.m
//  BlocksAndGCD
//
//  Created by Sergey Razgulyaev on 21.12.2020.
//

#import "MyOperation.h"

@implementation MyOperation
-(void)start {
    NSLog(@"Start");
}

-(void)main {
    NSLog(@"Create result");
}

-(BOOL)isCancelled {
    NSLog(@"isCancelled");
    return [super isCancelled];
}

- (BOOL)isFinished {
    NSLog(@"isFinished");
    return [super isFinished];
}

-(BOOL)isReady {
    NSLog(@"isReady");
    return [super isReady];
}

@end
