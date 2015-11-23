//
//  SCheckoutCell.h
//  Salud Juicery ios
//
//  Created by Salud Juice Team (Vigneshwarr)on 11/4/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCheckoutCell : UITableViewCell


@property (strong, nonatomic) IBOutlet UILabel *smootheeNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *smootheeIngredientLabel;
@property (strong, nonatomic) IBOutlet UILabel *smootheepriceLabel;
@property (strong, nonatomic) IBOutlet UILabel *smootheeaddinpriceLabel;

@property (strong, nonatomic) IBOutlet UILabel *smootheeCount;

@property (strong, nonatomic) IBOutlet UILabel *smootheeType;


@end
