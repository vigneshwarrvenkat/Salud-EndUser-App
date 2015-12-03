//
//  JuiceDetailViewController.m
//  Salud Juicery ios
//
//  Created by Salud Juice Team (Vigneshwarr)on 9/7/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import "JuiceDetailViewController.h"
#import "CheckoutCart.h"
#import "JuicesListViewController.h"
#import "BowlsListViewController.h"
#import "HealthShotsListViewController.h"
#import "CheckoutViewController.h"
#import "SmootheesListViewController.h"
#import "HotbrevListViewController.h"
#import "CoffeeViewController.h"
#import "ContainerViewController.h"
#import "Header.h"
#import "AppDelegate.h"
#import "AddIns.h"
#import "AddIn.h"

//#import "AFNetworking.h"




@interface JuiceDetailViewController ()
{
    AppDelegate *appdelegate ;
    CheckoutCart *checkout;
}
@property (strong, nonatomic) IBOutlet UITextField *txtFldNotes;

@property (strong, nonatomic) IBOutlet UILabel *NameLabel;
@property (strong, nonatomic) IBOutlet UILabel *juiceNameLabel;
//@property (strong, nonatomic) IBOutlet UIImageView *puppyImageView;
@property (strong, nonatomic) IBOutlet UILabel *juiceIngredientLabel;
@property (strong, nonatomic) IBOutlet UILabel *quantityLabel;
//@property (strong, nonatomic) IBOutlet UILabel *maxHeightLabel;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong, nonatomic) IBOutlet UIButton *addToCartButton;

@property (nonatomic, assign) NSInteger *juiceCount;

@property (nonatomic, strong) NSMutableArray *arryList;

@property (nonatomic, strong) NSArray *currentQuantityType;

@property (nonatomic, strong) NSMutableArray *arryListCost;
//@property(nonatomic, strong) NSMutableDictionary *dict;

//@property(nonatomic, strong) NSMutableDictionary *dictforquantityType;



- (IBAction)addToCartButtonTapped:(id)sender;



@end





NSInteger b;

@implementation JuiceDetailViewController




@synthesize str2,stepperCount,str3,currentCategoryItem;

@synthesize juiceCount;

@synthesize quantityPressed;


//Loads when the controller is initiated


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view, typically from a nib.
    
    
   
    
    
    //  CGRect mainScreenRect = [[UIScreen mainScreen] bounds];
    
        // Do any additional setup after loading the view, typically from a nib.
    
    
   // self.addinView.delegate = self;
   // self.addinView.dataSource = self;
    
  //  [self.addinView setEditing:YES animated:YES];
    
    
    
  // JuicesListViewController *ws = [JuicesListViewController alloc];
   // if(*ws.title == "Bowls")
   //
    
    _val = [NSNumber numberWithInt:1]; //Default value of any juice is ONE
    
   str3 = [[NSString alloc]init];
    
    
    //for juice to laod
    
    NSLog(@"%@",str2);
    
    if([self.str2 isEqualToString:@"Juice"]){
        
        currentCategoryItem = self.juice.name;
        
        _currentQuantityType = [[NSArray alloc] initWithObjects:self.juice.quantityPetite,self.juice.quantityRegular,self.juice.quantityGrowler,nil];
        
        
        NSLog(@"%@",str2);
    
        [self loadData1];
    }
   
    
    
    //For bowl to load
    
    if([self.str2 isEqualToString:@"Bowl"]){
        
        currentCategoryItem = self.bowl.bowlName;
        
        
        NSLog(@"%@%@%@",self.bowl.bowlQuantityPetite,self.bowl.bowlQuantityRegular,self.bowl.bowlQuantityGrowler);
        
        _currentQuantityType = [[NSArray alloc] initWithObjects:self.bowl.bowlQuantityPetite,self.bowl.bowlQuantityRegular,self.bowl.bowlQuantityGrowler,nil];
        
        [self loadData2];
    }
     
    
    //For Smoothee to load
    
    if([self.str2 isEqualToString:@"Smoothee"]){
        
        currentCategoryItem = self.smoothee.smootheeName;
        
        _currentQuantityType = [[NSArray alloc] initWithObjects:self.smoothee.smootheeQuantityPetite,self.smoothee.smootheeQuantityRegular,self.smoothee.smootheeQuantityGrowler,nil];
        
         NSLog(@"%@",str2);
        
        [self loadData3];
    }
    
    
    
    //For healthshot to laoad
    
    if([self.str2 isEqualToString:@"HealthShot"]){
        
        currentCategoryItem = self.healthshot.healthName;
        
        _currentQuantityType = [[NSArray alloc] initWithObjects:self.healthshot.healthQuantityPetite,self.healthshot.healthQuantityRegular,self.healthshot.healthQuantityGrowler,nil];
        
        [self loadData4];
    }
    
    
    //For Hot drink to load
    
    if([self.str2 isEqualToString:@"HotDrink"]){
        
        currentCategoryItem = self.hotdrink.hotName;
        
        _currentQuantityType = [[NSArray alloc] initWithObjects:self.hotdrink.hotQuantityPetite,self.hotdrink.hotQuantityRegular,self.hotdrink.hotQuantityGrowler,nil];
        
        [self loadData5];
    }
    
    
    //For Coffee to load
    
    if([self.str2 isEqualToString:@"Coffee"]){
        
        currentCategoryItem = self.coffee.coffeeName;
        _currentQuantityType = [[NSArray alloc] initWithObjects:self.coffee.coffeeQuantityPetite,self.coffee.coffeeQuantityRegular,self.coffee.coffeeQuantityGrowler,nil];
        
        [self loadData6];
    }
    
    
    
    // Tableview related - temporary
    self.arryList=[[NSMutableArray alloc] initWithObjects: @"Lemon",
              @"Almond",
              @"Ginger",
              @"Protein",
              @"Milk",
              @"Cashew",
              @"Grass",
              @"Onion",
              @"Honey",
              @"Pista",nil];
    
    
    self.arryListCost=[[NSMutableArray alloc] initWithObjects: @"2.5",
                  @"2.5",
                  @"$2.5",
                  @"$2.5",
                  @"$2.5",
                  @"$2.5",
                  @"$2.5",
                  @"$2.5",
                  @"$2.5",
                  @"$2.5",nil];
    
    //[self.theTableView setEditing:YES animated:YES];
    
   
    
    
    
    
    //appdelage for state management for addins
    
    appdelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    //Already exist
    if([appdelegate.categoryDictionary objectForKey:currentCategoryItem]!=nil)
        selectedIndexes = [appdelegate.categoryDictionary objectForKey:currentCategoryItem];
    else
        selectedIndexes = [NSMutableArray array];
    // First time viewing of the juice object
    
    self.quantityPressed.selected = NO;
    
    
    
    
    if( [appdelegate.dictforquantityType objectForKey:[NSString stringWithFormat:@"%@0",currentCategoryItem]]){
        
        quantityPressed.selectedSegmentIndex=0;
        checkboxSelectedRegular = YES;
        [appdelegate.dictforquantityType removeObjectForKey:[NSString stringWithFormat:@"%@1",currentCategoryItem]];
        
        [appdelegate.dictforquantityType removeObjectForKey:[NSString stringWithFormat:@"%@2",currentCategoryItem]];
        

        
        
        
    }
    else if ([appdelegate.dictforquantityType objectForKey:[NSString stringWithFormat:@"%@1",currentCategoryItem]]){
        
        quantityPressed.selectedSegmentIndex=1;
        checkboxSelectedPetite = YES;
        
        
        [appdelegate.dictforquantityType removeObjectForKey:[NSString stringWithFormat:@"%@0",currentCategoryItem]];
        
        [appdelegate.dictforquantityType removeObjectForKey:[NSString stringWithFormat:@"%@2",currentCategoryItem]];
        
        
    }
    else if ( [appdelegate.dictforquantityType objectForKey:[NSString stringWithFormat:@"%@2",currentCategoryItem]]){
        
        quantityPressed.selectedSegmentIndex=2;
        checkboxSelectedGrowler = YES;
               
        [appdelegate.dictforquantityType removeObjectForKey:[NSString stringWithFormat:@"%@1",currentCategoryItem]];
        
        [appdelegate.dictforquantityType removeObjectForKey:[NSString stringWithFormat:@"%@0",currentCategoryItem]];
        
        
    }

    else {
        
        appdelegate.dictforquantityType = [[NSMutableDictionary alloc] init];
    }
    
    
    // Disable the type of juice based on the read data
    
    
    if([_currentQuantityType[0] integerValue] ==0){
        
        [quantityPressed setEnabled:NO forSegmentAtIndex:1];
    }
    
    if([_currentQuantityType[1] integerValue]==0){
        
        [quantityPressed setEnabled:NO forSegmentAtIndex:0];
    }
    
    if([_currentQuantityType[2] integerValue]==0){
        
        [quantityPressed setEnabled:NO forSegmentAtIndex:2];
    }

    
    
    }



-(void)viewWillDisappear:(BOOL)animated
{
    
//    appdelegate.categoryDictionary = [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                                      self.juice.name,@"categoryName",
//                                      selectedIndexes,@"selectedIndexes", nil];
//    [super viewWillDisappear:animated];
//    if (selectedIndexes!=nil && selectedIndexes.count>0)
//        [appdelegate.categoryDictionary setObject:selectedIndexes forKey:self.juice.name];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    if (selectedIndexes!=nil && selectedIndexes.count>0)
        [appdelegate.categoryDictionary setObject:selectedIndexes forKey:currentCategoryItem];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
    
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
   // return [self.arryList count];
    
    return [AddIns sharedInstance].allAddins.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     static NSString *AddIn = @"Cell";
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:AddIn];
     if(cell == nil){
     
     cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:AddIn];
     }
    
    Addin* juice = [AddIns sharedInstance].allAddins[indexPath.row];
    
    NSInteger row = indexPath.row;
    
    cell.detailTextLabel.textColor = [UIColor blackColor];
    
  //  cell.textLabel.text = [self.arryList objectAtIndex:row];
    
    cell.textLabel.text = juice.addinName;
    
    cell.detailTextLabel.lineBreakMode = NSLineBreakByWordWrapping;
    cell.detailTextLabel.numberOfLines = 0;
    
    
   // cell.detailTextLabel.text = [self.arryListCost objectAtIndex:row];
    
    cell.detailTextLabel.text = [juice.addinPrice stringValue];
    
    
    cell.tintColor = [UIColor blueColor];
    
    
    
    
    if([self.str2 isEqualToString:@"Juice"]){
        
        self.addinCategory = self.juice.name;
        
        
    }
    
    
    
    //For bowl to load
    
    if([self.str2 isEqualToString:@"Bowl"]){
        
        self.addinCategory = self.bowl.bowlName;
        
        
    }
    
    
    //For Smoothee to load
    
    if([self.str2 isEqualToString:@"Smoothee"]){
        
       self.addinCategory = self.smoothee.smootheeName;
    
    }
    
    
    
    //For healthshot to laoad
    
    if([self.str2 isEqualToString:@"HealthShot"]){
        
        self.addinCategory = self.healthshot.healthName;
    }
    
    
    //For Hot drink to load
    
    if([self.str2 isEqualToString:@"HotDrink"]){
        
        self.addinCategory = self.hotdrink.hotName;
        
    }
    
    
    //For Coffee to load
    
    if([self.str2 isEqualToString:@"Coffee"]){
        
        self.addinCategory = self.coffee.coffeeName;
       
    }

    
    
    
    
    
    
    
    
    if(appdelegate.categoryDictionary!=nil && appdelegate.categoryDictionary[self.addinCategory]!=nil)
    {
        if([appdelegate.categoryDictionary[self.addinCategory] containsObject:[NSNumber numberWithInteger:indexPath.row]])
        {
            [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
        }
        else
        {
            [cell setAccessoryType:UITableViewCellAccessoryNone];
        }
    }
    //[cell setHighlighted:NO];
    //cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    return cell;
}




//Selects the corresponding row based on the user interaction


//-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
//    
//    //[tableView dequeueReusableCellWithIdentifier:@"Cell"];
//    
//    if(cell!= nil)
//    {
//        NSNumber *index = [NSNumber numberWithInteger:indexPath.row];
//        
//        if (selectedIndexes.count>0) {
//            if ([selectedIndexes containsObject:index]) {
//                cell.accessoryType = UITableViewCellAccessoryNone;
//                [selectedIndexes removeObject:index];
//                [tableView reloadData];
//            }
//        }
//        
//    }
//}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   // CheckoutCart* checkoutcart = [CheckoutCart sharedInstance];
   // NSLog(@"ArryList --- %@", [self.arryList objectAtIndex:indexPath.row]);
  //  NSLog(@"ArryListCost --- %@", [self.arryListCost objectAtIndex:indexPath.row]);
    
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    //[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if(cell!= nil)
    {
        NSNumber *index = [NSNumber numberWithInteger:indexPath.row];
        
        if (selectedIndexes.count>0) {
            if ([selectedIndexes containsObject:index]) {
                
                [selectedIndexes removeObject:index];
                [_addinPrice removeObjectAtIndex:(unsigned)[index intValue]];
//                cell.accessoryType = UITableViewCellAccessoryNone;
                [tableView reloadData];
            }
            
            else{
                [selectedIndexes addObject:index];
             [_addinPrice addObject:[AddIns sharedInstance].allAddins[indexPath.row]];
            }
        }
        
        else
        {
            [selectedIndexes addObject:index];
            
        //   NSLog(@"ArryListCost --- %@", [self.arryListCost objectAtIndex:indexPath.row]);
            
            if(!(_addinPrice.count>0)){
                
                
                 _addinPrice = [[NSMutableArray alloc]init];
            }
            
             [_addinPrice addObject:[AddIns sharedInstance].allAddins[indexPath.row]];
        }
        
    }
    
    
    
    
    
    
   // NSString* price;
  //  NSNumber* cost;
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    float costAddin = 0.0f;
    
    NSLog(@"Addiin count:%lu",(unsigned long)_addinPrice.count);
    
     NSLog(@"Addiin :%@",_addinPrice);
    
    for(Addin* addin in self.addinPrice){
        
        
        
        costAddin  += [addin.addinPrice floatValue];
        NSLog(@"addin cost: %f",costAddin);
        
    }
    
    
    //  NSLog(@"category_value :%@",juice.str2);
    
    //NSLog(@"category_value :%@",categoryValue);
    
    //This will hold Textlable which is on left side
//    _leftText = cell.textLabel.text;
//    _rightText = cell.detailTextLabel.text;
    
    // NSLog(@"%@ - %@",_leftText,_rightText);
    
    //[self.delegate rowSelectedWithAddin:@{@"name" : [arryList objectAtIndex:indexPath.row], @"cost" : [arryListCost objectAtIndex:indexPath.row]}];
    
}



-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{

    NSNumber *index = [NSNumber numberWithInteger:indexPath.row];
    
     NSLog(@"unsigned:%u",(unsigned)[index intValue]);
    
     NSLog(@"Addiin :%@",_addinPrice);
    

    [selectedIndexes removeObject:index];
    [_addinPrice removeObjectAtIndex:(unsigned)[index intValue]];
    //                cell.accessoryType = UITableViewCellAccessoryNone;
  //  [tableView reloadData];
    
    NSLog(@"Addiin :%@",_addinPrice);
    
}

/*

-(void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    NSNumber *index = [NSNumber numberWithInteger:indexPath.row];
    
    NSLog(@"%@",index);
    
    [selectedIndexes removeObject:index];
    [_addinPrice removeObjectAtIndex:(unsigned)index];
    //                cell.accessoryType = UITableViewCellAccessoryNone;
     [tableView reloadData];
    
    NSLog(@"Addiin :%@",_addinPrice);
    
}

*/
//Returns the height of the row



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}



//Delgates for the Drop down picker



-(void)showPopUpWithTitle:(NSString*)popupTitle withOption:(NSArray*)arrOptions xy:(CGPoint)point size:(CGSize)size isMultiple:(BOOL)isMultiple{
    
    
    Dropobj = [[DropDownListView alloc] initWithTitle:popupTitle options:arrOptions xy:point size:size isMultiple:isMultiple];
    Dropobj.delegate = self;
    [Dropobj showInView:self.view animated:YES];
    
    /*----------------Set DropDown backGroundColor-----------------*/
    [Dropobj SetBackGroundDropDown_R:0.0 G:108.0 B:194.0 alpha:0.70];
    
}



//Delgates for the Drop down picker

- (void)DropDownListView:(DropDownListView *)dropdownListView didSelectedIndex:(NSInteger)anIndex{
    /*----------------Get Selected Value[Single selection]-----------------*/
    _lblSelectedCountryNames.text=[arryList objectAtIndex:anIndex];
}



//Delgates for the Drop down picker


- (void)DropDownListView:(DropDownListView *)dropdownListView Datalist:(NSMutableArray*)ArryData{
    
    /*----------------Get Selected Value[Multiple selection]-----------------*/
    if (ArryData.count>0) {
        NSLog(@"original=%@",ArryData);
        _lblSelectedCountryNames.text=[ArryData componentsJoinedByString:@"\n"];
        
        
        NSLog(@"array=%@",_lblSelectedCountryNames.text);
        
        CGSize size=[self GetHeightDyanamic:_lblSelectedCountryNames];
        
        
        NSLog(@"array=%f",size.height);
        
        
        _lblSelectedCountryNames.frame=CGRectMake(73, 350, 189, size.height);
    }
    else{
        _lblSelectedCountryNames.text=@"";
    }
    
}


//Delgates for the Drop down picker


- (void)DropDownListViewDidCancel{
    
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    
    if ([touch.view isKindOfClass:[UIView class]]) {
        [Dropobj fadeOut];
    }
}



//Calclate the height of the pop menu

-(CGSize)GetHeightDyanamic:(UILabel*)lbl
{
    NSRange range = NSMakeRange(0, [lbl.text length]);
    CGSize constraint;
    constraint= CGSizeMake(288 ,MAXFLOAT);
    CGSize size;
    
    if (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)) {
        NSDictionary *attributes = [lbl.attributedText attributesAtIndex:0 effectiveRange:&range];
        CGSize boundingBox = [lbl.text boundingRectWithSize:constraint options: NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
        
        size = CGSizeMake(ceil(boundingBox.width), ceil(boundingBox.height));
    }
    else{
        
        
        size = [lbl.text sizeWithFont:[UIFont fontWithName:@"Helvetica" size:14] constrainedToSize:constraint lineBreakMode:NSLineBreakByWordWrapping];
    }
    return size;
}



//Whent the button in the pop pressed



- (IBAction)DropDownPressed:(id)sender {
    
    
    [Dropobj fadeOut];
    [self showPopUpWithTitle:@"Select Addins" withOption:arryList xy:CGPointMake(16, 58) size:CGSizeMake(287, 330) isMultiple:YES];
}



//Check only for single selection



- (IBAction)DropDownSingle:(id)sender {
    [Dropobj fadeOut];
    [self showPopUpWithTitle:@"Select Addins" withOption:arryList xy:CGPointMake(16, 150) size:CGSizeMake(287, 280) isMultiple:NO];
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//When the view is unloaded from the stack

- (void)viewDidUnload {
    [self setPaStepper:nil];
    
    [super viewDidUnload];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}



//Changing the background images oof the UIControl state

- (void)setBackgroundImage:(UIImage*)image forState:(UIControlState)state{
    
    
  //   [self.stepperCount setIncrementImage:[UIImage imageNamed:@"plus_bckg@2x.png"] forState:UIControlStateNormal];
}




//The change in value for the UIStepper


- (IBAction)valuechangedJuice:(id)sender {
    
    
       
    
    
    
  //  self.lblStepper.text = [NSString stringWithFormat:@"Quantity : %d",[[NSNumber numberWithInt:[(UIStepper *)sender value]] intValue]];
    
    if(checkboxSelectedRegular || checkboxSelectedPetite || checkboxSelectedGrowler){
        
    
    CheckoutCart* checkoutCart = [CheckoutCart sharedInstance];


    
    
    self.lblStepper.text = [[NSNumber numberWithInt:[(UIStepper *)sender value]] stringValue];
    
    _val = [NSNumber numberWithInteger:[(UIStepper *)sender value]];
    
   
    //For Change in Juice count
  
    if([self.str2 isEqualToString:@"Juice"]){
        
        NSLog(@"%@",self.val);
        
    
    
   //  [checkoutCart addJuiceCount: self.val];
        
        
        [[NSUserDefaults standardUserDefaults] setObject:self.lblStepper.text forKey:self.juice.name];

        
    }
        
        
     //For change in Bowl count
    
    if([self.str2 isEqualToString:@"Bowl"]){
    
  //  [checkoutCart addBowlCount: self.val];
        
        
        [[NSUserDefaults standardUserDefaults] setObject:self.lblStepper.text forKey:self.bowl.bowlName];

        
    }
        
        
     //For change in Smoothee count
    
    if([self.str2 isEqualToString:@"Smoothee"]){
    
    
  //  [checkoutCart addSmootheeCount: self.val];
        
        [[NSUserDefaults standardUserDefaults] setObject:self.lblStepper.text forKey:self.smoothee.smootheeName];

    
    }
        
        
     //For chnage in Health Shot count
    
    if([self.str2 isEqualToString:@"HealthShot"]){
   
    
  //  [checkoutCart addHealthshotCount: self.val];
        
        [[NSUserDefaults standardUserDefaults] setObject:self.lblStepper.text forKey:self.healthshot.healthName];

        
    }
        
        
        
     //For chane in Hot drimk count
    
    if([self.str2 isEqualToString:@"HotDrink"]){
    
  //  [checkoutCart addHotdrinkCount: self.val];
        
        [[NSUserDefaults standardUserDefaults] setObject:self.lblStepper.text forKey:self.hotdrink.hotName];

    
    }
        
        
        
     //For change in the Coffe Count
    
    if([self.str2 isEqualToString:@"Coffee"]){
        
    //    [checkoutCart addCoffeeCount: self.val];
        
        [[NSUserDefaults standardUserDefaults] setObject:self.lblStepper.text forKey:self.coffee.coffeeName];

        
    }
    }
    else{
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Select Size"
                                                         message:@"Please select Petite or Regular or Growler or All"
                                                        delegate:nil
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil];
        
        [alert show];
        stepperCount.value =  1;
        
    }
    

}




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}





//When the view re appers from the stack

- (void)viewWillAppear:(BOOL)animated
{
    CheckoutCart* checkoutCart = [CheckoutCart sharedInstance];
   // self.addToCartButton.selected = [checkoutCart containsJuice:self.juice] ? YES : NO;
    [self.addinView deselectRowAtIndexPath:[self.addinView indexPathForSelectedRow] animated:animated];

    
    stepperCount.minimumValue = 1;
    stepperCount.value = 1;
    NSLog(@"%1.0f",stepperCount.value);
    
    self.lblStepper.text = [NSString stringWithFormat:@"%1.0f",stepperCount.value];
    NSLog(@"%@",self.lblStepper.text);
    
    
    
    
    //Retrieve the juice count value
    
    if([self.str2 isEqualToString:@"Juice"]){
        
        NSLog(@"%@",str2);
        
        if ([[NSUserDefaults standardUserDefaults]  objectForKey:self.juice.name]) {
            self.lblStepper.text = [[NSUserDefaults standardUserDefaults]  objectForKey:self.juice.name];
            
            _val = [NSNumber numberWithInt:[self.lblStepper.text intValue]];
            
            stepperCount.value =  [_val doubleValue] ;
            
            NSLog(@"assigned _val :%@",_val);
            
            NSLog(@"assigned_text :%@",self.lblStepper.text);
        }
        
    }
    
    
    //Retrieve the Bowl count value
    
    
    if([self.str2 isEqualToString:@"Bowl"]){
        
        if ([[NSUserDefaults standardUserDefaults]  objectForKey:self.bowl.bowlName]) {
        
        self.lblStepper.text = [[NSUserDefaults standardUserDefaults]  objectForKey:self.bowl.bowlName];
        
        _val = [NSNumber numberWithInt:[self.lblStepper.text intValue]];
            
             stepperCount.value =  [_val doubleValue] ;
        }
    }
    
    
    
    
    //Retrieve the Smoothe Count avalue
    
    if([self.str2 isEqualToString:@"Smoothee"]){
        
        NSLog(@"%@",str2);
        if ([[NSUserDefaults standardUserDefaults]  objectForKey:self.smoothee.smootheeName]) {
        
        self.lblStepper.text = [[NSUserDefaults standardUserDefaults]  objectForKey:self.smoothee.smootheeName];
        
         _val = [NSNumber numberWithInt:[self.lblStepper.text intValue]];
            
             stepperCount.value =  [_val doubleValue] ;
        }
    }
    
    
    
    
    //Retrieve the Health Count value
    
    if([self.str2 isEqualToString:@"HealthShot"]){
        
        if ([[NSUserDefaults standardUserDefaults]  objectForKey:self.healthshot.healthName]) {
        
       self.lblStepper.text = [[NSUserDefaults standardUserDefaults]  objectForKey:self.healthshot.healthName];
        
         _val = [NSNumber numberWithInt:[self.lblStepper.text intValue]];
            
             stepperCount.value =  [_val doubleValue] ;
    }
    }
    
    
    
    
    //Retrieve the Hot Drink Count value
    
    if([self.str2 isEqualToString:@"HotDrink"]){
        
        
        if ([[NSUserDefaults standardUserDefaults]  objectForKey:self.hotdrink.hotName]) {
        
        self.lblStepper.text = [[NSUserDefaults standardUserDefaults]  objectForKey:self.hotdrink.hotName];
        
         _val = [NSNumber numberWithInt:[self.lblStepper.text intValue]];
            
             stepperCount.value =  [_val doubleValue] ;
        }
    }
    
    
    
    
    //Retrieve the Coffe based count value
    
    if([self.str2 isEqualToString:@"Coffee"]){
        
        
        if ([[NSUserDefaults standardUserDefaults]  objectForKey:self.coffee.coffeeName]) {
        
        self.lblStepper.text = [[NSUserDefaults standardUserDefaults]  objectForKey:self.coffee.coffeeName];
        
         _val = [NSNumber numberWithInt:[self.lblStepper.text intValue]];
            
             stepperCount.value =  [_val doubleValue] ;
            
            
        }
    }
    
    
    
    
}



//Loads when the Juice list view


- (void)loadData1 {
    
   self.juiceNameLabel.text =  self.juice.name;
    self.NameLabel.text = @"Juice";
    
     NSLog(@"name of the Juice =%@",_juiceNameLabel.text);
    
   // NSURL* imageURL = [NSURL URLWithString:self.puppy.photoURL];
 //   [self.puppyImageView setImageWithURL:imageURL placeholderImage:nil];
    self.juiceIngredientLabel.text = self.juice.ingredients;
    self.quantityLabel.text =  [self.juice.quantityPetite stringValue];
  //  self.maxHeightLabel.text = [NSString stringWithFormat:@"Max Height: %@ in", self.puppy.maxHeight];
    self.priceLabel.text = [self.juice.price stringValue] ;
    
    NSLog(@"%@",self.juice.price);
}



//Loads when the Bowl list view

- (void)loadData2 {
    
     self.juiceNameLabel.text = self.bowl.bowlName;
    
    NSLog(@"name=%@",_juiceNameLabel.text);
    
    self.NameLabel.text = @"Bowl";
    
    // NSURL* imageURL = [NSURL URLWithString:self.puppy.photoURL];
    //   [self.puppyImageView setImageWithURL:imageURL placeholderImage:nil];
    self.juiceIngredientLabel.text = self.bowl.bowlIngredients;
    self.quantityLabel.text = [self.bowl.bowlQuantityPetite stringValue];
    //  self.maxHeightLabel.text = [NSString stringWithFormat:@"Max Height: %@ in", self.puppy.maxHeight];
    self.priceLabel.text = [self.bowl.bowlPrice stringValue];
}


//Loads when the Smoothee List view

- (void)loadData3 {
    
    self.juiceNameLabel.text = self.smoothee.smootheeName;
    
    NSLog(@"name=%@",_juiceNameLabel.text);
    
    self.NameLabel.text = @"Smoothie";
    
    // NSURL* imageURL = [NSURL URLWithString:self.puppy.photoURL];
    //   [self.puppyImageView setImageWithURL:imageURL placeholderImage:nil];
    self.juiceIngredientLabel.text = self.smoothee.smootheeIngredients;
    self.quantityLabel.text = [self.smoothee.smootheeQuantityPetite stringValue];
    //  self.maxHeightLabel.text = [NSString stringWithFormat:@"Max Height: %@ in", self.puppy.maxHeight];
    self.priceLabel.text = [self.smoothee.smootheePrice stringValue];
    
    NSLog(@"This is the current price of smoothee: %@",self.smoothee.smootheePrice);
}


//Loads when the Health Shot List view

- (void)loadData4 {
    
     self.juiceNameLabel.text = self.healthshot.healthName;
    
    NSLog(@"name=%@",_juiceNameLabel.text);
    
    self.NameLabel.text = @"HealthShot";
    
    // NSURL* imageURL = [NSURL URLWithString:self.puppy.photoURL];
    //   [self.puppyImageView setImageWithURL:imageURL placeholderImage:nil];
    self.juiceIngredientLabel.text = self.healthshot.healthIngredients;
    self.quantityLabel.text = [self.healthshot.healthQuantityPetite stringValue];
    //  self.maxHeightLabel.text = [NSString stringWithFormat:@"Max Height: %@ in", self.puppy.maxHeight];
    self.priceLabel.text = [self.healthshot.healthPrice stringValue];
}



//Loads when the Medicinal List view

 
- (void)loadData5 {
    
     self.juiceNameLabel.text = self.hotdrink.hotName;
    
    NSLog(@"name=%@",_juiceNameLabel.text);
    
    self.NameLabel.text = @"Medicinal";
    
    // NSURL* imageURL = [NSURL URLWithString:self.puppy.photoURL];
    //   [self.puppyImageView setImageWithURL:imageURL placeholderImage:nil];
    self.juiceIngredientLabel.text = self.hotdrink.hotIngredients;
    self.quantityLabel.text =  [self.hotdrink.hotQuantityPetite stringValue];
    //  self.maxHeightLabel.text = [NSString stringWithFormat:@"Max Height: %@ in", self.puppy.maxHeight];
    self.priceLabel.text = [self.hotdrink.hotPrice stringValue];
}





//Loads when the Coffeee based kist view


- (void)loadData6 {
    
    self.juiceNameLabel.text =  self.coffee.coffeeName;
    
    self.NameLabel.text = @"Coffee-Based";
    
    
    // NSURL* imageURL = [NSURL URLWithString:self.puppy.photoURL];
    //   [self.puppyImageView setImageWithURL:imageURL placeholderImage:nil];
    self.juiceIngredientLabel.text = self.coffee.coffeeIngredients;
    self.quantityLabel.text =  [self.coffee.coffeeQuantityPetite stringValue];
    //  self.maxHeightLabel.text = [NSString stringWithFormat:@"Max Height: %@ in", self.puppy.maxHeight];
    self.priceLabel.text = [self.coffee.coffeePrice stringValue] ;
    
    
}




//Fires when the add to cart button is pressed


- (IBAction)addToCartButtonTapped:(id)sender {
    
    
    
    
    CheckoutCart* checkoutCart = [CheckoutCart sharedInstance];
    
    if(checkboxSelectedGrowler || checkboxSelectedRegular || checkboxSelectedPetite){
    
  NSLog(@"array=%ld",(long)b);
        
        
        if(!(self.val)){
            
            self.val = [NSNumber numberWithInt:1];
        }
    
   /*
    checkoutCart.itemDetails = [[NSMutableDictionary alloc] initWithObjects:self.juice.ID,self.juice.name forKeys:@"ID",@"item_name",@"Type",@"quantity";
    */
    
    checkoutCart.instructions = self.specialInstructions.text;
    
    if(!(checkoutCart.quantity)){
    
    checkoutCart.quantity = [[NSMutableDictionary alloc] init];
        
    }
    
    ContainerViewController *cont =[[ContainerViewController alloc] init];
    cont.delegate = self;
    
    /*
    
    for(int i = 0; i < (NSInteger)_lblStepper.text; i++)
    
   */
    
         NSLog(@"array=%ldd",(long)_lblStepper.text);
    
    //For adding all the addins of any category to dictionary
    
    
    /*
    
    for(Addin* addin in self.addinPrice){
        
        [_dict setObject: addin forKey:[NSString stringWithFormat:@"%@-addin",str2]];
        
    }
    */
    
    if(_addinPrice.count>0){
    
    [checkoutCart addAddin:_addinPrice second:str2];
    }
    
    //If Juice and checks for the Type

    if([self.str2 isEqualToString:@"Juice"]){
        
        NSLog(@"%@,%@",cont.leftText,cont.rightText);
        
         [checkoutCart addJuiceCount:self.val];
        
       [checkoutCart addJuice:self.juice];
        
       
        
        if(checkboxSelectedGrowler){
            
            
            [checkoutCart.quantity setObject:@"Growler" forKey:@"Juice"];
            
            
            
        }
        else if(checkboxSelectedRegular){
            
            
            [checkoutCart.quantity setObject:@"Regular" forKey:@"Juice"];
            
            
        }
        
        
        
        else if(checkboxSelectedPetite){
            
            
            [checkoutCart.quantity setObject:@"Petite" forKey:@"Juice"];
            
            
            
            
        }
            
       [checkoutCart addJuiceCount: self.val];
        
        
        
         [[NSUserDefaults standardUserDefaults] setObject:self.lblStepper.text forKey:self.juice.name];
            
        }
    
    
    
    
    
    
    
    //If Bowl and Checks for the Type
    
    
    
    if([self.str2 isEqualToString:@"Bowl"]){
        
         [checkoutCart addBowlCount:self.val];
        
        [checkoutCart addBowl:self.bowl];
        
       

        
        NSLog(@" count_value : %@",self.val);
        
        
        
        if(checkboxSelectedGrowler){
            
            
            [checkoutCart.quantity setObject:@"Growler" forKey:@"Bowl"];
            
            
            
        }
        else if(checkboxSelectedRegular){
            
            
            [checkoutCart.quantity setObject:@"Regular" forKey:@"Bowl"];
            
            
        }
        
        
        
        else if(checkboxSelectedPetite){
            
            
            [checkoutCart.quantity setObject:@"Petite" forKey:@"Bowl"];
            
           
            
            
        }
        
        [checkoutCart addBowlCount: self.val];
    
     [[NSUserDefaults standardUserDefaults] setObject:self.lblStepper.text forKey:self.bowl.bowlName];
    
    }
    
    
    
    
    
    
    
    //If Smoothee and Checks for the Type
    
    
    if([self.str2 isEqualToString:@"Smoothee"]){
        
        NSLog(@"%@",str2);
        
        [checkoutCart addSmootheeCount:self.val];
        
        [checkoutCart addSmoothee:self.smoothee];
        
        

        
         NSLog(@" count_value : %@",self.val);
        
        
        if(checkboxSelectedGrowler){
            
            
            [checkoutCart.quantity setObject:@"Growler" forKey:@"Smoothee"];
            
            
            
        }
        if(checkboxSelectedRegular){
            
            
            [checkoutCart.quantity setObject:@"Regular" forKey:@"Smoothee"];
            
        }
        
        
        
        if(checkboxSelectedPetite){
            
            
            [checkoutCart.quantity setObject:@"Petite" forKey:@"Smoothee"];
            
            
        }
        
        [checkoutCart addSmootheeCount: self.val];
        
        
         [[NSUserDefaults standardUserDefaults] setObject:self.lblStepper.text forKey:self.smoothee.smootheeName];
    }
    
    
    
    
    
    
    
    
    //If HealthShot and cheks for the type
    
    
    
    if([self.str2 isEqualToString:@"HealthShot"]){
        
          [checkoutCart addHealthshotCount:self.val];
        
        [checkoutCart addHealthShot:self.healthshot];
        
       
      

        
        if(checkboxSelectedGrowler){
            
            
            [checkoutCart.quantity setObject:@"Growler" forKey:@"HealthShot"];
           
            
            
        }
        if(checkboxSelectedRegular){
            
            
            [checkoutCart.quantity setObject:@"Regular" forKey:@"HealthShot"];
           
            
        }
        
        
        
        if(checkboxSelectedPetite){
            
            
            [checkoutCart.quantity setObject:@"Petite" forKey:@"HealthShot"];
            
            
            
            
        }
        
         [checkoutCart addHealthshotCount: self.val];
        
        
        
         [[NSUserDefaults standardUserDefaults] setObject:self.lblStepper.text forKey:self.healthshot.healthName];
        
    }
    
    
    
    
    
    
    
    
    // If Hot Drink and Checks for the Type
    
    
    
    if([self.str2 isEqualToString:@"HotDrink"]){
        
         [checkoutCart addHotdrinkCount:self.val];
        
        [checkoutCart addHotDrink:self.hotdrink];
        
        
       

        
        
        
        if(checkboxSelectedGrowler){
            
            
            [checkoutCart.quantity setObject:@"Growler" forKey:@"HotDrink"];
            
            
            
        }
        if(checkboxSelectedRegular){
            
            
            [checkoutCart.quantity setObject:@"Regular" forKey:@"HotDrink"];
            
            
        }
        
        
        
        if(checkboxSelectedPetite){
            
            
            [checkoutCart.quantity setObject:@"Petite" forKey:@"HotDrink"];
            
            
            
            
        }
        
        [checkoutCart addHotdrinkCount: self.val];
        
        
         [[NSUserDefaults standardUserDefaults] setObject:self.lblStepper.text forKey:self.hotdrink.hotName];
    }
    
    
    
    
    
    
    
    
    //If Coffee based and Checks for the Type
    

    
    if([self.str2 isEqualToString:@"Coffee"]){
        
         [checkoutCart addCoffeeCount:self.val];
        
        [checkoutCart addCoffee:self.coffee];
        
       

        
        if(checkboxSelectedGrowler){
            
            
            [checkoutCart.quantity setObject:@"Growler" forKey:@"Coffee"];
           
            
            
        }
        if(checkboxSelectedRegular){
            
            
            [checkoutCart.quantity setObject:@"Regular" forKey:@"Coffee"];
           
            
        }
        
        
        
        if(checkboxSelectedPetite){
            
            
            [checkoutCart.quantity setObject:@"Petite" forKey:@"Coffee"];
            
        }

        [checkoutCart addCoffeeCount: self.val];
        
        [[NSUserDefaults standardUserDefaults] setObject:self.lblStepper.text forKey:self.coffee.coffeeName];
    }

    
//    CheckoutViewController *wc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"CheckoutViewController"];
//    [self.navigationController pushViewController:wc animated:YES];
        
        
    }
    
    else{
        
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"No Quantity Type" message:@"Please select one quantity type" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil ];
        
        [alert show];

        
        
    }


}


//If the Type of the Juice of the juice selection is selected, The corresponding boolean is enabled



- (IBAction)quantityPressed:(UISegmentedControl *)sender {
    
    
    
    
    if(quantityPressed.selectedSegmentIndex == 0)
        
    {
        checkboxSelectedRegular = YES;
        //self.view.backgroundColor = [UIColor redColor];
        
        [ appdelegate.dictforquantityType setObject: @"YES" forKey:[NSString stringWithFormat:@"%@%ld",currentCategoryItem ,(long)quantityPressed.selectedSegmentIndex]];
        
        [appdelegate.dictforquantityType removeObjectForKey:[NSString stringWithFormat:@"%@2",currentCategoryItem]];
        [appdelegate.dictforquantityType removeObjectForKey:[NSString stringWithFormat:@"%@1",currentCategoryItem]];
        
    }
    
    else
        
        if(quantityPressed.selectedSegmentIndex == 1)
            
        {
            checkboxSelectedPetite = YES;
            //self.view.backgroundColor = [UIColor greenColor];
            
            [appdelegate.dictforquantityType setObject: @"YES" forKey:[NSString stringWithFormat:@"%@%ld",currentCategoryItem,(long)quantityPressed.selectedSegmentIndex]];
            
            [appdelegate.dictforquantityType removeObjectForKey:[NSString stringWithFormat:@"%@2",currentCategoryItem]];
            [appdelegate.dictforquantityType removeObjectForKey:[NSString stringWithFormat:@"%@0",currentCategoryItem]];
            
            
        }
    
    else
            
        if(quantityPressed.selectedSegmentIndex == 2)
                
        {
         checkboxSelectedGrowler = YES;            //self.view.backgroundColor = [UIColor blueColor];
            
            [appdelegate.dictforquantityType setObject: @"YES" forKey:[NSString stringWithFormat:@"%@%ld",currentCategoryItem ,(long)quantityPressed.selectedSegmentIndex]];
            
            [appdelegate.dictforquantityType removeObjectForKey:[NSString stringWithFormat:@"%@0",currentCategoryItem]];
            [appdelegate.dictforquantityType removeObjectForKey:[NSString stringWithFormat:@"%@1",currentCategoryItem]];
            
                
        }
    
    
    
    
    
}





@end






