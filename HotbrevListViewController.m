//
//  HotbrevListViewController.m
//  Salud Juicery ios
//
//  Created by Salud Juice Team (Vigneshwarr)on 9/13/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import "HotbrevListViewController.h"
#import "HotbrevCell.h"
#import "JuiceDetailViewController.h"

#import "HotDrink.h"
#import "HotDrinks.h"
#import "Reachability.h"




@interface HotbrevListViewController ()

@property (nonatomic, strong) NSMutableArray *hotbrevArray;

@property (assign, nonatomic) NSInteger selectedIndex;

@property (strong, nonatomic) IBOutlet UITableView *tableView;



@end

@implementation HotbrevListViewController

NSString* statusHotConnection = @"";

@synthesize tableView;

//
//  SmootheesListViewController.m
//  Salud Juicery ios
//
//  Created by Salud Juice Team on 9/13/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"HotbrevListViewController viewWillAppear");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
    //Below code checks whether internet connection is there or not
    
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    
    if (networkStatus == NotReachable) {
        
        statusHotConnection = @"No";
        
        // [displayMessage:@"No Internet Connection available..Please try again later."];
        
    } else
        
    {
    
    [self.tableView registerNib:[UINib nibWithNibName:@"HotbrevCell" bundle:nil] forCellReuseIdentifier:@"HotbrevCell"];
    
     
    
    self.str6 = @"HotDrink";
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
    if ([statusHotConnection isEqualToString:@"No"]){
       
        return 1;
    }
    else{
    
    return [HotDrinks sharedInstance].allHotDrinks.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    /*
    static NSString *cellIdentifier = @"HotbrevCell";
    HotbrevCell *cell = (HotbrevCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    cell.hotbrevImageView.image = [UIImage imageNamed:_hotbrevArray[indexPath.row]];
    cell.hotbrevNameLabel.text = [NSString stringWithFormat:@"Hotbrev %ld",(long)indexPath.row];
    
    return cell;
    */
     if (![statusHotConnection isEqualToString:@"No"]){
    
    
    HotDrink* hotdrink = [HotDrinks sharedInstance].allHotDrinks[indexPath.row];
    
    HotbrevCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"HotbrevCell"];
    //  [cell.puppyImageView setImageWithURL:[NSURL URLWithString:puppy.photoURL]];
    cell.hotbrevNameLabel.text =  hotdrink.hotName;
    cell.hotbrevIngredients.text = hotdrink.hotIngredients;
    cell.hotbrevPrice.text = [hotdrink.hotPrice stringValue];
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
    
    wc.hotdrink = [HotDrinks sharedInstance].allHotDrinks[self.selectedIndex];
    
    wc.str2 = _str6;
    
    [self.navigationController pushViewController:wc animated:YES];}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

@end
