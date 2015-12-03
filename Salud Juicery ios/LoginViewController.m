//
//  LoginViewController.m
//  Salud Juicery ios
//
//  Created by Salud Juice Team (Vigneshwarr)on 8/28/15.
//  Copyright (c) 2015 Salud Juice Team. All rights reserved.
//

#import "LoginViewController.h"

#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "Settings.h"

#import <GoogleSignIn/GoogleSignIn.h>

#import "RemoteLogin.h"

#import "CheckoutCart.h"

#import "CustomIOSAlertView.h"

static NSString * const kClientId = @"673101349738-h4v98lcg2i45i8cuf899fei7qrv8qtas.apps.googleusercontent.com";


@implementation LoginViewController
{
    BOOL _viewDidAppear;
    BOOL _viewIsVisible;
}





#pragma mark - Object lifecycle

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // We wire up the FBSDKLoginButton using the interface builder
        // but we could have also explicitly wired its delegate here.
    }
    return self;
}




- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}





#pragma mark - View Management

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    //Google
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(observeProfileChange:) name:FBSDKProfileDidChangeNotification object:nil];
    
    
    //Facebook
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(observeTokenChange:) name:FBSDKAccessTokenDidChangeNotification object:nil];
    self.loginButton.readPermissions = @[@"public_profile", @"user_friends"];
    
    // If there's already a cached token, read the profile information.
    if ([FBSDKAccessToken currentAccessToken]) {
      //  [self observeProfileChange:nil];
    }
    
    
    //facebook read permission
    
    _loginButton.readPermissions =
    @[@"public_profile", @"email", @"user_friends"];
    
    
    
    //Google sigin//
    
    // TODO(developer) Configure the sign-in button look/feel
    
    NSLog(@"view did load:");
    
    
    [GIDSignIn sharedInstance].uiDelegate = self;
    [GIDSignInButton class];
    
    GIDSignIn *signIn = [GIDSignIn sharedInstance];
    signIn.shouldFetchBasicProfile = YES;
    signIn.delegate = self;
    signIn.uiDelegate = self;
    
    
   // signIn.
    GIDSignInButton *button;
    
    button.hidden = YES;
    
    //facebook
    
    self.loginButton.hidden = YES;
    
    self.loginButton.delegate = self;
    self.loginButton.readPermissions = @[@"public_profile", @"email"];
    
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
}





//When the Log out Button is pressed..

- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {
    if (_viewIsVisible) {
       // [self performSegueWithIdentifier:@"continue" sender:self];
    }
    
    [[FBSDKLoginManager new] logOut];
    
    
}






- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    Settings *settings = [Settings defaultSettings];
    if (_viewDidAppear) {
        _viewIsVisible = YES;
        
        // reset
        settings.shouldSkipLogin = NO;
    } else {
        if (settings.shouldSkipLogin || [FBSDKAccessToken currentAccessToken]) {
           // [self performSegueWithIdentifier:@"showMain" sender:nil];
        } else {
            _viewIsVisible = YES;
        }
        _viewDidAppear = YES;
    }
}






- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [Settings defaultSettings].shouldSkipLogin = YES;
    _viewIsVisible = NO;
}





//Remote action for the Custom Login

#pragma mark - Actions

- (IBAction)loginBtn:(UIButton *)sender {
    
    NSArray *keys = [NSArray arrayWithObjects:@"username",@"password", nil];
    
    NSArray *values =  [NSArray arrayWithObjects:_username.text,_password.text, nil];
    
    
    RemoteLogin *remote = [[RemoteLogin alloc] init];
    
    int res = [remote getConnection:keys forobjects:values forurl:@"http://ec2-52-88-11-130.us-west-2.compute.amazonaws.com:3000/auth/login"];
    
    if(res==1)
    {
      NSLog(@"Failure");
    }
    else
    {
        
        
        CheckoutCart* checkout = [CheckoutCart sharedInstance];
        
        checkout.userId =@"";
        checkout.userEmail = _username.text;
        [self performSegueWithIdentifier:@"showMain" sender:self];
        NSLog(@"Success");
    }
}





- (IBAction)showLogin:(UIStoryboardSegue *)segue
{
    // This method exists in order to create an unwind segue to this controller.
}






//Login button delegate to show the result of the login when the button is pressed.

#pragma mark - FBSDKLoginButtonDelegate

- (void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error {
    
    NSLog(@"Hi facebook");
    
    
    if (error) {
        NSLog(@"Unexpected login error: %@", error);
        NSString *alertMessage = error.userInfo[FBSDKErrorLocalizedDescriptionKey] ?: @"There was a problem logging in. Please try again later.";
        NSString *alertTitle = error.userInfo[FBSDKErrorLocalizedTitleKey] ?: @"Oops";
        [[[UIAlertView alloc] initWithTitle:alertTitle
                                    message:alertMessage
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    } else {
       // if (_viewIsVisible) {
            
            NSString *fbAccessToken = [FBSDKAccessToken currentAccessToken].tokenString;
            NSLog(@"Face access_token:  %@", fbAccessToken);
        
        
        if ([FBSDKAccessToken currentAccessToken]) {
            
            NSMutableDictionary* parameters = [NSMutableDictionary dictionary];
            [parameters setValue:@"id,name,email" forKey:@"fields"];
            
            
            
            [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{@"fields": @"email,name,first_name"}]
             startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, NSDictionary *result, NSError *error) {
                 if (!error) {
                     
                     
                   //  _fbId = [result objectForKey:@"id"];
                   //  _fbName = [result objectForKey:@"name"];
                  //   _fbEmail = [result objectForKey:@"email"];
                     
                   //  NSLog(@"%@",_fbId);
                     
                      CheckoutCart* checkout = [CheckoutCart sharedInstance];
                     
                     checkout.userId =[result objectForKey:@"name"];
                     checkout.userEmail = [result objectForKey:@"email"];
                     
                     NSLog(@"name :%@",[result objectForKey:@"name"]);
                     NSLog(@"email :%@",[result objectForKey:@"email"]);
                     
                    // NSLog(@"fetched facebook user:%@", result[@"email"]);
                 }
             }];
            
//            NSArray *keys = [[NSArray alloc] initWithObjects:@"password",@"username", nil];
//            NSArray *values= [[NSArray alloc] initWithObjects:txtFld3.text,txtFld1.text, nil];
//            
            
            //Server side authentication//
            
//            RemoteLogin *remote = [[RemoteLogin alloc] init];
//            
//            int res = [remote getConnection:keys forobjects:values forurl:@"http://ec2-52-88-11-130.us-west-2.compute.amazonaws.com:3000/auth/signup"];
//            if(res==2)
//            {
//                [self showErrorMsg:@"Success"];
//                [alertView close];
//            }
//            else
//            {
//                [self showErrorMsg:@"Error"];
//            }

            
            
            
            
        }
        
            
           [self performSegueWithIdentifier:@"showMain" sender:self];
        
    }
}







//Action whnr the login button is clicked

-(void)loginButtonClicked
{
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login
     logInWithReadPermissions: @[@"public_profile"]
     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         if (error) {
             NSLog(@"Process error");
         } else if (result.isCancelled) {
             NSLog(@"Cancelled");
         } else {
             NSLog(@"Logged in");
             [self performSegueWithIdentifier:@"showMain" sender:self];

         }
     }];
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






//Method to access the token from the Google server


- (void)signIn:(GIDSignIn *)signIn
didSignInForUser:(GIDGoogleUser *)user
     withError:(NSError *)error {
    // Perform any operations on signed in user here.
    NSString *userId = user.userID;                  // For client-side use only!
   // NSString *idToken = user.authentication.idToken; // Safe to send to the server
    //    NSString *name = user.profile.name;
    NSString *email = user.profile.email;
    NSString *accessToken = user.authentication.accessToken;
    // ...
    
    CheckoutCart* checkout = [CheckoutCart sharedInstance];
    
    checkout.userId = userId;
    checkout.userEmail = email;
    
    //   NSString *accessToken = user.authentication.accessToken;
    NSLog(@"access_token:%@",accessToken);
    // [self performSegueWithIdentifier:@"mainview" sender:self];
    
    
     [self performSegueWithIdentifier:@"showMain" sender:self];
    
}





- (IBAction)didTapSignOut:(id)sender {
    NSLog(@"sinout:@");
    [[GIDSignIn sharedInstance] signOut];
}




#pragma mark - Observations



- (void)observeProfileChange:(NSNotification *)notfication {
    if ([FBSDKProfile currentProfile]) {
        NSString *title = [NSString stringWithFormat:@"continue as %@", [FBSDKProfile currentProfile].name];
      //  [self.continueButton setTitle:title forState:UIControlStateNormal];
    }
}




//Method to get notification when the token is changed

- (void)observeTokenChange:(NSNotification *)notfication {
    if (![FBSDKAccessToken currentAccessToken]) {
       // [self.continueButton setTitle:@"continue as a guest" forState:UIControlStateNormal];
    } else {
        [self observeProfileChange:nil];
    }
}
 



//Action whent he Register button is clicked

- (IBAction)registerBtn:(UIButton *)sender {
    
    
    CustomIOSAlertView *customAlertView = [[CustomIOSAlertView alloc] init];
    
    
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 250, 150)];
    
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(10,0,200,25)];
    title.text = @"Register Information";
    title.textAlignment = NSTextAlignmentCenter;
    title.textColor = [UIColor blackColor];
    title.backgroundColor = [UIColor clearColor];
    title.numberOfLines = 0;
    [v addSubview:title];
    
txtFld1 = [[UITextField alloc] initWithFrame:CGRectMake(10,40,200,25)];
txtFld1.borderStyle = UITextBorderStyleRoundedRect;
txtFld1.placeholder = @"xyz@gmail.com";
txtFld1.keyboardAppearance = UIKeyboardAppearanceAlert;
    txtFld1.tag = 1;
txtFld1.delegate = nil;
    [v addSubview:txtFld1];
    
txtFld2 = [[UITextField alloc] initWithFrame:CGRectMake(10,70,200,25)];
txtFld2.placeholder = @"Password";
txtFld2.borderStyle = UITextBorderStyleRoundedRect;
        txtFld2.tag = 2;
txtFld2.secureTextEntry=YES;
txtFld2.delegate = nil;
    [v addSubview:txtFld2];
    
    
txtFld3 = [[UITextField alloc] initWithFrame:CGRectMake(10,100,200,25)];
txtFld3.placeholder = @"Confirm Password";
txtFld3.secureTextEntry=YES;
        txtFld3.tag = 3;
txtFld3.borderStyle = UITextBorderStyleRoundedRect;
txtFld3.delegate =nil;
    [v addSubview:txtFld3];
    
    [customAlertView setDelegate:self];
    [customAlertView setContainerView:v];
    
    // Modify the parameters
    [customAlertView setButtonTitles:[NSMutableArray arrayWithObjects:@"Submit", @"Cancel", nil]];
    [customAlertView setDelegate:self];
    
    [customAlertView show];
    
    
}


- (void)customIOS7dialogButtonTouchUpInside: (CustomIOSAlertView *)alertView clickedButtonAtIndex: (NSInteger)buttonIndex
{
    
    
    if(buttonIndex == 0 )
    {
        
        NSString *emailRegEx = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
        NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
        if([txtFld1.text isEqualToString:@""])
        {
            [self showErrorMsg:@"username cannot be empty"];
        }
        else if ([emailTest evaluateWithObject:txtFld1.text] == NO)
        {
            [self showErrorMsg:@"enter valid username..Ex: ram@gmail.com"];
        }
        else if([txtFld2.text isEqualToString:@""])
        {
            [self showErrorMsg:@"password cannot be empty"];
        }
        else if([txtFld3.text isEqualToString:@""])
        {
            [self showErrorMsg:@"confirm password cannot be empty"];
        }
        else if(![txtFld2.text isEqualToString:txtFld3.text])
        {
            [self showErrorMsg:@"password and confirm password not matching"];
        }
        else
        {
            NSArray *keys = [[NSArray alloc] initWithObjects:@"password",@"username", nil];
            NSArray *values= [[NSArray alloc] initWithObjects:txtFld3.text,txtFld1.text, nil];
            
            RemoteLogin *remote = [[RemoteLogin alloc] init];
            
            int res = [remote getConnection:keys forobjects:values forurl:@"http://ec2-52-88-11-130.us-west-2.compute.amazonaws.com:3000/auth/signup"];
            if(res==2)
            {
                [self showErrorMsg:@"Success"];
                [alertView close];
            }
            else
            {
                [self showErrorMsg:@"Error"];
            }

        }
        
    }
    else
    {
        [alertView close];
    }
}

-(void)showErrorMsg:(NSString *)msg
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Register Error" message:msg delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
    [alert show];
    
}

@end
