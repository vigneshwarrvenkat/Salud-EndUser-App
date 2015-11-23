//
//  Bowl.h
//  Salud Juicery ios
//
//  Created by Salud Juice Team (Vigneshwarr)on 10/31/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bowl : NSObject


@property (strong, nonatomic) NSString* thumbnail;

@property (strong, nonatomic) NSNumber* bowlID;
@property (strong, nonatomic) NSString* bowlName;
@property (strong, nonatomic) NSString* bowlIngredients;
@property (strong, nonatomic) NSString* photoURL;

@property (strong, nonatomic) NSNumber* bowlPrice;        //$$
@property (strong, nonatomic) NSNumber* bowlQuantity;    //lbs
//@property (strong, nonatomic) NSNumber* maxHeight;    //in
//@property (strong, nonatomic) NSNumber* cuddleFactor; //out of 5




@end
