//
//  Smoothees.h
//  Salud Juicery ios
//
//  Created by Salud Juice Team (Vigneshwarr)on 10/31/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Smoothees : NSObject


@property (strong, readonly, nonatomic) NSArray *allSmoothees;

+ (Smoothees *)sharedInstance;

@end
