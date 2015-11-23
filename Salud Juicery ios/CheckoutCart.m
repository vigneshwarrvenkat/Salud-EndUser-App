//
//  CheckoutCart.m
//  Salud Juicery ios
//
//  Created by Salud Juice Team on 9/21/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import "CheckoutCart.h"


@interface CheckoutCart()

@property (strong, nonatomic) NSMutableArray* juicesArray;

@end

@implementation CheckoutCart

- (id)init {
    self = [super init];
    if (self) {
        //Custom initialization
        self.juicesArray = [[NSMutableArray alloc] init];
    }
    return self;
}


+ (CheckoutCart *)sharedInstance {
    static CheckoutCart*  _sharedCart;
    
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        _sharedCart = [[CheckoutCart alloc] init];
    });
    
    return _sharedCart;
}

- (NSArray*)juicesInCart {
    return self.juicesArray;
}

/*
- (BOOL)containsJuice:(Juice*)juice {
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"ID=%@", juice.ID];
    NSArray* duplicateJuices = [self.juicesArray filteredArrayUsingPredicate:predicate];
    return (duplicateJuices.count > 0) ? YES : NO;
}
*/

- (void)addJuice:(Juice *)juice {
    
        [self.juicesArray addObject:juice];
}

- (void)removeJuice:(Juice*)juice {
    [self.juicesArray removeObject:juice];
}

- (void)clearCart {
    self.juicesArray = [[NSMutableArray alloc] init];
}

- (NSNumber*)total {
    
    double total = 0.0;
    for (Juice* juice in self.juicesInCart) {
        total += [juice.price doubleValue];
        
    }
    return @(total);
}

@end
