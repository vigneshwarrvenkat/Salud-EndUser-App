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
    
    
    
    
    
    
    //Google sigin//
    
    // TODO(developer) Configure the sign-in button look/feel
    
    NSLog(@"view did load:");
    
    
    [GIDSignIn sharedInstance].uiDelegate = self;
    [GIDSignInButton class];
    
    GIDSignIn *signIn = [GIDSignIn sharedInstance];
    signIn.shouldFetchBasicProfile = YES;
    signIn.delegate = self;
    signIn.uiDelegate = self;
    
    
    
    
    
    //facebook
    
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
    //    NSString *userId = user.userID;                  // For client-side use only!
    //    NSString *idToken = user.authentication.idToken; // Safe to send to the server
    //    NSString *name = user.profile.name;
    //  NSString *email = user.profile.email;
    NSString *accessToken = user.authentication.accessToken;
    // ...
    
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
    
    
   /* UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"Register" message:@"Please enter details below:" delegate:self cancelButtonTitle:@"Submit" otherButtonTitles:@"Cancel",nil];
    
    //set the style type of alertbox whether single or multiple inputs needed
    alertView.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    
    //create a textfield for username
    UITextField * uname = [alertView textFieldAtIndex:0];
    uname.keyboardType = UIKeyboardTypeDefault;
    uname.placeholder = @"Username";
    
    //create a textfield for username
    UITextField * pwd = [alertView textFieldAtIndex:1];
    pwd.keyboardType = UIKeyboardTypeDefault;
    pwd.placeholder = @"Password";

    
    //display the alertbox
    [alertView show];*/
    
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 250, 100)];
    
    UITextField *textField1 = [[UITextField alloc] initWithFrame:CGRectMake(10,0,252,25)];
    textField1.borderStyle = UITextBorderStyleRoundedRect;
    textField1.placeholder = @"Username";
    textField1.keyboardAppearance = UIKeyboardAppearanceAlert;
    textField1.delegate = self;
    [v addSubview:textField1];
    
    UITextField *textField2 = [[UITextField alloc] initWithFrame:CGRectMake(10,30,252,25)];
    textField2.placeholder = @"Password";
    textField2.borderStyle = UITextBorderStyleRoundedRect;
    textField2.keyboardAppearance = UIKeyboardAppearanceAlert;
    textField2.delegate = self;
    [v addSubview:textField2];
    
    
    UITextField *textField3 = [[UITextField alloc] initWithFrame:CGRectMake(10,60,252,25)];
    textField3.placeholder = @"Address";
    textField3.borderStyle = UITextBorderStyleRoundedRect;
    textField3.keyboardAppearance = UIKeyboardAppearanceAlert;
    textField3.delegate = self;
    [v addSubview:textField3];
    
    
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"TEST" message:@"" delegate:nil cancelButtonTitle:@"NO" otherButtonTitles:@"YES", nil];
    [av setValue:v  forKey:@"accessoryView"];
    [av show];
    
    
}
@end
