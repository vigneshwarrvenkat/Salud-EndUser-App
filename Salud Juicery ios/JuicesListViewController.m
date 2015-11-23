//
//  JuicesListViewController.m
//  Salud Juicery ios
//
//  Created by Salud Juice Team on 9/6/15.
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


@interface JuicesListViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *juiceListArray;


@property (assign, nonatomic) NSInteger selectedIndex;
@property (strong, nonatomic) IBOutlet UITableView* tableView;

@end

@implementation JuicesListViewController


@synthesize juices;

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"JuicesListViewController viewWillAppear");
}

- (void)viewDidLoad {
    
    [self loadRecipes];
    [super viewDidLoad];
    
    _juiceListArray = [@[@"photo_sample_01",
                        @"photo_sample_02",
                        @"photo_sample_03",
                        @"photo_sample_04",
                        @"photo_sample_05",
                        @"photo_sample_06",
                        @"photo_sample_07",
                        @"photo_sample_08",] mutableCopy];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"JuicesCell" bundle:nil] forCellReuseIdentifier:@"JuicesCell"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [Juices sharedInstance].allJuices.count;
}

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
    
    Juice* juice = [Juices sharedInstance].allJuices[indexPath.row];
    
    JuicesCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"JuicesCell"];
  //  [cell.puppyImageView setImageWithURL:[NSURL URLWithString:puppy.photoURL]];
    cell.juiceNameLabel.text =  juice.name;
    cell.ingredientsLabel.text = juice.ingredients;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
    
    
    
    
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

- (void)dataRequestCompletedWithJsonObject:(id)jsonObject{
    
    NSDictionary *recipeDictionary = (NSDictionary*)jsonObject;
    NSArray* recipeArray = (NSArray*) [recipeDictionary objectForKey:@"recipes"];
    
    for(NSDictionary* dic in recipeArray) {
        Juice *juice = [[Juice alloc ] init];
        
        juice.name = [dic objectForKey:@"title"];
        juice.thumbnail = [dic objectForKey:@"thumb"];
        
        [juices addObject:juice];
        
    }
    
}




























#pragma mark - UITableViewDataSource methods





#pragma mark - UITableViewDelegate methods


#pragma mark - UIStoryboard methods

/*


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    JuiceDetailViewController* viewController = (JuiceDetailViewController*) segue.destinationViewController;
    viewController.juice = [Juices sharedInstance].allJuices[self.selectedIndex];
}


*/






















@end
