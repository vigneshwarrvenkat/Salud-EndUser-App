//
//  HealthShot.h
//  Salud Juicery ios
//
//  Created by Salud Juice Team (Vigneshwarr)on 11/2/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HealthShot : NSObject



@property (strong, nonatomic) NSString* thumbnail;

@property (strong, nonatomic) NSNumber* healthID;
@property (strong, nonatomic) NSString* healthName;
@property (strong, nonatomic) NSString* healthIngredients;
@property (strong, nonatomic) NSString* healthshotInstructions;

@property (strong, nonatomic) NSNumber* healthPrice;        //$$
@property (strong, nonatomic) NSNumber* healthQuantityPetite;

@property (strong, nonatomic) NSNumber* healthQuantityRegular;

@property (strong, nonatomic) NSNumber* healthQuantityGrowler;

@end
