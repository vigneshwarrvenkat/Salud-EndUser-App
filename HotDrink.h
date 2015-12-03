//
//  HotDrink.h
//  Salud Juicery ios
//
//  Created by Salud Juice Team (Vigneshwarr)on 11/2/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HotDrink : NSObject


@property (strong, nonatomic) NSString* thumbnail;

@property (strong, nonatomic) NSNumber* hotID;
@property (strong, nonatomic) NSString* hotName;
@property (strong, nonatomic) NSString* hotIngredients;
@property (strong, nonatomic) NSString* hotInstructions;

@property (strong, nonatomic) NSNumber* hotPrice;        //$$
@property (strong, nonatomic) NSNumber* hotQuantityPetite;
@property (strong, nonatomic) NSNumber* hotQuantityRegular;

@property (strong, nonatomic) NSNumber* hotQuantityGrowler;

@end
