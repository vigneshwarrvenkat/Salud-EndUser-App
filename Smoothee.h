//
//  Smoothee.h
//  Salud Juicery ios
//
//  Created by Salud Juice Team (Vigneshwarr)on 10/31/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Smoothee : NSObject


@property (strong, nonatomic) NSString* thumbnail;

@property (strong, nonatomic) NSNumber* smootheeID;
@property (strong, nonatomic) NSString* smootheeName;
@property (strong, nonatomic) NSString* smootheeIngredients;
@property (strong, nonatomic) NSString* photoURL;

@property (strong, nonatomic) NSNumber* smootheePrice;        //$$
@property (strong, nonatomic) NSNumber* smootheeQuantity;    //lbs
//@property (strong, nonatomic) NSNumber* maxHeight;    //in
//@property (strong, nonatomic) NSNumber* cuddleFactor; //out of 5


@end
