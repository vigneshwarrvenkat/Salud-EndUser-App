//
//  HealthshotsListViewController.m
//  Salud Juicery ios
//
//  Created by Salud Juice Team (Vigneshwarr)on 9/13/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import "HealthshotsListViewController.h"
#import "HealthshotsCell.h"
#import "JuiceDetailViewController.h"


#import "HealthShot.h"
#import "HealthShots.h"
#import "Reachability.h"





@interface HealthshotsListViewController ()

@property (nonatomic, strong) NSMutableArray *healthshotsArray;
@property (assign, nonatomic) NSInteger selectedIndex;

@property (strong, nonatomic) IBOutlet UITableView *tableView;



@end



@implementation HealthshotsListViewController

NSString* statusHealthConnection = @"";

@synthesize tableView;

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"HealthshotsListViewController viewWillAppear");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
    //Below code checks whether internet connection is there or not
    
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    
    if (networkStatus == NotReachable) {
        
        statusHealthConnection = @"No";
        
        // [displayMessage:@"No Internet Connection available..Please try again later."];
        
    } else
        
    {
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"HealthshotsCell" bundle:nil] forCellReuseIdentifier:@"HealthshotsCell"];
    
    self.str5 = @"HealthShot";
    
    
   
        
    }
    
     self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    
     if (![statusHealthConnection isEqualToString:@"No"]){
    
    
    return [HealthShots sharedInstance].allHealthShots.count;
         
     }
     else{
         return 1;
     }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    /*
    static NSString *cellIdentifier = @"HealthshotsCell";
    HealthshotsCell *cell = (HealthshotsCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    cell.healthshotsImageView.image = [UIImage imageNamed:_healthshotsArray[indexPath.row]];
    cell.healthshotsNameLabel.text = [NSString stringWithFormat:@"healthshots %ld",(long)indexPath.row];
    return cell;
     
     */
    
     if (![statusHealthConnection isEqualToString:@"No"]){
    
    HealthShot* healthshot = [HealthShots sharedInstance].allHealthShots[indexPath.row];
    
    HealthshotsCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"HealthshotsCell"];
    //  [cell.puppyImageView setImageWithURL:[NSURL URLWithString:puppy.photoURL]];
    cell.healthshotsNameLabel.text =  healthshot.healthName;
    cell.healthshotsIngredients.text = healthshot.healthIngredients;
    cell.healthshotsPrice.text = [healthshot.healthPrice stringValue];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
     }
     else{
         
         static NSString *CellIdentifier = @"newFriendCell";
         UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
         
         if (cell == nil) {
             cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
         }
         cell.textLabel.font = [cell.textLabel.font fontWithSize:14];
         cell.textLabel.numberOfLines = 0;
         cell.textLabel.textAlignment = NSTextAlignmentCenter;
         cell.textLabel.text = @"No Internet Connection. \nPlease Connect to the Internet...";
         
         return cell;
         
     }
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedIndex = indexPath.row;
    // [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    JuiceDetailViewController *wc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"JuiceDetailViewController"];
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    wc.healthshot = [HealthShots sharedInstance].allHealthShots[self.selectedIndex];
    
    wc.str2 = _str5;
    
    [self.navigationController pushViewController:wc animated:YES];
    

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

@end
