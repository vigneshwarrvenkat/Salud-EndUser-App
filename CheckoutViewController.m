//
//  CheckoutViewController.m
//  Salud Juicery ios
//
//  Created by Salud Juice Team (Vigneshwarr) on 10/25/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import "CheckoutViewController.h"
#import "CheckoutCell.h"
#import "SubTotalCell.h"
#import "SCheckoutCell.h"
#import "HoCheckoutCell.h"
#import "HlCheckoutCell.h"
#import "BCheckoutCell.h"
#import "CoCheckoutCell.h"

#import "CheckoutCart.h"
#import "RWStripeViewController.h"

@interface CheckoutViewController () <UITableViewDataSource, UITableViewDelegate>{
    NSArray *menuSectionTitles;
    
}

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIView *continueButtonView;
@property (strong, nonatomic) IBOutlet UIButton *continueButton;

@property (strong, nonatomic) CheckoutCart* checkoutCart;



@end



@implementation CheckoutViewController


//loads when the controller is initiated
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.checkoutCart = [CheckoutCart sharedInstance];
    self.tableView.estimatedRowHeight = 75.0f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    menuSectionTitles =@[@"Juice",@"Bowl",@"Smoothee",@"HealthShot",@"HotDrink",@"Coffee",@"Total"];
    
    
}
//loads when the controller shows up from the stack
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
    
    
     NSLog(@"no of titles :%ld",[menuSectionTitles count]);
    
    return [menuSectionTitles count];
}




//returns the number of rows in section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSLog(@"section :%ld",(long)section);
    
    /*
    
      NSInteger val = (section == 0) ? (self.checkoutCart.juicesInCart.count + self.checkoutCart.bowlsInCart.count+ self.checkoutCart.smootheesInCart.count + self.checkoutCart.healthshotsInCart.count + self.checkoutCart.hotdrinksInCart.count) : 1;
    
    return val;
   
     */
    
    NSString *sectionTitle = [menuSectionTitles objectAtIndex:section];
    
    if ([sectionTitle  isEqual: @"Juice"]){
        
        return self.checkoutCart.juicesInCart.count;
        
    }
    
    
    if ([sectionTitle  isEqual: @"Bowl"]){
        
        return self.checkoutCart.bowlsInCart.count;
        
    }
    
    
    if ([sectionTitle  isEqual: @"Smoothee"]){
        
        return self.checkoutCart.smootheesInCart.count;
        
    }
    
    if ([sectionTitle  isEqual: @"HealthShot"]){
        
        
        NSLog(@"section :%ld",self.checkoutCart.healthshotsInCart.count);
        
        return self.checkoutCart.healthshotsInCart.count;
        
    }
    
    if ([sectionTitle  isEqual: @"HotDrink"]){
        
        return self.checkoutCart.hotdrinksInCart.count;
        
    }
    
    
    if ([sectionTitle  isEqual: @"Coffee"]){
        
        return self.checkoutCart.coffeesInCart.count;
        
    }
    
    if ([sectionTitle  isEqual: @"Total"]){
        
        return 1;
        
    }
    
    
    return 0;
    
    
}



//populates the custom cell based on the data source from the table view

//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return UITableViewAutomaticDimension;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //for juice section
    
    UITableViewCell *cells= nil;
    
    
    
    switch (indexPath.section) {
        
            
        case 0:
        {
            
            CheckoutCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"CheckoutCell"];
            
            if ((unsigned long)self.checkoutCart.juicesInCart.count !=0){
                
                Juice* juice = self.checkoutCart.juicesInCart[indexPath.row];
                NSNumber *valueCount = [self.checkoutCart.juiceDict objectForKey:juice.name];
                
                
                cell.juiceNameLabel.text =  juice.name;
                cell.juiceIngredientLabel.text = juice.ingredients;
                cell.priceLabel.text = [NSString stringWithFormat:@"$%@", juice.price];
                cell.juiceCount.text = [NSString stringWithFormat:@"%@ X", valueCount];
                cell.juiceType.text = [self.checkoutCart.quantity  objectForKey:@"Juice"];
                
                NSLog(@"Type_value:%@",cell.juiceType.text);
                
            }
            
            cells =cell;
        }
        
            break;
            
        case 1:
        {
            CheckoutCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"CheckoutCell"];
            
            if ((unsigned long)self.checkoutCart.bowlsInCart.count !=0){
                
                Bowl* bowl = self.checkoutCart.bowlsInCart[indexPath.row];
                
                
                NSNumber *valueCount = [self.checkoutCart.juiceDict objectForKey:bowl.bowlName];
                
                cell.juiceNameLabel.text =  bowl.bowlName;
                cell.juiceIngredientLabel.text = bowl.bowlIngredients;
                cell.priceLabel.text = [NSString stringWithFormat:@"$%@", bowl.bowlPrice];
                cell.juiceCount.text = [NSString stringWithFormat:@"%@ X", valueCount];
                cell.juiceType.text = [self.checkoutCart.quantity  objectForKey:@"Bowl"];
                
                NSLog(@"Type_value:%@",cell.juiceType.text);
                
            }
            
            cells =cell;
        }
            
            break;
            
        case 2:
        {
            
            CheckoutCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"CheckoutCell"];
            
            if ((unsigned long)self.checkoutCart.smootheesInCart.count !=0){
                
                Smoothee* smoothee = self.checkoutCart.smootheesInCart[indexPath.row];
                
                
                NSNumber *valueCount = [self.checkoutCart.juiceDict objectForKey:smoothee.smootheeName];
                
                cell.juiceNameLabel.text =  smoothee.smootheeName;
                cell.juiceIngredientLabel.text = smoothee.smootheeIngredients;
                cell.priceLabel.text = [NSString stringWithFormat:@"$%@", smoothee.smootheePrice];
                cell.juiceCount.text = [NSString stringWithFormat:@"%@ X", valueCount];
                cell.juiceType.text = [self.checkoutCart.quantity  objectForKey:@"Smoothee"];
                
                NSLog(@"Type_value:%@",cell.juiceType.text);
                
            }
            
            cells =cell;
        }
            
            break;
            
        case 3:
        {
            
            CheckoutCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"CheckoutCell"];
            
            if ((unsigned long)self.checkoutCart.healthshotsInCart.count !=0){
                
                HealthShot* healthshot = self.checkoutCart.healthshotsInCart[indexPath.row];
                
                NSNumber *valueCount = [self.checkoutCart.juiceDict objectForKey:healthshot.healthName];
                
                cell.juiceNameLabel.text =  healthshot.healthName;
                cell.juiceIngredientLabel.text = healthshot.healthIngredients;
                cell.priceLabel.text = [NSString stringWithFormat:@"$%@", healthshot.healthPrice];
                cell.juiceCount.text = [NSString stringWithFormat:@"%@ X", valueCount];
                cell.juiceType.text = [self.checkoutCart.quantity  objectForKey:@"HealthShot"];
                
                NSLog(@"Type_value:%@",cell.juiceType.text);
                
            }
            
            cells =cell;
            
        }
            
            break;
            
        case 4:
        {
            
            CheckoutCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"CheckoutCell"];
            
            if ((unsigned long)self.checkoutCart.hotdrinksInCart.count !=0){
                
                HotDrink* hotdrink = self.checkoutCart.hotdrinksInCart[indexPath.row];
                
                NSNumber *valueCount = [self.checkoutCart.juiceDict objectForKey:hotdrink.hotName];
                
                cell.juiceNameLabel.text =  hotdrink.hotName;
                cell.juiceIngredientLabel.text = hotdrink.hotName;
                cell.priceLabel.text = [NSString stringWithFormat:@"$%@", hotdrink.hotPrice];
                cell.juiceCount.text = [NSString stringWithFormat:@"%@ X", valueCount];
                cell.juiceType.text = [self.checkoutCart.quantity  objectForKey:@"HotDrink"];
                
                NSLog(@"Type_value:%@",cell.juiceType.text);
                
            }
            
            cells =cell;
        }
            
            break;
            
        case 5:
        {
            
            CheckoutCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"CheckoutCell"];
            
            if ((unsigned long)self.checkoutCart.coffeesInCart.count !=0){
                
                Coffee* coffee = self.checkoutCart.coffeesInCart[indexPath.row];
                
                NSNumber *valueCount = [self.checkoutCart.juiceDict objectForKey:coffee.coffeeName];
                
                cell.juiceNameLabel.text =  coffee.coffeeName;
                cell.juiceIngredientLabel.text = coffee.coffeeIngredients;
                cell.priceLabel.text = [NSString stringWithFormat:@"$%@", coffee.coffeePrice];
                cell.juiceCount.text = [NSString stringWithFormat:@"%@ X", valueCount];
                cell.juiceType.text = [self.checkoutCart.quantity  objectForKey:@"Coffee"];
                
                NSLog(@"Type_value:%@",cell.juiceType.text);
                
            }
            
            cells =cell;
        }

            
        default:
            break;
    }
    
    if (indexPath.section == 6) {
        
        
        SubTotalCell* Scell = [self.tableView dequeueReusableCellWithIdentifier:@"TotalCell"];
        Scell.totalLabel.text = [NSString stringWithFormat:@"$%@", [self.checkoutCart total]];
        
        cells=Scell;
    }
    
    
    return cells;
    
    /*
        if (indexPath.section == 0) {
        
        NSLog(@"juice thi is :%lu",(unsigned long)self.checkoutCart.juicesInCart.count);
        
        CheckoutCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"CheckoutCell"];
        
        if ((unsigned long)self.checkoutCart.juicesInCart.count !=0){
            
            Juice* juice = self.checkoutCart.juicesInCart[indexPath.row];
            NSNumber *valueCount = [self.checkoutCart.juiceDict objectForKey:juice.name];
            
            
            cell.juiceNameLabel.text =  juice.name;
            cell.juiceIngredientLabel.text = juice.ingredients;
            cell.priceLabel.text = [NSString stringWithFormat:@"$%@", juice.price];
            cell.juiceCount.text = [NSString stringWithFormat:@"%@ X", valueCount];
            cell.juiceType.text = [self.checkoutCart.quantity  objectForKey:@"Juice"];
            
            NSLog(@"Type_value:%@",cell.juiceType.text);
            
        }
            
            return cell;
            
        }
    
    
    
    
    
    //for bowl section
    
       if (indexPath.section == 1) {
    
        
       NSLog(@"bowl thi is :%lu",(unsigned long)self.checkoutCart.bowlsInCart.count);
       
        BCheckoutCell* cellB = [self.tableView dequeueReusableCellWithIdentifier:@"BCheckoutCell"];
           
        
        
        if ((unsigned long)self.checkoutCart.bowlsInCart.count !=0){
            
             Bowl* bowl = self.checkoutCart.bowlsInCart[indexPath.row];
            
            
            NSNumber *valueCount = [self.checkoutCart.juiceDict objectForKey:bowl.bowlName];
            
            cellB.bowlNameLabel.text =  bowl.bowlName;
            cellB.bowlIngredientLabel.text = bowl.bowlIngredients;
            cellB.bowlpriceLabel.text = [NSString stringWithFormat:@"$%@", bowl.bowlPrice];
            
            cellB.bowlCount.text = [NSString stringWithFormat:@"%@ X", valueCount];
            
            cellB.bowlType.text = [self.checkoutCart.quantity  objectForKey:@"Bowl"];
            
        }
           
           return cellB;
           
       }
    
    
    
    
    //for Smoothee section
    
    if (indexPath.section == 2) {
    
        
        NSLog(@"smoothee thi is :%lu",(unsigned long)self.checkoutCart.smootheesInCart.count);
        
        
        
        
        BCheckoutCell* cellB = [self.tableView dequeueReusableCellWithIdentifier:@"BCheckoutCell"];
        
        
        
        if ((unsigned long)self.checkoutCart.bowlsInCart.count !=0){
            
            Smoothee* smoothee = self.checkoutCart.smootheesInCart[indexPath.row];
            
            
            NSNumber *valueCount = [self.checkoutCart.juiceDict objectForKey:smoothee.smootheeName];
            
            cellB.bowlNameLabel.text =  smoothee.smootheeName;
            cellB.bowlIngredientLabel.text = smoothee.smootheeIngredients;

            cellB.bowlpriceLabel.text = [NSString stringWithFormat:@"$%@", smoothee.smootheePrice];
            
            cellB.bowlCount.text = [NSString stringWithFormat:@"%@ X", valueCount];
            
            cellB.bowlType.text = [self.checkoutCart.quantity  objectForKey:@"Smoothee"];
            
        }
        
//        SCheckoutCell* cellS = [self.tableView dequeueReusableCellWithIdentifier:@"SCheckoutCell"];
//        
//        
//        if ((unsigned long)self.checkoutCart.smootheesInCart.count !=0){
//            
//             Smoothee* smoothee = self.checkoutCart.smootheesInCart[indexPath.row];
//            
//             NSNumber *valueCount = [self.checkoutCart.juiceDict objectForKey:smoothee.smootheeName];
//            
//            cellS.smootheeNameLabel.text =  smoothee.smootheeName;
//            cellS.smootheeIngredientLabel.text = smoothee.smootheeIngredients;
//            cellS.smootheepriceLabel.text = [NSString stringWithFormat:@"$%@", smoothee.smootheePrice];
//            
//            
//            cellS.smootheeCount.text = [NSString stringWithFormat:@"%@ X", valueCount];
//            
//            cellS.smootheeType.text =[self.checkoutCart.quantity  objectForKey:@"Smoothee"];
//            
//        }
        
        return cellB;
        
    }
    
    
    
    
    //For Healthshot section
    
        NSLog(@"healthshot thi is :%lu",(unsigned long)self.checkoutCart.healthshotsInCart.count);
        
        if (indexPath.section == 3) {
        
        HlCheckoutCell* cellHl = [self.tableView dequeueReusableCellWithIdentifier:@"HlCheckoutCell"];
        
        if ((unsigned long)self.checkoutCart.healthshotsInCart.count !=0){
            
            HealthShot* healthshot = self.checkoutCart.healthshotsInCart[indexPath.row];
            
             NSNumber *valueCount = [self.checkoutCart.juiceDict objectForKey:healthshot.healthName];
            
            cellHl.healthNameLabel.text =  healthshot.healthName;
            cellHl.healthIngredientLabel.text = healthshot.healthIngredients;
            cellHl.healthkpriceLabel.text = [NSString stringWithFormat:@"$%@", healthshot.healthPrice];
            
            cellHl.healthCount.text = [NSString stringWithFormat:@"%@ X", valueCount];
            
            cellHl.healthType.text =[self.checkoutCart.quantity  objectForKey:@"HealthShot"];
            
        }
            
            return cellHl;
        }
    
    
    
    
    
    //For Hot drink section
    
        
        NSLog(@"hotdrink thi is :%lu",(unsigned long)self.checkoutCart.hotdrinksInCart.count);
    
    if (indexPath.section == 4) {
        
        HoCheckoutCell* cellHo = [self.tableView dequeueReusableCellWithIdentifier:@"HoCheckoutCell"];
        
        if ((unsigned long)self.checkoutCart.hotdrinksInCart.count !=0){
            
            HotDrink* hotdrink = self.checkoutCart.hotdrinksInCart[indexPath.row];
            
             NSNumber *valueCount = [self.checkoutCart.juiceDict objectForKey:hotdrink.hotName];
            
            
            cellHo.hotdrinkNameLabel.text =  hotdrink.hotName;
            cellHo.hotdrinkIngredientLabel.text = hotdrink.hotIngredients;
            cellHo.hotdrinkpriceLabel.text = [NSString stringWithFormat:@"$%@", hotdrink.hotPrice];
           
            cellHo.hotCount.text = [NSString stringWithFormat:@"%@ X", valueCount];
            
            cellHo.hotdrinType.text =[self.checkoutCart.quantity  objectForKey:@"HotDrink"];
            
            NSLog(@"%@",cellHo.hotdrinType.text);
            
        }
        
        
        return cellHo;
    }
    
    
    
    
    
    //For Coffe based section
    
    
    if (indexPath.section == 5) {
        
        CoCheckoutCell* cellCo = [self.tableView dequeueReusableCellWithIdentifier:@"CoCheckoutCell"];
        
        if ((unsigned long)self.checkoutCart.coffeesInCart.count !=0){
            
            Coffee* coffee = self.checkoutCart.coffeesInCart[indexPath.row];
            
            NSNumber *valueCount = [self.checkoutCart.juiceDict objectForKey:coffee.coffeeName];
            
            
            cellCo.coffeeNameLabel.text =  coffee.coffeeName;
            cellCo.coffeeIngredientLabel.text = coffee.coffeeIngredients;
            cellCo.coffeepriceLabel.text = [NSString stringWithFormat:@"$%@", coffee.coffeePrice];
            
            cellCo.coffeeCount.text = [NSString stringWithFormat:@"%@ X", valueCount];
            
            cellCo.coffeeType.text =[self.checkoutCart.quantity  objectForKey:@"Coffee"];
            
        }
        
        
        return cellCo;
    }
    
    
    */

   //For total section
    
    
    
    return nil;
    
    
    
}



#pragma mark - UITableViewDelegate methods


//populates the row based on the selction

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


//Activates when the button is clicked

-(IBAction)ButtonClicked
{ //Navigation on buttons click event from ViewControlerOne to ViewControlerTwo with transferring data or string..
    
    
    
    RWStripeViewController *wc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"RWStripeViewController"];
    [self.navigationController pushViewController:wc animated:YES];
    
    
}

//used to Delete the row at the table view. Corresponding style has to be set.

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    //Based on the section which is set in the delegate, the row is deleted on user action
    
        
    if (indexPath.section == 0){
        
        
        if ((unsigned long)self.checkoutCart.juicesInCart.count !=0){
            
             NSLog(@"inside the delete :%lu",(unsigned long)self.checkoutCart.juicesInCart.count);
            
            
            [self.checkoutCart.juicesInCart removeObjectAtIndex:indexPath.row];
            
        }
        
}

    
    
    
        
     //Bowl selectiomn
       
        
    if (indexPath.section == 1){
        
    
        
        if ((unsigned long)self.checkoutCart.bowlsInCart.count !=0){
            
             NSLog(@"bowl thi is :%lu",(unsigned long)self.checkoutCart.bowlsInCart.count);
            
            
           [self.checkoutCart.bowlsInCart removeObjectAtIndex:indexPath.row];
            
            
        }
        
    }
        
    
    
   //Smoothee selction
        
        
        
  if (indexPath.section == 2){
    
        
        
        if ((unsigned long)self.checkoutCart.smootheesInCart.count !=0){
            
            NSLog(@"smoothee thi is :%lu",(unsigned long)self.checkoutCart.smootheesInCart.count);

           [self.checkoutCart.smootheesInCart removeObjectAtIndex:indexPath.row];
            
        }
        
   }
    
    
  //Health shot selection
    
    
if (indexPath.section == 3){
    
        
        if ((unsigned long)self.checkoutCart.healthshotsInCart.count !=0){
            
             NSLog(@"healthshot thi is :%lu",(unsigned long)self.checkoutCart.healthshotsInCart.count);
            
          [self.checkoutCart.healthshotsInCart removeObjectAtIndex:indexPath.row];
            
        }
        
}
    
    
    
    
    
 //Hot drink selection
  
    
   
if (indexPath.section == 4){
        
        
        if ((unsigned long)self.checkoutCart.hotdrinksInCart.count !=0){
            
              NSLog(@"hotdrink thi is :%lu",(unsigned long)self.checkoutCart.hotdrinksInCart.count);
            
          [self.checkoutCart.hotdrinksInCart removeObjectAtIndex:indexPath.row];
            
        }
        
}
    
    
    
        
    
  //Coffee based selection
    
if (indexPath.section == 5){
    
        
        if ((unsigned long)self.checkoutCart.coffeesInCart.count !=0){
            
              NSLog(@"hotdrink thi is :%lu",(unsigned long)self.checkoutCart.coffeesInCart.count);
            
          [self.checkoutCart.coffeesInCart removeObjectAtIndex:indexPath.row];
            
        }
        
        
}
    
    

    [tableView reloadData];
}

//Prevents editing the cell for section =6

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 6) {
        
        return NO;
    }
    
    return YES;
    
}

@end
