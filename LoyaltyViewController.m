//
//  LoyaltyViewController.m
//  Salud Juicery ios
//
//  Created by Salud Juice Team (Vigneshwarr)on 9/13/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import "LoyaltyViewController.h"
#import "SWRevealViewController.h"
#import "RewardPointts.h"

@interface LoyaltyViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation LoyaltyViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
  //  SWRevealViewController *revealViewController = self.revealViewController;
   
    
        [self.sidebarloyaltyButton setTarget: self.revealViewController];
        [self.sidebarloyaltyButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
   
    
}
     
     

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
    
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [RewardPointts sharedInstance].allRewards.count;}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *AddIn = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:AddIn];
    if(cell == nil){
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:AddIn];
    }
    
    
    /*
    
    NSInteger row = indexPath.row;
    
    cell.detailTextLabel.textColor = [UIColor blackColor];
    
    cell.textLabel.text = [self.arryList objectAtIndex:row];
    
    cell.detailTextLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.detailTextLabel.numberOfLines = 0;
    
    
    cell.detailTextLabel.text = [self.arryListCost objectAtIndex:row];
    
    
    cell.tintColor = [UIColor blueColor];
    
    
    
    
    if([self.str2 isEqualToString:@"Juice"]){
        
        self.addinCategory = self.juice.name;
        
        
    }
    
    
    
    //For bowl to load
    
    if([self.str2 isEqualToString:@"Bowl"]){
        
        self.addinCategory = self.bowl.bowlName;
        
        
    }
    
    
    //For Smoothee to load
    
    if([self.str2 isEqualToString:@"Smoothee"]){
        
        self.addinCategory = self.smoothee.smootheeName;
        
    }
    
    
    
    //For healthshot to laoad
    
    if([self.str2 isEqualToString:@"HealthShot"]){
        
        self.addinCategory = self.healthshot.healthName;
    }
    
    
    //For Hot drink to load
    
    if([self.str2 isEqualToString:@"HotDrink"]){
        
        self.addinCategory = self.hotdrink.hotName;
        
    }
    
    
    //For Coffee to load
    
    if([self.str2 isEqualToString:@"Coffee"]){
        
        self.addinCategory = self.coffee.coffeeName;
        
    }
    
    */
    return cell;
}





-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    /*
    NSLog(@"ArryList --- %@", [self.arryList objectAtIndex:indexPath.row]);
    NSLog(@"ArryListCost --- %@", [self.arryListCost objectAtIndex:indexPath.row]);
    
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    //[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if(cell!= nil)
    {
        NSNumber *index = [NSNumber numberWithInteger:indexPath.row];
        
        if (selectedIndexes.count>0) {
            if ([selectedIndexes containsObject:index]) {
                
                [selectedIndexes removeObject:index];
                //                cell.accessoryType = UITableViewCellAccessoryNone;
                [tableView reloadData];
            }
            
            else
                [selectedIndexes addObject:index];
        }
        
        else
        {
            [selectedIndexes addObject:index];
        }
        
    }
    
    
    */
    
    
}




//Returns the height of the row



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}






@end
