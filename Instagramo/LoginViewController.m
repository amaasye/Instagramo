//
//  LoginViewController.m
//  Instagramo
//
//  Created by Syed Amaanullah on 2/2/15.
//  Copyright (c) 2015 Syed, Kyle and JP. All rights reserved.
//
#import <Parse/Parse.h>
#import "LoginViewController.h"

@interface LoginViewController () <UIAlertViewDelegate>
@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//- (void)viewDidAppear:(BOOL)animated {
//    self.usernameTextField.text = @"";
//    self.passwordTextField.text = @"";
//}

- (IBAction)onLoginButtonTapped:(UIButton *)sender {
    [PFUser logInWithUsernameInBackground:self.usernameTextField.text password: self.passwordTextField.text block:^(PFUser *user, NSError *error) {
        if  (error != nil) {
            [self showAlert];
        }
        else if (error == nil) {
            [self performSegueWithIdentifier:@"loginSegue" sender:self];
        }
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
            [self performSegueWithIdentifier:@"signupSegue" sender:self];
        }
    }];
}

//helper method for the error alert
-(void)showAlert {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry Broski \n Lo Siento wey" message:@"You need to create an account before you can access this awesomeness. \n Es necesario crear una cuenta antes de poder acceder a esta genialidad. " delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];

    [alert show];
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == [alertView cancelButtonIndex]) {
        [self viewDidLoad];
        NSLog(@"It's All Good");
    }
}


@end
