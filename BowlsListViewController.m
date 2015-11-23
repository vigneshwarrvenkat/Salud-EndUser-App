//
//  BowlsListViewController.m
//  Salud Juicery ios
//
//  Created by Salud Juice Team (Vigneshwarr) on 9/6/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import "BowlsListViewController.h"
#import "BowlsCell.h"
#import "JuiceDetailViewController.h"
#import "MenuDetailsViewController.h"

#import "Bowl.h"
#import "Bowls.h"
#import "BowlsCell.h"

@interface BowlsListViewController ()<UITableViewDataSource, UITableViewDelegate>

//@property (nonatomic, strong) NSMutableArray *bowlsArray;

@property NSArray *item;

@property (assign, nonatomic) NSInteger selectedIndex;
@property (strong, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation BowlsListViewController

@synthesize bowls;
@synthesize tableView;

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"BowlsListViewController viewWillAppear");
   
}

- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    
        self.item = @[@"Item 1", @"Item 2", @"Item 3", @"Item 4", @"Item 5"];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"BowlsCell" bundle:nil] forCellReuseIdentifier:@"BowlsCell"];
    
    self.str3 = @"Bowl";
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [Bowls sharedInstance].allBowls.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    /*
    
    static NSString *cellIdentifier = @"BowlsCell";
    BowlsCell *cell = (BowlsCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    cell.bowlImageView.image = [UIImage imageNamed:_bowlsArray[indexPath.row]];
    cell.bowlNameLabel.text = [NSString stringWithFormat:@"Bowls %ld",(long)indexPath.row];
    return cell;
    
    */
    Bowl* bowl = [Bowls sharedInstance].allBowls[indexPath.row];
    
    BowlsCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"BowlsCell"];
    //  [cell.puppyImageView setImageWithURL:[NSURL URLWithString:puppy.photoURL]];
    cell.bowlNameLabel.text =  bowl.bowlName;
    
    NSLog(@"%@", bowl.bowlName);

    
    cell.bowlIngredientLabel.text = bowl.bowlIngredients;
    cell.bowlPrice.text = [bowl.bowlPrice stringValue];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    /*
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
JuiceDetailViewController *wc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"JuiceDetailViewController"];
    [self.navigationController pushViewController:wc animated:YES];
     
     
     */
    
    
    self.selectedIndex = indexPath.row;
    // [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    JuiceDetailViewController *wc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"JuiceDetailViewController"];
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    wc.bowl = [Bowls sharedInstance].allBowls[self.selectedIndex];
    
    wc.str2 = _str3;
    
    [self.navigationController pushViewController:wc animated:YES];
    
    
    
    
  //  JuiceDetailViewController *detailVC = [[JuiceDetailViewController alloc]initWithNibName:@"JuiceDetailViewController" bundle:nil];
   // [self.navigationController pushViewController:detailVC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}


- (void)loadRecipes
{
    NSString* url = @"http://content.guardianapis.com/search?api-key=test";
    Json *myJsonParser = [[Json alloc]init];
    [myJsonParser startLoadingObjectWithUrl:url andDelegate:self];
}


@end
