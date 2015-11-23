//
//  JuiceDetailViewController.h
//  Salud Juicery ios
//
//  Created by Salud Juice Team (Vigneshwarr)on 9/7/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//



#import <UIKit/UIKit.h>
#import "PAStepper.h"
#import "Juice.h"
#import "Smoothee.h"
#import "HealthShot.h"
#import "HotDrink.h"
#import "Bowl.h"
#import "Coffee.h"


#import "DropDownListView.h"
@import UIKit;

#import "ContainerViewController.h"

//Implements the delegates




@interface JuiceDetailViewController : UIViewController<kDropDownListViewDelegate, UITableViewDelegate, UITableViewDataSource>{
    
NSMutableArray *arryList;
    NSMutableArray *arryListCost;
    UITableView *addinView;
    BOOL checkboxSelectedRegular;
    BOOL checkboxSelectedPetite;
    BOOL checkboxSelectedGrowler;
    IBOutlet UIButton *checkboxPetite;
    IBOutlet UIButton *checkboxRegular;
    IBOutlet UIButton *checkboxGrowler;
    NSMutableArray *selectedIndexes;
    
    DropDownListView * Dropobj;
}


@property (strong, nonatomic) IBOutlet UISegmentedControl *quantityPressed;
@property (strong, nonatomic) IBOutlet UITableView *theTableView;


- (IBAction)quantityPressed:(UISegmentedControl *)sender;


- (IBAction)checkboxButton:(id)sender;

- (IBAction)DropDownPressed:(id)sender;
- (IBAction)DropDownSingle:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *lblSelectedCountryNames;

@property (weak, nonatomic) IBOutlet UIStepper *stepperCount;
@property (weak, nonatomic) IBOutlet UITableView *addinView;

@property (nonatomic,retain) IBOutlet UILabel *lblStepper;




//properties based on the Objects defined

@property (weak, nonatomic) IBOutlet PAStepper *paStepper;

@property (strong, nonatomic) Juice* juice;
@property (strong, nonatomic) HealthShot* healthshot;
@property (strong, nonatomic) HotDrink* hotdrink;

@property (strong, nonatomic) Smoothee* smoothee;

@property (strong, nonatomic) Bowl* bowl;

@property (strong, nonatomic) Coffee* coffee;



@property (nonatomic, strong) NSString *str2;

@property (nonatomic, strong) NSString *addinCategory;

@property (nonatomic, strong) NSString *str3;

@property (nonatomic, strong) NSNumber *val;





@end

