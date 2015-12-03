//
//  Coffees.h
//  Salud Juicery ios
//
//  Created by Salud Juice Team (Vigneshwarr)on 11/17/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit.UIAlertView;

@interface Coffees : NSObject


@property (strong, readonly, nonatomic) NSArray *allCoffees;

+ (Coffees *)sharedInstance;



@end
