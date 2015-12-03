//
//  JuicesListViewController.m
//  Salud Juicery ios
//
//  Created by Salud Juice Team (Vigneshwarr)on 9/6/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import "JuicesListViewController.h"
#import "JuicesCell.h"
//#import "JuiceDetailViewController.h"
//#import "Juice.h"
#import "JuiceDetailViewController.h"
//#import "AFNetworking.h"
#import "JuicesCell.h"
#import "Juice.h"
#import "Juices.h"
#import "Global.h"
#import "Reachability.h"



@interface JuicesListViewController ()<UITableViewDataSource, UITableViewDelegate>

//@property (nonatomic, strong) NSMutableArray *juiceListArray;


@property (assign, nonatomic) NSInteger selectedIndex;
@property (strong, nonatomic) IBOutlet UITableView* tableView;

@end

@implementation JuicesListViewController

NSString* statusJuiceConnection = @"";

@synthesize juices;
@synthesize tableView;
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"JuicesListViewController viewWillAppear");
    NSLog(@"This is the current tab index : %ld",(long)self.selectedIndex);
}

- (void)viewDidLoad {
    
  //  [self loadRecipes];
    [super viewDidLoad];
    
   
    
    //Below code checks whether internet connection is there or not
    
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    
    if (networkStatus == NotReachable) {
        
       statusJuiceConnection = @"No";
        
        // [displayMessage:@"No Internet Connection available..Please try again later."];
        
    } else
        
    {

    
    [self.tableView registerNib:[UINib nibWithNibName:@"JuicesCell" bundle:nil] forCellReuseIdentifier:@"JuicesCell"];
    
    self.str1 = @"Juice";
    
   // [tableView reloadData];
        
    }
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
}


#pragma mark - UITableViewDataSource methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    
     if (![statusJuiceConnection isEqualToString:@"No"]){
         
    
    return [Juices sharedInstance].allJuices.count;
     }
         else{
             return 1;
         }
}


#pragma mark - UITableViewDelegate methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    /*
    static NSString *cellIdentifier = @"JuicesCell";
    JuicesCell *cell = (JuicesCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell){
        cell = [[JuicesCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    
    cell.juiceImageView.image = [UIImage imageNamed:_juiceListArray[indexPath.row]];
    cell.juiceNameLabel.text = [NSString stringWithFormat:@"Juices %ld",(long)indexPath.row];
    
    return cell;
    
    */
    
     if (![statusJuiceConnection isEqualToString:@"No"]){
    
    JuicesCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"JuicesCell"];
    
    
    
    
    
    
    Juice* juice = [Juices sharedInstance].allJuices[indexPath.row];
    
   // JuicesCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"JuicesCell"];
  //  [cell.puppyImageView setImageWithURL:[NSURL URLWithString:puppy.photoURL]];
    cell.juiceNameLabel.text =  juice.name;
    
    NSLog(@"%@", juice.name);
    
    cell.ingredientsLabel.text = juice.ingredients;
    cell.priceJuice.text = [juice.price stringValue];
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
    
    /*
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    JuiceDetailViewController *detailVC = [[JuiceDetailViewController alloc]initWithNibName:@"JuiceDetailViewController" bundle:nil];
    
   // detailVC.str2=str1;
     
    
    [self.navigationController pushViewController:detailVC animated:YES];
    
    */
    
     self.selectedIndex = indexPath.row;
   // [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    JuiceDetailViewController *wc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"JuiceDetailViewController"];
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    wc.juice = [Juices sharedInstance].allJuices[self.selectedIndex];
    
    wc.str2=_str1;
    
    [self.navigationController pushViewController:wc animated:YES];
    
    
    
    
    /*
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    JuiceDetailViewController *wc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"JuiceDetailViewController"];
    [self.navigationController pushViewController:wc animated:YES];
    */
    
    
    
    
    /*
    
    
    self.selectedIndex = indexPath.row;
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self performSegueWithIdentifier:@"toPuppyViewController" sender:nil];

    */
    
    
    
    
    
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}


- (void)loadRecipes
{
    NSString* url = @"http://content.guardianapis.com/search?api-key=test";
    Json *myJsonParser = [[Json alloc]init];
    [myJsonParser startLoadingObjectWithUrl:url andDelegate:self];
}

    



































#pragma mark - UIStoryboard methods

/*


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    JuiceDetailViewController* viewController = (JuiceDetailViewController*) segue.destinationViewController;
    viewController.juice = [Juices sharedInstance].allJuices[self.selectedIndex];
}


*/






















@end
