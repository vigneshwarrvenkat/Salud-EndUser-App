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



@interface HotbrevListViewController ()

@property (nonatomic, strong) NSMutableArray *hotbrevArray;

@property (assign, nonatomic) NSInteger selectedIndex;

@property (strong, nonatomic) IBOutlet UITableView *tableView;



@end

@implementation HotbrevListViewController

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
    
   
    
    [self.tableView registerNib:[UINib nibWithNibName:@"HotbrevCell" bundle:nil] forCellReuseIdentifier:@"HotbrevCell"];
    
     self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    self.str6 = @"HotDrink";
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [HotDrinks sharedInstance].allHotDrinks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    /*
    static NSString *cellIdentifier = @"HotbrevCell";
    HotbrevCell *cell = (HotbrevCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    cell.hotbrevImageView.image = [UIImage imageNamed:_hotbrevArray[indexPath.row]];
    cell.hotbrevNameLabel.text = [NSString stringWithFormat:@"Hotbrev %ld",(long)indexPath.row];
    
    return cell;
    */
    
    
    
    HotDrink* hotdrink = [HotDrinks sharedInstance].allHotDrinks[indexPath.row];
    
    HotbrevCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"HotbrevCell"];
    //  [cell.puppyImageView setImageWithURL:[NSURL URLWithString:puppy.photoURL]];
    cell.hotbrevNameLabel.text =  hotdrink.hotName;
    cell.hotbrevIngredients.text = hotdrink.hotIngredients;
    cell.hotbrevPrice.text = [hotdrink.hotPrice stringValue];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
    

    
    
    
    
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
