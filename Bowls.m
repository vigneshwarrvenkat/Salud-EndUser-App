//
//  Bowls.m
//  Salud Juicery ios
//
//  Created by Salud Juice Team (Vigneshwarr)on 10/31/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//


#import "Bowls.h"
#import "Bowl.h"
#import "RemoteLogin.h"


@implementation Bowls

+ (Bowls *)sharedInstance {
    static Bowls*  _sharedBowls;
    
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        _sharedBowls = [[Bowls alloc] init];
    });
    
    return _sharedBowls;
}

- (id)init
{
    if((self = [super init]))
    {
        _allBowls = [self loadBowlsFromJSON];
    }
    return self;
}

- (NSArray *)loadBowlsFromJSON {
    
    
    RemoteLogin *remote = [[RemoteLogin alloc] init];
    
    int res = [remote getConnection:nil forobjects:nil forurl:@"http://ec2-52-88-11-130.us-west-2.compute.amazonaws.com:3000/menu/get"];
    
    if(res==1)
        
    {
        
        NSLog(@"An error occured %@",remote.errorMsg);
        
        return 0;
        
    }
    
    else
        
    {
        
        NSMutableArray *menuArray = remote.jsonData;
    
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"Smoothees" ofType:@"json"];
    
    NSError* error;
        NSString* category;
    NSData* jsonData =  [NSData dataWithContentsOfFile:filePath options:NSDataReadingUncached error:&error];
    NSArray* jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    
    NSMutableArray* bowlArray = [[NSMutableArray alloc] initWithCapacity:jsonArray.count];
    
    for (NSDictionary* bowlDictionary in menuArray) {
        
        
        NSLog(@"bowlsdiction: %@",bowlDictionary);

        Bowl* juice = [[Bowl alloc] init];
        
        category = bowlDictionary[@"category"];
        
        if([category  isEqual: @"JUICES"])
        {
        
       // juice.bowlID = bowlDictionary[@"id"];
        juice.bowlName = bowlDictionary[@"item_name"];
        juice.bowlIngredients = bowlDictionary[@"description"];
        // puppy.photoURL = puppyDictionary[@"photo-large"];
        // puppy.maxHeight = puppyDictionary[@"max_weight"];
        juice.bowlQuantity = bowlDictionary[@"petite"];
        // puppy.cuddleFactor = puppyDictionary[@"cuddle_factor"];
        juice.bowlPrice = bowlDictionary[@"regular"];
        [bowlArray addObject:juice];
        
        }
    
    
    }
        
        
    
    return bowlArray;
        
    }
        
    }


@end
