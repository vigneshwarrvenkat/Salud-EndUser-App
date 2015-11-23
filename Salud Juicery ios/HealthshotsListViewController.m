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




@interface HealthshotsListViewController ()

@property (nonatomic, strong) NSMutableArray *healthshotsArray;
@property (assign, nonatomic) NSInteger selectedIndex;

@property (strong, nonatomic) IBOutlet UITableView *tableView;



@end



@implementation HealthshotsListViewController

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
    
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"HealthshotsCell" bundle:nil] forCellReuseIdentifier:@"HealthshotsCell"];
    
    self.str5 = @"HealthShot";
    
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    
    return [HealthShots sharedInstance].allHealthShots.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    /*
    static NSString *cellIdentifier = @"HealthshotsCell";
    HealthshotsCell *cell = (HealthshotsCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    cell.healthshotsImageView.image = [UIImage imageNamed:_healthshotsArray[indexPath.row]];
    cell.healthshotsNameLabel.text = [NSString stringWithFormat:@"healthshots %ld",(long)indexPath.row];
    return cell;
     
     */
    
    
    HealthShot* healthshot = [HealthShots sharedInstance].allHealthShots[indexPath.row];
    
    HealthshotsCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"HealthshotsCell"];
    //  [cell.puppyImageView setImageWithURL:[NSURL URLWithString:puppy.photoURL]];
    cell.healthshotsNameLabel.text =  healthshot.healthName;
    cell.healthshotsIngredients.text = healthshot.healthIngredients;
    cell.healthshotsPrice.text = [healthshot.healthPrice stringValue];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
    
    
    
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
