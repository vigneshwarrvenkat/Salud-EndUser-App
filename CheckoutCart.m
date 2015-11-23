//
//  CheckoutCart.m
//  Salud Juicery ios
//
//  Created by Salud Juice Team (Vigneshwarr)on 9/21/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import "CheckoutCart.h"
@import UIKit.UIAlertView;


@interface CheckoutCart()

@property (strong, nonatomic) NSMutableArray* juicesArray;

@property (strong, nonatomic) NSMutableArray* bowlsArray;

@property (strong, nonatomic) NSMutableArray* smootheesArray;

@property (strong, nonatomic) NSMutableArray* healthshotsArray;

@property (strong, nonatomic) NSMutableArray* hotdrinksArray;

@property (strong, nonatomic) NSMutableArray* coffeesArray;

@property (nonatomic, assign) NSNumber* juiceCount;

@property (nonatomic, assign) NSNumber* bowlCount;
@property (nonatomic, assign) NSNumber* smootheeCount;
@property (nonatomic, assign) NSNumber* healthshotCount;
@property (nonatomic, assign) NSNumber* hotdrinkCount;
@property (nonatomic, assign) NSNumber* coffeeCount;




@property (nonatomic, assign) Juice * juicevalue;



@end

@implementation CheckoutCart




- (id)init {
    self = [super init];
    if (self) {
        //Custom initialization
        self.juicesArray = [[NSMutableArray alloc] init];
        self.bowlsArray = [[NSMutableArray alloc] init];
        self.smootheesArray = [[NSMutableArray alloc] init];
        self.healthshotsArray = [[NSMutableArray alloc] init];
        self.hotdrinksArray = [[NSMutableArray alloc] init];
        self.coffeesArray = [[NSMutableArray alloc] init];

         _juiceDict = [[NSMutableDictionary alloc] init];
        
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


- (NSArray*)bowlsInCart {
    return self.bowlsArray;
}


- (NSArray*)smootheesInCart {
    return self.smootheesArray;
}

- (NSArray*)healthshotsInCart {
    return self.healthshotsArray;
}

- (NSArray*)hotdrinksInCart {
    return self.hotdrinksArray;
}

- (NSArray*)coffeesInCart {
    return self.coffeesArray;
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
    
    
    for (Juice* juice in self.juicesInCart) {
    
    [_juiceDict setObject:self.juiceCount forKey: juice.name];
    }
    
    
    
    
    
    
    for(Juice *value in _juiceDict){
        
       NSString *values = [_juiceDict objectForKey:juice.name];
        
        NSLog(@" dic :%@",values);
        
        
        NSLog(@" dic :%@",juice.name);
    }
    
    
    
    
}


- (void)addJuiceCount:(NSNumber *)juicecount {
    
    self.juiceCount = juicecount;
    
    self.juicevalue.countValue = juicecount;
    
    NSLog(@"originl juivalue :%@",self.juiceCount);
    
    

}


- (void)addBowlCount:(NSNumber *)bowlcount {
    
    self.bowlCount = bowlcount;
    
    NSLog(@"originl bowvalue :%@",self.bowlCount);
    
}


- (void)addSmootheeCount:(NSNumber *)smootheecount {
    
    self.smootheeCount = smootheecount;
    
    NSLog(@"originl smvalue :%@",self.smootheeCount);
    
}

- (void)addHealthshotCount:(NSNumber *)healthshotcount {
    
    self.healthshotCount = healthshotcount;
    
    NSLog(@"originl helatvalue :%@",self.healthshotCount);
    
}

- (void)addHotdrinkCount:(NSNumber *)hotdrinkcount {
    
    self.hotdrinkCount = hotdrinkcount;
    
    NSLog(@"originl hotvalue :%@",self.hotdrinkCount);
    
}


- (void)addCoffeeCount:(NSNumber *)coffeecount {
    
    self.coffeeCount = coffeecount;
    
    NSLog(@"originl hotvalue :%@",self.coffeeCount);
    
}



- (void)addSmoothee:(Smoothee *)smoothee{
    
    [self.smootheesArray addObject:smoothee];
    
    for (Smoothee* smoothee in self.smootheesInCart) {
        
        [_juiceDict setObject:self.smootheeCount forKey: smoothee.smootheeName];
    }
    
    
}


- (void)addBowl:(Bowl *)bowl {
    
    [self.bowlsArray addObject:bowl];
    
    for (Bowl* bowl in self.bowlsInCart) {
        
        NSLog(@"Bowl Count: %@",self.bowlCount);
        
        
        if(self.bowlCount == NULL){
            
            

            
        }
        else{
            
            [_juiceDict setObject:self.bowlCount forKey: bowl.bowlName];
            
        }
        
    }
    
    
    
}

- (void)addHealthShot:(HealthShot *)healthshot {
    
    [self.healthshotsArray addObject:healthshot];
    
    for (HealthShot* healthshot in self.healthshotsInCart) {
        
        [_juiceDict setObject:self.healthshotCount forKey: healthshot.healthName];
    }
    
}


- (void)addHotDrink:(HotDrink *)hotdrink {
    
    [self.hotdrinksArray addObject:hotdrink];
    
    for (HotDrink* hotdrink in self.hotdrinksInCart) {
        
        [_juiceDict setObject:self.hotdrinkCount forKey: hotdrink.hotName];
    }
    
}


- (void)addCOffee:(Coffee *)coffee {
    
    [self.coffeesArray addObject:coffee];
    
    for (Coffee* coffee in self.coffeesInCart) {
        
        [_juiceDict setObject:self.coffeeCount forKey: coffee.coffeeName];
    }
    
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
            
    NSNumber *valueCount = [_juiceDict objectForKey:juice.name];
            
    NSLog(@" dic :%@",valueCount);
        
    long double lnumber = [valueCount doubleValue];
            
    NSLog(@" dic :%@",juice.name);
        
        total += [juice.price doubleValue];
        total *= lnumber;
        
    }
    for (Bowl* bowl in self.bowlsInCart) {
        
        NSNumber *valueCount = [_juiceDict objectForKey:bowl.bowlName];
        long double lnumber = [valueCount doubleValue];

        
        total += [bowl.bowlPrice doubleValue];
        total *= lnumber;
        
    }
    for (Smoothee* smoothee in self.smootheesInCart) {
        
        NSNumber *valueCount = [_juiceDict objectForKey:smoothee.smootheeName];
        long double lnumber = [valueCount doubleValue];
        total += [smoothee.smootheePrice doubleValue];
        total *= lnumber;
    }
    for (HealthShot* healthshot in self.healthshotsInCart) {
        
        NSNumber *valueCount = [_juiceDict objectForKey:healthshot.healthName];
        long double lnumber = [valueCount doubleValue];
        total += [healthshot.healthPrice doubleValue];
        total *= lnumber;
        
    }
    for (HotDrink* hotdrink in self.hotdrinksInCart) {
        
        NSNumber *valueCount = [_juiceDict objectForKey:hotdrink.hotName];
        long double lnumber = [valueCount doubleValue];
        total += [hotdrink.hotPrice doubleValue];
        total *= lnumber;
        
    }
    
    for (Coffee* coffee in self.coffeesInCart) {
        
        NSNumber *valueCount = [_juiceDict objectForKey:coffee.coffeeName];
        long double lnumber = [valueCount doubleValue];
        total += [coffee.coffeePrice doubleValue];
        total *= lnumber;
        
    }
    
    
    NSLog(@" total :%f",total);
    return @(total);
}

@end
