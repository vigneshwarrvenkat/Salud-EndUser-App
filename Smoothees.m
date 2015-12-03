//
//  Smoothees.m
//  Salud Juicery ios
//
//  Created by Salud Juice Team (Vigneshwarr)on 10/31/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import "Smoothees.h"
#import "Smoothee.h"
#import "RemoteLogin.h"
#import "Reachability.h"
#import "UIAlertMessage.h"


@implementation Smoothees

+ (Smoothees *)sharedInstance {
    static Smoothees*  _sharedSmoothees;
    
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        _sharedSmoothees = [[Smoothees alloc] init];
    });
    
    return _sharedSmoothees;
}

- (id)init
{
    if((self = [super init]))
    {
        _allSmoothees = [self loadSmootheesFromJSON];
    }
    return self;
}

- (NSArray *)loadSmootheesFromJSON {
    
    
//    
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
    
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"Smoothees" ofType:@"json"];
    
    NSError* error;
    NSString* category;
    NSData* jsonData =  [NSData dataWithContentsOfFile:filePath options:NSDataReadingUncached error:&error];
    NSArray* jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    
    NSMutableArray* smootheeArray = [[NSMutableArray alloc] initWithCapacity:jsonArray.count];
    
    for (NSDictionary* smootheeDictionary in menuArray) {
        
        
     //   NSLog(@"bowlsdiction: %@",smootheeDictionary);
        
        Smoothee* juice = [[Smoothee alloc] init];

        
        category = smootheeDictionary[@"category"];
        
        if([category  isEqual: @"SMOOTHIES"])
        {
            
            
            
            juice.smootheeID = smootheeDictionary[@"menu_id"];
            juice.smootheeName = smootheeDictionary[@"item_name"];
            juice.smootheeIngredients = smootheeDictionary[@"description"];
            // puppy.photoURL = puppyDictionary[@"photo-large"];
            // puppy.maxHeight = puppyDictionary[@"max_weight"];
            juice.smootheeQuantityPetite = smootheeDictionary[@"petite"];
            juice.smootheeQuantityRegular = smootheeDictionary[@"regular"];
            juice.smootheeQuantityGrowler = smootheeDictionary[@"growler"];
            
            // puppy.cuddleFactor = puppyDictionary[@"cuddle_factor"];
            //juice.smootheePrice = smootheeDictionary[@"regular"];
            [smootheeArray addObject:juice];

            
        }
        
        
    }
    
    
    
    return smootheeArray;
    
}
//    }
//    
//    return nil;

}






@end
