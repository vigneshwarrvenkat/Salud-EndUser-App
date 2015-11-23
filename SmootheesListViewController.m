//
//  SmootheesListViewController.m
//  Salud Juicery ios
//
//  Created by Salud Juice Team (Vigneshwarr)on 9/13/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//


#import "JuiceDetailViewController.h"
#import "MenuDetailsViewController.h"
#import "SmootheesListViewController.h"

#import "Smoothee.h"
#import "Smoothees.h"
#import "SmootheesCell.h"


@interface SmootheesListViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *smootheesArray;

@property NSArray *item;

@property (assign, nonatomic) NSInteger selectedIndex;

@property (strong, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation SmootheesListViewController

@synthesize smoothees;

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"SmoothieListViewController viewWillAppear");
    NSLog(@"This is the current tab index : %ld",(long)self.selectedIndex);
}

- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    
    _smootheesArray = [@[@"photo_sample_01",
                     @"photo_sample_02",
                     @"photo_sample_03",
                     @"photo_sample_04",
                     @"photo_sample_05",
                     @"photo_sample_06",
                     @"photo_sample_07",
                     @"photo_sample_08",
                     @"photo_sample_01",
                     @"photo_sample_02",
                     @"photo_sample_03",
                     @"photo_sample_04",
                     @"photo_sample_05",
                     @"photo_sample_06",
                     @"photo_sample_07",
                     @"photo_sample_08",] mutableCopy];
    
    //self.item = @[@"Item 1", @"Item 2", @"Item 3", @"Item 4", @"Item 5"];
    
  //  [self.tableView registerNib:[UINib nibWithNibName:@"BowlsCell" bundle:nil] forCellReuseIdentifier:@"BowlsCell"];

    
    [self.tableView registerNib:[UINib nibWithNibName:@"SmootheesCell" bundle:nil] forCellReuseIdentifier:@"SmootheesCell"];
    
    
    self.str4 = @"Smoothee";
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [Smoothees sharedInstance].allSmoothees.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    /*
     
     static NSString *cellIdentifier = @"BowlsCell";
     BowlsCell *cell = (BowlsCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
     
     cell.bowlImageView.image = [UIImage imageNamed:_bowlsArray[indexPath.row]];
     cell.bowlNameLabel.text = [NSString stringWithFormat:@"Bowls %ld",(long)indexPath.row];
     return cell;
     
     */
    Smoothee* smoothee = [Smoothees sharedInstance].allSmoothees[indexPath.row];
    
    SmootheesCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"SmootheesCell"];
    //  [cell.puppyImageView setImageWithURL:[NSURL URLWithString:puppy.photoURL]];
    cell.smootheesNameLabel.text =  smoothee.smootheeName;
    cell.smootheesIngredientsLabel.text = smoothee.smootheeIngredients;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.priceSmoothee.text = [smoothee.smootheePrice stringValue] ;
    
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
    
    wc.smoothee = [Smoothees sharedInstance].allSmoothees[self.selectedIndex];
    
    wc.str2 = _str4;
    
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


/*
 
 - (NSAttributedString *)DYAlertPickView:(DYAlertPickView *)pickerView
 titleForRow:(NSInteger)row{
 NSAttributedString *str = [[NSAttributedString alloc] initWithString:self.item[row]];
 return str;
 }
 - (NSInteger)numberOfRowsInDYAlertPickerView:(DYAlertPickView *)pickerView {
 return self.item.count;
 }
 - (void)DYAlertPickView:(DYAlertPickView *)pickerView didConfirmWithItemAtRow:(NSInteger)row{
 NSLog(@"%@ didConfirm", self.item[row]);
 }
 
 - (void)DYAlertPickerViewDidClickCancelButton:(DYAlertPickView *)pickerView {
 NSLog(@"Canceled");
 }
 
 - (void)DYAlertPickerViewDidClickSwitchButton:(DYAlertPickView *)pickerView switchButton:(UISwitch *)switchButton {
 NSLog(@"switch:%@",(switchButton.isOn?@"On":@"Off"));
 }
 
 
 - (BOOL)DYAlertPickerViewStateOfSwitchButton {
 return YES;
 }
 
 - (IBAction)showAlertPickerView:(id)sender {
 DYAlertPickView *picker = [[DYAlertPickView alloc] initWithHeaderTitle:@"Title" cancelButtonTitle:@"Cancel" confirmButtonTitle:@"Confirm" switchButtonTitle:@"Don't ask me"];
 picker.delegate = self;
 picker.dataSource = self;
 [picker showAndSelectedIndex:3];
 }
 
 
 */



- (void)dataRequestCompletedWithJsonObject:(id)jsonObject{
    
    NSDictionary *recipeDictionary = (NSDictionary*)jsonObject;
    NSArray* recipeArray = (NSArray*) [recipeDictionary objectForKey:@"recipes"];
    
    for(NSDictionary* dic in recipeArray) {
        Smoothee *smoothee = [[Smoothee alloc ] init];
        
        smoothee.smootheeName = [dic objectForKey:@"title"];
        smoothee.thumbnail = [dic objectForKey:@"thumb"];
        
        [smoothees addObject:smoothee];
        
    }
    
}




@end

