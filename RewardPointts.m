//
//  RewardPointts.m
//  Salud Juicery ios
//
//  Created by Salud Juice Team on 11/22/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import "RewardPointts.h"
#import "RewardPointt.h"
#import "RemoteLogin.h"

@implementation RewardPointts



+ (RewardPointts *)sharedInstance {
    static RewardPointts*  _sharedRewardPointts;
    
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        _sharedRewardPointts = [[RewardPointts alloc] init];
    });
    
    return _sharedRewardPointts;
}

- (id)init
{
    if((self = [super init]))
    {
        _allRewards = [self loadRewardsFromJSON];
    }
    return self;
}

- (NSArray *)loadRewardsFromJSON {
    
    
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
        
        NSMutableArray* rewardArray = [[NSMutableArray alloc] initWithCapacity:menuArray.count];
        
        for (NSDictionary* rewardDictionary in menuArray) {
            
            
            
            
            RewardPointt* reward = [[RewardPointt alloc] init];
            
            category = rewardDictionary[@"category"];
            
            if([category  isEqual: @"COFFEE-BASED"])
            {
                
                // juice.bowlID = bowlDictionary[@"id"];
                reward.rewardID = rewardDictionary[@"item_name"];
                reward.rewardName= rewardDictionary[@"description"];
                // puppy.photoURL = puppyDictionary[@"photo-large"];
                // puppy.maxHeight = puppyDictionary[@"max_weight"];
                //  juice.coffeeQuantity = coffeeDictionary[@"petite"];
                // puppy.cuddleFactor = puppyDictionary[@"cuddle_factor"];
                // juice.coffeePrice = coffeeDictionary[@"regular"];
                [rewardArray addObject:reward];
                
            }
            
            
        }
        
        
        
        return rewardArray;
        
    }
    
}


@end
