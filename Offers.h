//
//  Offers.h
//  Salud Juicery ios
//
//  Created by Salud Juice Team on 11/22/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Offers : NSObject


@property (strong, readonly, nonatomic) NSArray *allOffers;

+ (Offers *)sharedInstance;




@end
