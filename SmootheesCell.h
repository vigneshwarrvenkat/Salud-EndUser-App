//
//  SmootheesCell.h
//  Salud Juicery ios
//
//  Created by Salud Juice Team (Vigneshwarr)on 9/13/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DYAlertPickView.h"

@interface SmootheesCell : UITableViewCell< DYAlertPickViewDataSource, DYAlertPickViewDelegate >

@property (nonatomic, strong) IBOutlet UIImageView *smootheesImageView;
@property (nonatomic, strong) IBOutlet UILabel *smootheesNameLabel;


@property (nonatomic, strong) IBOutlet UILabel *smootheesIngredientsLabel;


@property (weak, nonatomic) IBOutlet UILabel *valueCountSmoothee;
@property (weak, nonatomic) IBOutlet UILabel *priceSmoothee;
@property NSArray *item;

@end
