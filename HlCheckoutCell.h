//
//  HlCheckoutCell.h
//  Salud Juicery ios
//
//  Created by Salud Juice Team (Vigneshwarr)on 11/4/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HlCheckoutCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *healthNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *healthIngredientLabel;
@property (strong, nonatomic) IBOutlet UILabel *healthkpriceLabel;
@property (strong, nonatomic) IBOutlet UILabel *healthaddinpriceLabel;


@property (strong, nonatomic) IBOutlet UILabel *healthCount;

@property (strong, nonatomic) IBOutlet UILabel *healthType;

@end
