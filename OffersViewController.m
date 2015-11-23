//
//  OffersViewController.m
//  Salud Juicery ios
//
//  Created by Salud Juice Team on 11/22/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import "OffersViewController.h"
#import "OffersCell.h"
#import "Offers.h"
#import "Offer.h"
#import "CheckoutCart.h"

@interface OffersViewController ()<UITableViewDataSource, UITableViewDelegate>


@property (strong, nonatomic) CheckoutCart* checkoutCart;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation OffersViewController

@synthesize tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.checkoutCart = [CheckoutCart sharedInstance];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/




#pragma mark - UITableViewDataSource methods
//assigns the title for every controller initiated
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    // return (section == 0) ? @"Juices " : @"";
    
    
    if (section == 0 && (unsigned long)self.checkoutCart.juicesInCart.count !=0){
        
        return @"Juices ";
        
    }
    
    
    if (section == 1 && (unsigned long)self.checkoutCart.bowlsInCart.count !=0){
        
        return @"Bowls ";
    }
    
    
    if (section == 2 && (unsigned long)self.checkoutCart.smootheesInCart.count !=0){
        return @"Smoothees ";
        
    }
    
    
    if (section == 3 && (unsigned long)self.checkoutCart.healthshotsInCart.count !=0){
        
        return @"Healthshots ";
    }
    
    
    if (section == 4 && (unsigned long)self.checkoutCart.hotdrinksInCart.count !=0){
        
        return @"Hotdrinks";
    }
    
    if (section == 4 && (unsigned long)self.checkoutCart.hotdrinksInCart.count !=0){
        
        return @"Coffee";
    }
    
    return @"";
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //return 6;
    
    
    return 1;
}




//returns the number of rows in section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSLog(@"section :%ld",(long)section);
    
    /*
     
     NSInteger val = (section == 0) ? (self.checkoutCart.juicesInCart.count + self.checkoutCart.bowlsInCart.count+ self.checkoutCart.smootheesInCart.count + self.checkoutCart.healthshotsInCart.count + self.checkoutCart.hotdrinksInCart.count) : 1;
     
     return val;
     
     */
     return [Offers sharedInstance].allOffers.count;
    
}



//populates the custom cell based on the data source from the table view

//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return UITableViewAutomaticDimension;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //for juice section

    Offer *juice = [Offers sharedInstance].allOffers[indexPath.row];
    
    
    
    OffersCell *offercell = [self.tableView dequeueReusableCellWithIdentifier:@"OfferCell"];
    
    offercell.offerNameLabel.text = juice.offerName;
    offercell.offerCategory.text = juice.offerName;
                     
    return offercell;
                     
}



#pragma mark - UITableViewDelegate methods


//populates the row based on the selction

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}









@end
