//
//  BCheckoutCell.h
//  Salud Juicery ios
//
//  Created by Salud Juice Team (Vigneshwarr)on 11/4/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BCheckoutCell : UITableViewCell


@property (strong, nonatomic) IBOutlet UILabel *bowlNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *bowlIngredientLabel;
@property (strong, nonatomic) IBOutlet UILabel *bowlpriceLabel;
@property (strong, nonatomic) IBOutlet UILabel *bowladdinpriceLabel;

@property (strong, nonatomic) IBOutlet UILabel *bowlCount;

@property (strong, nonatomic) IBOutlet UILabel *bowlType;


@end
