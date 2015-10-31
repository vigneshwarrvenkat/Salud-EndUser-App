//
//  CheckoutCart.h
//  Salud Juicery ios
//
//  Created by Salud Juice Team on 9/21/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Juice.h"
#import "Addin.h"

@interface CheckoutCart : NSObject


+ (CheckoutCart *)sharedInstance;

- (NSArray*)juicesInCart;

- (NSArray*)addinsInCart;

- (BOOL)containsJuice:(Juice*)juice;

- (void)addJuice:(Juice*)juice;

- (void)removeJuice:(Juice*)juice;

- (void)clearCart;

- (NSNumber*)total;

@end






