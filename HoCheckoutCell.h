//
//  HoCheckoutCell.h
//  Salud Juicery ios
//
//  Created by Salud Juice Team (Vigneshwarr)on 11/4/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HoCheckoutCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *hotdrinkNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *hotdrinkIngredientLabel;
@property (strong, nonatomic) IBOutlet UILabel *hotdrinkpriceLabel;
@property (strong, nonatomic) IBOutlet UILabel *hotdrinkaddinpriceLabel;

@property (strong, nonatomic) IBOutlet UILabel *hotCount;

@property (strong, nonatomic) IBOutlet UILabel *hotdrinType;



@end
