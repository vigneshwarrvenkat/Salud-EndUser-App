//
//  HomeViewController.m
//  Salud Juicery ios
//
//  Created by Salud Juice Team (Vigneshwarr)on 9/13/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import "HomeViewController.h"
#import "SWRevealViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController



//Loads when the controller is initiated

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Salud Juicery";
    
    
    
    //Designing a custom tool bar
    
    
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    [toolbar setBarStyle:UIBarStyleBlackTranslucent];
    [toolbar sizeToFit];
    UIBarButtonItem *buttonflexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *buttonDone = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneClicked:)];
    
    [toolbar setItems:[NSArray arrayWithObjects:buttonflexible,buttonDone, nil]];
    
    
    
    
   // textFieldDatePicker.inputAccessoryView = toolbar;
    textFieldTextPicker.inputAccessoryView = toolbar;
  //  textFieldTimePicker.inputAccessoryView = toolbar;
  //  textFieldOptionalTextPicker.inputAccessoryView = toolbar;
    
    
    
    
    //For UIPicker for selection of the Shop
    
    textFieldTextPicker.isOptionalDropDown = NO;
    [textFieldTextPicker setItemList:[NSArray arrayWithObjects:@"Shadyside",@"Swickley", nil]];
    
    
    
    
    
   // [textFieldOptionalTextPicker setItemList:[NSArray arrayWithObjects:@"London",@"Johannesburg",@"Moscow",@"Mumbai",@"Tokyo",@"Sydney", nil]];
    
  //  [textFieldDatePicker setDropDownMode:IQDropDownModeDatePicker];
    
   // [textFieldTimePicker setDropDownMode:IQDropDownModeTimePicker];
    // Do any additional setup after loading the view, typically from a nib.

    
    
    
    
    //Initiating the Sliding controller
    
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
     
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}







-(void)doneClicked:(UIBarButtonItem*)button
{
    [self.view endEditing:YES];
}



@end
