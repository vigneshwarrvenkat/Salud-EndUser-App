//
//  HotDrinks.h
//  Salud Juicery ios
//
//  Created by Salud Juice Team (Vigneshwarr)on 11/2/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HotDrinks : NSObject


@property (strong, readonly, nonatomic) NSArray *allHotDrinks;

+ (HotDrinks *)sharedInstance;

@end
