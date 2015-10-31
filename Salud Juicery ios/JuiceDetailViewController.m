//
//  JuiceDetailViewController.m
//  Salud Juicery ios
//
//  Created by Salud Juice Team on 9/7/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import "JuiceDetailViewController.h"
#import "CheckoutCart.h"
//#import "AFNetworking.h"




@interface JuiceDetailViewController ()


@property (strong, nonatomic) IBOutlet UILabel *juiceNameLabel;
//@property (strong, nonatomic) IBOutlet UIImageView *puppyImageView;
@property (strong, nonatomic) IBOutlet UILabel *juiceIngredientLabel;
@property (strong, nonatomic) IBOutlet UILabel *quantityLabel;
//@property (strong, nonatomic) IBOutlet UILabel *maxHeightLabel;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong, nonatomic) IBOutlet UIButton *addToCartButton;

- (IBAction)addToCartButtonTapped:(id)sender;



@end


@implementation JuiceDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view, typically from a nib.
    
    self.paStepper.value = 0.03;
    self.paStepper.minimumValue = 0;
    self.paStepper.maximumValue = 50;
    self.paStepper.editableManually = NO;
    
    CGRect mainScreenRect = [[UIScreen mainScreen] bounds];
    
    arryList=@[@"Lemon                   S2",
               @"Almond                  $2",
               @"Ginger                $0.5",
               @"Protein               $0.5",
               @"Milk                  $0.5",
               @"Cashew                $0.5",
               @"Grass                 $0.5",
               @"Onion                 $0.5",
               @"Honey                 $0.5",
               @"Pista                 $0.5",];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self loadData];
    
}



-(void)showPopUpWithTitle:(NSString*)popupTitle withOption:(NSArray*)arrOptions xy:(CGPoint)point size:(CGSize)size isMultiple:(BOOL)isMultiple{
    
    
    Dropobj = [[DropDownListView alloc] initWithTitle:popupTitle options:arrOptions xy:point size:size isMultiple:isMultiple];
    Dropobj.delegate = self;
    [Dropobj showInView:self.view animated:YES];
    
    /*----------------Set DropDown backGroundColor-----------------*/
    [Dropobj SetBackGroundDropDown_R:0.0 G:108.0 B:194.0 alpha:0.70];
    
}


- (void)DropDownListView:(DropDownListView *)dropdownListView didSelectedIndex:(NSInteger)anIndex{
    /*----------------Get Selected Value[Single selection]-----------------*/
    _lblSelectedCountryNames.text=[arryList objectAtIndex:anIndex];
}
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
- (void)DropDownListViewDidCancel{
    
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    
    if ([touch.view isKindOfClass:[UIView class]]) {
        [Dropobj fadeOut];
    }
}


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

- (IBAction)DropDownPressed:(id)sender {
    
    
    [Dropobj fadeOut];
    [self showPopUpWithTitle:@"Select Addins" withOption:arryList xy:CGPointMake(16, 58) size:CGSizeMake(287, 330) isMultiple:YES];
}

- (IBAction)DropDownSingle:(id)sender {
    [Dropobj fadeOut];
    [self showPopUpWithTitle:@"Select Addins" withOption:arryList xy:CGPointMake(16, 150) size:CGSizeMake(287, 280) isMultiple:NO];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setPaStepper:nil];
    
    [super viewDidUnload];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
























- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}





- (void)viewWillAppear:(BOOL)animated
{
    CheckoutCart* checkoutCart = [CheckoutCart sharedInstance];
    self.addToCartButton.selected = [checkoutCart containsJuice:self.juice] ? YES : NO;
}

- (void)loadData {
    
    self.juiceNameLabel.text = [NSString stringWithFormat:@"Juice Name : %@", self.juice.name];
    
     NSLog(@"name=%@",_juiceNameLabel.text);
    
   // NSURL* imageURL = [NSURL URLWithString:self.puppy.photoURL];
 //   [self.puppyImageView setImageWithURL:imageURL placeholderImage:nil];
    self.juiceIngredientLabel.text = [NSString stringWithFormat:@"Ingredients: %@", self.juice.ingredients];
    self.quantityLabel.text = [NSString stringWithFormat:@"Quantity: %@ lbs", self.juice.quantity];
  //  self.maxHeightLabel.text = [NSString stringWithFormat:@"Max Height: %@ in", self.puppy.maxHeight];
    self.priceLabel.text = [NSString stringWithFormat:@"Price: $%@", self.juice.price];
}

- (IBAction)addToCartButtonTapped:(id)sender {
    CheckoutCart* checkoutCart = [CheckoutCart sharedInstance];
    
    if (!self.addToCartButton.selected) {
        [checkoutCart addJuice:self.juice];
        self.addToCartButton.selected = YES;
    }
    else {
        [checkoutCart removeJuice:self.juice];
        self.addToCartButton.selected = NO;
    }
}

@end






