//
//  JuiceDetailViewController.h
//  Salud Juicery ios
//
//  Created by Salud Juice Team on 9/7/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//



#import <UIKit/UIKit.h>
#import "PAStepper.h"
#import "Juice.h"

#import "DropDownListView.h"
@import UIKit;

@interface JuiceDetailViewController : UIViewController<kDropDownListViewDelegate>{
    
NSArray *arryList;
    DropDownListView * Dropobj;
}

- (IBAction)DropDownPressed:(id)sender;
- (IBAction)DropDownSingle:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *lblSelectedCountryNames;





@property (weak, nonatomic) IBOutlet PAStepper *paStepper;

@property (strong, nonatomic) Juice* juice;



@end

