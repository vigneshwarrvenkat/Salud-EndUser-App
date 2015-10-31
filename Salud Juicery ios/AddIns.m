//
//  AddIns.m
//  Salud Juicery ios
//
//  Created by Salud Juice Team on 10/30/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//
#import "AddIns.h"
#import "Addin.h"


@implementation AddIns








+ (AddIns *)sharedInstance {
    static AddIns*  _sharedAddIns;
    
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        _sharedAddIns = [[AddIns alloc] init];
    });
    
    return _sharedAddIns;
}

- (id)init
{
    if((self = [super init]))
    {
        _allAddins = [self loadAddInsFromJSON];
    }
    return self;
}

- (NSArray *)loadAddInsFromJSON {
    
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"addins" ofType:@"json"];
    
    NSError* error;
    NSData* jsonData =  [NSData dataWithContentsOfFile:filePath options:NSDataReadingUncached error:&error];
    NSArray* jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    
    NSMutableArray* addinArray = [[NSMutableArray alloc] initWithCapacity:jsonArray.count];
    
    for (NSDictionary* addinDictionary in jsonArray) {
        Addin* addin = [[Addin alloc] init];
        addin.addinID = addinDictionary[@"id"];
        addin.addinName = addinDictionary[@"name"];
       // addin.ingredients = addinDictionary[@"ingredients"];
        // puppy.photoURL = puppyDictionary[@"photo-large"];
        // puppy.maxHeight = puppyDictionary[@"max_weight"];
      //  juice.quantity = juiceDictionary[@"quantity"];
        // puppy.cuddleFactor = puppyDictionary[@"cuddle_factor"];
        addin.addinPrice = addinDictionary[@"price"];
        [addinArray addObject:addin];
    }
    
    return addinArray;
    
    
}






@end
