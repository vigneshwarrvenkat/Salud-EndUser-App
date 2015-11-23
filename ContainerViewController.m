//
//  ContainerViewController.m
//  Salud Juicery ios
//
//  Created by Salud Juice Team (Vigneshwarr) on 11/14/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import "ContainerViewController.h"
#import "JuiceDetailViewController.h"
#import "Header.h"

@interface ContainerViewController ()

@end

@implementation ContainerViewController

@synthesize categoryValue;

- (void)viewDidLoad {
    
    //loads the controller is initiated
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    

    
    
    arryList=[[NSMutableArray alloc] initWithObjects: @"Lemon",
              @"Almond",
              @"Ginger",
              @"Protein",
              @"Milk",
              @"Cashew",
              @"Grass",
              @"Onion",
              @"Honey",
              @"Pista",nil];
    
    
    arryListCost=[[NSMutableArray alloc] initWithObjects: @"$2.5",
                  @"$2.5",
                  @"$2.5",
                  @"$2.5",
                  @"$2.5",
                  @"$2.5",
                  @"$2.5",
                  @"$2.5",
                  @"$2.5",
                  @"$2.5",nil];
    
    
    
    [self.tableView setEditing:YES animated:YES];
    
    self.clearsSelectionOnViewWillAppear = NO;

    }



-(void)viewWillAppear:(BOOL)animated
{
    
    //loads when the views appears from the stack again
    [super viewWillAppear:animated];
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [arryList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];
    
    
    //Populates the cell based on the data from the table source
    
    
    /*
    static NSString *AddIn = @"Cell";
    cell = [tableView dequeueReusableCellWithIdentifier:AddIn];
    if(cell == nil){
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:AddIn];
    }
     
     */
    
    NSInteger row = indexPath.row;
    
    cell.detailTextLabel.textColor = [UIColor blackColor];
    
    cell.textLabel.text = [arryList objectAtIndex:row];
    
    cell.detailTextLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.detailTextLabel.numberOfLines = 0;
    
    
    cell.detailTextLabel.text = [arryListCost objectAtIndex:row];
    
    
    cell.tintColor = [UIColor blueColor];
    
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    //Enables selecting the data from the row.
    
    
    
    
    
  //  NSLog(@"category_value :%@",juice.str2);
    
  NSLog(@"category_value :%@",categoryValue);
    
    //This will hold Textlable which is on left side
    _leftText = cell.textLabel.text;
    _rightText = cell.detailTextLabel.text;
    
   // NSLog(@"%@ - %@",_leftText,_rightText);
    
    [self.delegate rowSelectedWithAddin:@{@"name" : [arryList objectAtIndex:indexPath.row], @"cost" : [arryListCost objectAtIndex:indexPath.row]}];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    //returns the row height
    return 40;
}








@end
