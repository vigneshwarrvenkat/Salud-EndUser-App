//
//  CoffeeCell.m
//  Salud Juicery ios
//
//  Created by Salud Juice Team (Vigneshwarr)on 11/17/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import "CoffeeCell.h"

@implementation CoffeeCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
    
    
    self.itemCoffee = @[@"Item 1", @"Item 2", @"Item 3", @"Item 4", @"Item 5"];
}

@end