//
//  CheckoutViewController.m
//  Salud Juicery ios
//
//  Created by Salud Juice Team on 10/25/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import "CheckoutViewController.h"
#import "CheckoutCell.h"
#import "SubTotalCell.h"
#import "CheckoutCart.h"
#import "RWStripeViewController.h"

@interface CheckoutViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIView *continueButtonView;
@property (strong, nonatomic) IBOutlet UIButton *continueButton;

@property (strong, nonatomic) CheckoutCart* checkoutCart;

@end

@implementation CheckoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.checkoutCart = [CheckoutCart sharedInstance];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource methods

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return (section == 0) ? @"Juices " : @"";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return (section == 0) ? self.checkoutCart.juicesInCart.count : 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        Juice* juice = self.checkoutCart.juicesInCart[indexPath.row];
        CheckoutCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"CheckoutCell"];
        cell.juiceNameLabel.text =  juice.name;
        cell.juiceIngredientLabel.text = juice.ingredients;
        cell.priceLabel.text = [NSString stringWithFormat:@"$%@", juice.price];
        return cell;
    }
    else {
        SubTotalCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"TotalCell"];
        cell.totalLabel.text = [NSString stringWithFormat:@"$%@", [self.checkoutCart total]];
        return cell;
    }
    
    return nil;
}

#pragma mark - UITableViewDelegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

-(IBAction)ButtonClicked
{ //Navigation on buttons click event from ViewControlerOne to ViewControlerTwo with transferring data or string..
    
    
    
    RWStripeViewController *wc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"RWStripeViewController"];
    [self.navigationController pushViewController:wc animated:YES];
    
    
}


@end
