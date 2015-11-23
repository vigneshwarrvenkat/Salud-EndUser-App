//
//  HotDrinks.m
//  Salud Juicery ios
//
//  Created by Salud Juice Team (Vigneshwarr)on 11/2/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import "HotDrinks.h"
#import "HotDrink.h"
#import "RemoteLogin.h"

@implementation HotDrinks



+ (HotDrinks *)sharedInstance {
    static HotDrinks*  _sharedHotDrinks;
    
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        _sharedHotDrinks = [[HotDrinks alloc] init];
    });
    
    return _sharedHotDrinks;
}

- (id)init
{
    if((self = [super init]))
    {
        _allHotDrinks = [self loadHotDrinksFromJSON];
    }
    return self;
}

- (NSArray *)loadHotDrinksFromJSON {
    
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
        
        NSMutableArray* hotdrinkArray = [[NSMutableArray alloc] initWithCapacity:menuArray.count];
        
        for (NSDictionary* hotdrinkDictionary in menuArray) {
            
            
            
            
           HotDrink* juice = [[HotDrink alloc] init];
            
            category = hotdrinkDictionary[@"category"];
            
            if([category  isEqual: @"MEDICINAL"])
            {
                
                // juice.bowlID = bowlDictionary[@"id"];
                juice.hotName = hotdrinkDictionary[@"item_name"];
                juice.hotIngredients = hotdrinkDictionary[@"description"];
                // puppy.photoURL = puppyDictionary[@"photo-large"];
                // puppy.maxHeight = puppyDictionary[@"max_weight"];
                juice.hotQuantity = hotdrinkDictionary[@"petite"];
                // puppy.cuddleFactor = puppyDictionary[@"cuddle_factor"];
                juice.hotPrice = hotdrinkDictionary[@"regular"];
                [hotdrinkArray addObject:juice];
                
            }
            
            
        }
        
        
        
        return hotdrinkArray;
        
    }
    
}






@end
