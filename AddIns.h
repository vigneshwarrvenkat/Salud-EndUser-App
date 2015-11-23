//
//  AddIns.h
//  Salud Juicery ios
//
//  Created by Salud Juice Team (Vigneshwarr)on 10/30/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddIns : NSObject

@property (strong, readonly, nonatomic) NSArray *allAddins;

+ (AddIns *)sharedInstance;



@end



