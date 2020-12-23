//
//  main.m
//  NilsAndAFlockOfGeese
//
//  Created by Sergey Razgulyaev on 15.12.2020.
//

#import <Foundation/Foundation.h>
#import "Human.h"
#import "Goose.h"
#import "Flock.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Flock *flock = [[Flock alloc] init];
        
        Human *boy = [[Human alloc] initWithName:@"Nils"];

        Goose *gooseMartin = [[Goose alloc] initWithName: @"Martin"];
        Goose *gooseAkka = [[Goose alloc] initWithName: @"Akka"];
        Goose *gooseYksi = [[Goose alloc] initWithName: @"Yksi"];
        Goose *gooseKaksi = [[Goose alloc] initWithName: @"Kaksi"];
        Goose *gooseKolme = [[Goose alloc] initWithName: @"Kolme"];
        Goose *gooseNelja = [[Goose alloc] initWithName: @"Nelja"];
        Goose *gooseViisi = [[Goose alloc] initWithName: @"Viisi"];

        NSArray *geese = [[NSArray alloc] initWithObjects:gooseMartin, gooseAkka, gooseYksi, gooseKaksi, gooseKolme, gooseNelja, gooseViisi, nil];
        [gooseMartin release];
        [gooseAkka release];
        [gooseYksi release];
        [gooseKaksi release];
        [gooseKolme release];
        [gooseNelja release];
        [gooseViisi release];

        [flock configureWithBoy:boy andGeese:geese];
        [boy release];
        [geese release];

        NSLog(@"Flock is ready");
        [flock release];
    }
    return 0;
}
