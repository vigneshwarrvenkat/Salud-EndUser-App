//
//  WistListViewController.m
//  Salud Juicery ios
//
//  Created by Salud Juice Team (Vigneshwarr) on 10/14/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import "WistListViewController.h"
#import "SWRevealViewController.h"

@interface WistListViewController ()

@end

@implementation WistListViewController


//Loads when the controller is initiated


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    self.loyaltyImageView.image = [UIImage imageNamed:self.loyaltyFilename];
    
    //  SWRevealViewController *revealViewController = self.revealViewController;
    
    
    [self.sidebarloyaltyButton setTarget: self.revealViewController];
    [self.sidebarloyaltyButton setAction: @selector( revealToggle: )];
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
