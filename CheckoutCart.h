//
//  CheckoutCart.h
//  Salud Juicery ios
//
//  Created by Salud Juice Team (Vigneshwarr)on 9/21/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Juice.h"
#import "Addin.h"
#import "Smoothee.h"
#import "Bowl.h"
#import "HealthShot.h"
#import "HotDrink.h"
#import "Coffee.h"

@interface CheckoutCart : NSObject{
    
    
}


+ (CheckoutCart *)sharedInstance;

- (NSMutableArray*)juicesInCart;

- (NSMutableArray*)bowlsInCart;

- (NSMutableArray*)smootheesInCart;

- (NSMutableArray*)healthshotsInCart;

- (NSMutableArray*)hotdrinksInCart;

- (NSMutableArray*)coffeesInCart;

@property (strong, nonatomic) NSMutableDictionary *juiceDict;

@property (strong, nonatomic) NSMutableDictionary *addinDict;

@property (strong, nonatomic) NSMutableDictionary *quantity;

@property (nonatomic, assign) NSMutableArray* addinPrice;

@property (strong, nonatomic) NSString* instructions; //special instructions

@property (strong, nonatomic) NSString* userId; // It store the user id

@property (strong, nonatomic) NSString* userEmail; // To store the user email.


//@property (nonatomic, strong) NSMutableDictionary* itemDetails;
//
//@property (nonatomic, strong) NSMutableArray* allItemDetails;

@property (strong, nonatomic) NSString *allItems;

@property (strong, nonatomic) NSString *allItemName;

- (NSArray*)addinsInCart;


//- (BOOL)containsJuice:(Juice*)juice;

- (void)addJuice:(Juice*)juice;


- (void)addSmoothee:(Smoothee*)smoothee;
- (void)addBowl:(Bowl*)bowl;
- (void)addHealthShot:(HealthShot*)healthshot;
- (void)addHotDrink:(HotDrink*)hotdrink;
- (void)addCoffee:(Coffee*)coffee;
- (void)addAddin:(NSMutableArray *)addin second: (NSString *) category;

- (void)addJuiceCount:(NSNumber *)juicecount;

- (void)addBowlCount:(NSNumber *)bowlcount;

- (void)addSmootheeCount:(NSNumber *)smootheecount;

- (void)addHealthshotCount:(NSNumber *)healthshotcount;

- (void)addHotdrinkCount:(NSNumber *)hotdrinkcount;

- (void)addCoffeeCount:(NSNumber *)coffeecount;


- (void)addJuiceCountValue:(Juice *)juicevalue;


- (void)removeJuice:(Juice*)juice;

- (void)clearCart;

- (NSNumber*)total;



@end






