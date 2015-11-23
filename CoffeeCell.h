//
//  CoffeeCell.h
//  Salud Juicery ios
//
//  Created by Salud Juice Team (Vigneshwarr)on 11/17/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoffeeCell : UITableViewCell


@property (nonatomic, strong) IBOutlet UIImageView *coffeesImageView;
@property (nonatomic, strong) IBOutlet UILabel *coffeesNameLabel;


@property (nonatomic, strong) IBOutlet UILabel *coffeesIngredientsLabel;


@property (weak, nonatomic) IBOutlet UILabel *valueCountCoffee;
@property (weak, nonatomic) IBOutlet UILabel *priceCoffee;
@property NSArray *itemCoffee;

@end
