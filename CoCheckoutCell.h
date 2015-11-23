//
//  CoCheckoutCell.h
//  Salud Juicery ios
//
//  Created by Salud Juice Team (Vigneshwarr)on 11/17/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoCheckoutCell : UITableViewCell


@property (strong, nonatomic) IBOutlet UILabel *coffeeNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *coffeeIngredientLabel;
@property (strong, nonatomic) IBOutlet UILabel *coffeepriceLabel;
@property (strong, nonatomic) IBOutlet UILabel *coffeeaddinpriceLabel;

@property (strong, nonatomic) IBOutlet UILabel *coffeeType;

@property (strong, nonatomic) IBOutlet UILabel *coffeeCount;

@end
