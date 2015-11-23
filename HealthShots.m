//
//  HealthShots.m
//  Salud Juicery ios
//
//  Created by Salud Juice Team (Vigneshwarr)on 11/2/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import "HealthShots.h"
#import "HealthShot.h"
#import "RemoteLogin.h"

@implementation HealthShots



+ (HealthShots *)sharedInstance {
    static HealthShots*  _sharedHealthShots;
    
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        _sharedHealthShots = [[HealthShots alloc] init];
    });
    
    return _sharedHealthShots;
}

- (id)init
{
    if((self = [super init]))
    {
        _allHealthShots = [self loadHealthShotsFromJSON];
    }
    return self;
}

- (NSArray *)loadHealthShotsFromJSON {


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
    
    NSMutableArray* healthshotArray = [[NSMutableArray alloc] initWithCapacity:jsonArray.count];
    
    for (NSDictionary* healthshotDictionary in menuArray) {
        
        
      
        
         HealthShot* juice = [[HealthShot alloc] init];
        
        
        category = healthshotDictionary[@"category"];
        
        if([category  isEqual: @"SHOTS"])
        {

            
            
            
            
           // juice.healthID = healthshotDictionary[@"id"];
            juice.healthName = healthshotDictionary[@"item_name"];
            juice.healthIngredients = healthshotDictionary[@"description"];
            // puppy.photoURL = puppyDictionary[@"photo-large"];
            // puppy.maxHeight = puppyDictionary[@"max_weight"];
            juice.healthQuantity = healthshotDictionary[@"petite"];
            // puppy.cuddleFactor = puppyDictionary[@"cuddle_factor"];
            juice.healthPrice = healthshotDictionary[@"regular"];
            [healthshotArray addObject:juice];
            
            
        }
        
        
    }
    
    
    
    return healthshotArray;
    
}

}

















@end
