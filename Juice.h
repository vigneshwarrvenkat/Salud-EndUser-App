//
//  Juice.h
//  Salud Juicery ios
//
//  Created by Salud Juice Team (Vigneshwarr)on 9/7/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Juice : NSObject

@property (strong, nonatomic) NSString* thumbnail;

@property (strong, nonatomic) NSNumber* ID;
@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* ingredients;
@property (strong, nonatomic) NSString* photoURL;
@property (strong, nonatomic) NSNumber* countValue;


@property (strong, nonatomic) NSNumber* price;        //$$
@property (strong, nonatomic) NSNumber* quantity;    //lbs
//@property (strong, nonatomic) NSNumber* maxHeight;    //in
@property (strong, nonatomic) NSNumber* cuddleFactor; //out of 5



@end
