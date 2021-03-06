//
//  Juices.m
//  Salud Juicery ios
//
//  Created by Salud Juice Team (Vigneshwarr)on 10/26/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import "Juices.h"
#import "Juice.h"
#import "RemoteLogin.h"
#import "Reachability.h"
#import "UIAlertMessage.h"


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
    
    
//    UIAlertMessage *view = [[UIAlertMessage alloc] init];
//    
//    //Below code checks whether internet connection is there or not
//    
//    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
//    
//    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
//    
//    if (networkStatus == NotReachable) {
//        
//        [view displayMessage];
//        
//        // [displayMessage:@"No Internet Connection available..Please try again later."];
//        
//    } else
//        
//    {
    
    
    
    
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
    
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"juices" ofType:@"json"];
    
    NSError* error;
    NSString *category;
    NSData* jsonData =  [NSData dataWithContentsOfFile:filePath options:NSDataReadingUncached error:&error];
    NSArray* jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    
    NSMutableArray* juiceArray = [[NSMutableArray alloc] initWithCapacity:jsonArray.count];
    
    for (NSDictionary* itemDict in menuArray) {
        Juice* juice = [[Juice alloc] init];
        category = itemDict[@"category"];
        
     //  NSLog(@"Itemdiction Juice : %@",itemDict);
        
        if([category  isEqual: @"JUICES"]){
        
        juice.ID = itemDict[@"menu_id"];
        juice.name = itemDict[@"item_name"];
        juice.ingredients = itemDict[@"description"];
       // puppy.photoURL = puppyDictionary[@"photo-large"];
       // puppy.maxHeight = puppyDictionary[@"max_weight"];
        juice.quantityPetite = itemDict[@"petite"];
        juice.quantityRegular = itemDict[@"regular"];
            juice.quantityGrowler = itemDict[@"growler"];

       // puppy.cuddleFactor = puppyDictionary[@"cuddle_factor"];
       // juice.price = itemDict[@"regular"];
        [juiceArray addObject:juice];
            
        }
    }
    
    return juiceArray;
}
//        
//    }
//    return nil;
//
}






@end
