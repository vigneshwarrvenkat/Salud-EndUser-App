//
//  Coffee.h
//  Salud Juicery ios
//
//  Created by Salud Juice Team (Vigneshwarr)on 11/17/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Coffee : NSObject

@property (strong, nonatomic) NSString* thumbnail;

@property (strong, nonatomic) NSNumber* coffeeID;
@property (strong, nonatomic) NSString* coffeeName;
@property (strong, nonatomic) NSString* coffeeIngredients;
@property (strong, nonatomic) NSString* photoURL;

@property (strong, nonatomic) NSNumber* coffeePrice;        //$$
@property (strong, nonatomic) NSNumber* coffeeQuantity;



@end
