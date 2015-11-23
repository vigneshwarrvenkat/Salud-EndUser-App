//
//  CoffeeViewController.m
//  Salud Juicery ios
//
//  Created by Salud Juice Team (Vigneshwarr) on 11/17/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import "CoffeeViewController.h"
#import "CoffeeCell.h"
#import "JuiceDetailViewController.h"
#import "MenuDetailsViewController.h"

#import "Coffee.h"
#import "Coffees.h"


@interface CoffeeViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *coffeesArray;

@property NSArray *item;

@property (assign, nonatomic) NSInteger selectedIndex;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CoffeeViewController



@synthesize tableView;

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"CoffeeViewController viewWillAppear");
    
}

- (void)viewDidLoad {
    
    // loads the view when the controller is initiated
    [super viewDidLoad];
    
    self.item = @[@"Item 1", @"Item 2", @"Item 3", @"Item 4", @"Item 5"];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CoffeeCell" bundle:nil] forCellReuseIdentifier:@"CoffeeCell"];
    
    self.str7 = @"Coffee";
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [Coffees sharedInstance].allCoffees.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //Table view delegate-populatess the row based on the index path
    
    
    
    Coffee* coffee = [Coffees sharedInstance].allCoffees[indexPath.row];
    
    CoffeeCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"CoffeeCell"];
    
    cell.coffeesNameLabel.text =  coffee.coffeeName;
    
    NSLog(@"%@", coffee.coffeeName);
    
    
    cell.coffeesIngredientsLabel.text = coffee.coffeeIngredients;
    cell.priceCoffee.text = [coffee.coffeePrice stringValue];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //Populates the cell for every row based on the data soure of the table view
    
    
    
    
    self.selectedIndex = indexPath.row;
    // [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    JuiceDetailViewController *wc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"JuiceDetailViewController"];
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    wc.coffee = [Coffees sharedInstance].allCoffees[self.selectedIndex];
    
    wc.str2 = _str7;
    
    [self.navigationController pushViewController:wc animated:YES];
    
    
    
    
    //  JuiceDetailViewController *detailVC = [[JuiceDetailViewController alloc]initWithNibName:@"JuiceDetailViewController" bundle:nil];
    // [self.navigationController pushViewController:detailVC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //returns the height of the row
    return 60;
}




@end
