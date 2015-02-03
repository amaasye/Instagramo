//
//  LoginViewController.m
//  Instagramo
//
//  Created by Syed Amaanullah on 2/2/15.
//  Copyright (c) 2015 Syed, Kyle and JP. All rights reserved.
//
#import <Parse/Parse.h>
#import "LoginViewController.h"

@interface LoginViewController ()
@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)onLoginButtonTapped:(UIButton *)sender {
    [PFUser logInWithUsernameInBackground:self.usernameTextField.text password: self.passwordTextField.text block:^(PFUser *user, NSError *error) {
        if  (error != nil) {
            [self showAlert];
        }
        //    segueID: "loginSegue"
        [self performSegueWithIdentifier:@"loginsegue" sender:self];
    }];
}

- (IBAction)onSignupButtonTapped:(UIButton *)sender {
    PFUser* user = [PFUser user];
    user.username = self.usernameTextField.text;
    user.password = self.usernameTextField.text;
    user.email = [NSString stringWithFormat:@"%@@mobilemakers.co", self.usernameTextField.text];

    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (error != nil) {
            [self showAlert];
        }
        else {
            //    segueID: "signupSegue"
            [self performSegueWithIdentifier:@"signupsegue" sender:self];
        }
    }];
}

-(void)showAlert {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry Broski" message:@"You need to create an account before you can access this awesomeness." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];

    [alert show];
}



@end
