//
//  CheckoutCell.h
//  Salud Juicery ios
//
//  Created by Salud Juice Team on 10/25/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheckoutCell : UITableViewCell


@property (strong, nonatomic) IBOutlet UILabel *juiceNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *juiceIngredientLabel;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong, nonatomic) IBOutlet UILabel *addinpriceLabel;

@end
