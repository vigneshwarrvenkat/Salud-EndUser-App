//
//  Juices.m
//  Salud Juicery ios
//
//  Created by Salud Juice Team on 10/26/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import "Juices.h"
#import "Juice.h"


@implementation Juices

+ (Juices *)sharedInstance {
    static Juices*  _sharedJuices;
    
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        _sharedJuices = [[Juices alloc] init];
    });
    
    return _sharedJuices;
}

- (id)init
{
    if((self = [super init]))
    {
        _allJuices = [self loadJuicesFromJSON];
    }
    return self;
}

- (NSArray *)loadJuicesFromJSON {
    
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"juices" ofType:@"json"];
    
    NSError* error;
    NSData* jsonData =  [NSData dataWithContentsOfFile:filePath options:NSDataReadingUncached error:&error];
    NSArray* jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    
    NSMutableArray* juiceArray = [[NSMutableArray alloc] initWithCapacity:jsonArray.count];
    
    for (NSDictionary* juiceDictionary in jsonArray) {
        Juice* juice = [[Juice alloc] init];
        juice.ID = juiceDictionary[@"id"];
        juice.name = juiceDictionary[@"name"];
        juice.ingredients = juiceDictionary[@"ingredients"];
       // puppy.photoURL = puppyDictionary[@"photo-large"];
       // puppy.maxHeight = puppyDictionary[@"max_weight"];
        juice.quantity = juiceDictionary[@"quantity"];
       // puppy.cuddleFactor = puppyDictionary[@"cuddle_factor"];
        juice.price = juiceDictionary[@"price"];
        [juiceArray addObject:juice];
    }
    
    return juiceArray;
    
    
}






@end
