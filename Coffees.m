//
//  Coffees.m
//  Salud Juicery ios
//
//  Created by Salud Juice Team on 11/17/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import "Coffees.h"


#import "Coffee.h"
#import "RemoteLogin.h"


@implementation Coffees

+ (Coffees *)sharedInstance {
    static Coffees*  _sharedCoffees;
    
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        _sharedCoffees = [[Coffees alloc] init];
    });
    
    return _sharedCoffees;
}

- (id)init
{
    if((self = [super init]))
    {
        _allCoffees = [self loadCoffeesFromJSON];
    }
    return self;
}

- (NSArray *)loadCoffeesFromJSON {
    
    
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
        
      //  NSString* filePath = [[NSBundle mainBundle] pathForResource:@"Smoothees" ofType:@"json"];
        
        NSError* error;
        NSString* category;
      //  NSData* jsonData =  [NSData dataWithContentsOfFile:filePath options:NSDataReadingUncached error:&error];
      //  NSArray* jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
        
        NSMutableArray* coffeeArray = [[NSMutableArray alloc] initWithCapacity:menuArray.count];
        
        for (NSDictionary* coffeeDictionary in menuArray) {
            
            
          
            
            Coffee* juice = [[Coffee alloc] init];
            
            category = coffeeDictionary[@"category"];
            
            if([category  isEqual: @"COFFEE-BASED"])
            {
                
                // juice.bowlID = bowlDictionary[@"id"];
                juice.coffeeName = coffeeDictionary[@"item_name"];
                juice.coffeeIngredients = coffeeDictionary[@"description"];
                // puppy.photoURL = puppyDictionary[@"photo-large"];
                // puppy.maxHeight = puppyDictionary[@"max_weight"];
                juice.coffeeQuantity = coffeeDictionary[@"petite"];
                // puppy.cuddleFactor = puppyDictionary[@"cuddle_factor"];
                juice.coffeePrice = coffeeDictionary[@"regular"];
                [coffeeArray addObject:juice];
                
            }
            
            
        }
        
        
        
        return coffeeArray;
        
    }
    
}


@end
