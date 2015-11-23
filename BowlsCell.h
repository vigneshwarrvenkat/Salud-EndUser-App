//
//  BowlsCell.h
//  Salud Juicery ios
//
//  Created by Salud Juice Team (Vigneshwarr)on 9/6/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DYAlertPickView.h"

@interface BowlsCell : UITableViewCell< DYAlertPickViewDataSource, DYAlertPickViewDelegate >

@property (nonatomic, strong) IBOutlet UIImageView *bowlImageView;
@property (nonatomic, strong) IBOutlet UILabel *bowlNameLabel;


@property (nonatomic, strong) IBOutlet UILabel *bowlIngredientLabel;

@property NSArray *item;


@property (weak, nonatomic) IBOutlet UIStepper *valuechangedBowl;

@property (weak, nonatomic) IBOutlet UILabel *bowlPrice;

@end
