//
//  Offers.m
//  Salud Juicery ios
//
//  Created by Salud Juice Team on 11/22/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import "Offers.h"
#import "Offer.h"
#import "RemoteLogin.h"
#define OFFER_URL @"http://ec2-52-88-11-130.us-west-2.compute.amazonaws.com:3000/offers/todays/get"

#define SHOP_URL @"http://ec2-52-88-11-130.us-west-2.compute.amazonaws.com:3000/restaurant/timings/get"

@implementation Offers



+ (Offers *)sharedInstance {
    static Offers*  _sharedOffers;
    
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        _sharedOffers = [[Offers alloc] init];
    });
    
    return _sharedOffers;
}

- (id)init
{
    if((self = [super init]))
    {
        _allOffers = [self loadOffersFromJSON];
        
        [self loadTimingsFromJSON];
    }
    return self;
}

- (NSArray *)loadOffersFromJSON {
    
    
    RemoteLogin *remote = [[RemoteLogin alloc] init];
    
    int res = [remote getConnection:nil forobjects:nil forurl:@"http://ec2-52-88-11-130.us-west-2.compute.amazonaws.com:3000/restaurant/timings/get"];
    
    if(res==1)
        
    {
        
        NSLog(@"An error occured %@",remote.errorMsg);
        
        return 0;
        
    }
    
    else
        
    {
        
        NSMutableArray *menuArray = remote.jsonData;
        
        
         NSLog(@"offers: %@",menuArray);
        
        //  NSString* filePath = [[NSBundle mainBundle] pathForResource:@"Smoothees" ofType:@"json"];
        
        NSError* error;
        NSString* category;
        //  NSData* jsonData =  [NSData dataWithContentsOfFile:filePath options:NSDataReadingUncached error:&error];
        //  NSArray* jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
        
        NSMutableArray* OffersArray = [[NSMutableArray alloc] initWithCapacity:menuArray.count];
        
        for (NSDictionary* offerDictionary in menuArray) {
            
            NSLog(@"offers diction: %@",offerDictionary);

            
            
            Offer* offer = [[Offer alloc] init];
            
//            category = offerDictionary[@"category"];
//            
//            if([category  isEqual: @"COFFEE-BASED"])
//            {
//                
//                // juice.bowlID = bowlDictionary[@"id"];
//                offer.offerID = offerDictionary[@"item_name"];
//                offer.offerName= offerDictionary[@"description"];
//                // puppy.photoURL = puppyDictionary[@"photo-large"];
//                // puppy.maxHeight = puppyDictionary[@"max_weight"];
//                //  juice.coffeeQuantity = coffeeDictionary[@"petite"];
//                // puppy.cuddleFactor = puppyDictionary[@"cuddle_factor"];
//                // juice.coffeePrice = coffeeDictionary[@"regular"];
//                [OffersArray addObject:offer];
//                
//            }
            
            
        }
        
        
        
        return OffersArray;
        
    }
    
    
    
    
    
    
}





- (NSArray *)loadTimingsFromJSON {
    
    
    RemoteLogin *remote = [[RemoteLogin alloc] init];
    
    int res = [remote getConnection:nil forobjects:nil forurl:@"http://ec2-52-88-11-130.us-west-2.compute.amazonaws.com:3000/restaurant/timings/get"];
    
    if(res==1)
        
    {
        
        NSLog(@"An error occured %@",remote.errorMsg);
        
        return 0;
        
    }
    
    else
        
    {
        
        NSMutableArray *menuArray = remote.jsonData;
        
        
        NSLog(@"offers: %@",menuArray);
        
        //  NSString* filePath = [[NSBundle mainBundle] pathForResource:@"Smoothees" ofType:@"json"];
        
        NSError* error;
        NSString* category;
        //  NSData* jsonData =  [NSData dataWithContentsOfFile:filePath options:NSDataReadingUncached error:&error];
        //  NSArray* jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
        
        NSMutableArray* OffersArray = [[NSMutableArray alloc] initWithCapacity:menuArray.count];
        
        for (NSDictionary* offerDictionary in menuArray) {
            
            NSLog(@"offers diction: %@",offerDictionary);
            
            
            
            Offer* offer = [[Offer alloc] init];
            
            //            category = offerDictionary[@"category"];
            //
            //            if([category  isEqual: @"COFFEE-BASED"])
            //            {
            //
            //                // juice.bowlID = bowlDictionary[@"id"];
            //                offer.offerID = offerDictionary[@"item_name"];
            //                offer.offerName= offerDictionary[@"description"];
            //                // puppy.photoURL = puppyDictionary[@"photo-large"];
            //                // puppy.maxHeight = puppyDictionary[@"max_weight"];
            //                //  juice.coffeeQuantity = coffeeDictionary[@"petite"];
            //                // puppy.cuddleFactor = puppyDictionary[@"cuddle_factor"];
            //                // juice.coffeePrice = coffeeDictionary[@"regular"];
            //                [OffersArray addObject:offer];
            //                
            //            }
            
            
        }
        
        
        
        return OffersArray;
        
    }
}

@end
