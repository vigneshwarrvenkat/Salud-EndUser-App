//
//  Juices.h
//  Salud Juicery ios
//
//  Created by Salud Juice Team (Vigneshwarr)on 10/26/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Juices : NSObject

@property (strong, readonly, nonatomic) NSArray *allJuices;

+ (Juices *)sharedInstance;

@end
