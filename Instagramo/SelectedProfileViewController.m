//
//  SelectedProfileViewController.m
//  Instagramo
//
//  Created by Kyle Magnesen on 2/5/15.
//  Copyright (c) 2015 Syed, Kyle and JP. All rights reserved.
//

#import "SelectedProfileViewController.h"
#import <Parse/Parse.h>
#import "Photo.h"

@interface SelectedProfileViewController ()

@property (strong, nonatomic) IBOutlet UILabel *followersLabel;
@property (strong, nonatomic) IBOutlet UILabel *followingsLabel;
@property NSMutableArray *userDetails;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *usernameLabel;

@end

@implementation SelectedProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadUser];
}

- (void) setImageView:(UIImageView *)imageView{
    _imageView = imageView;
    [self.imageView reloadInputViews];
}

- (void) setUsernameLabel:(UILabel *)usernameLabel{
    _usernameLabel = usernameLabel;
    [self.usernameLabel reloadInputViews];
}

- (void) loadUser{
    Photo *selectedUser = [Photo new];
    selectedUser.image = self.selectedUser.image;
    self.imageView.image = selectedUser.image;

    selectedUser.username = self.selectedUser.username;
    self.usernameLabel.text = selectedUser.username;
}

- (IBAction)onFollowersLabelTapped:(UITapGestureRecognizer *)sender {
    CGPoint point = [sender locationInView:self.view];
    if (CGRectContainsPoint(self.followersLabel.frame, point)) {
        [self performSegueWithIdentifier:@"fllrsSegue" sender:self];
    }
}
- (IBAction)onFollowingsLabelTapped:(UITapGestureRecognizer *)sender {
    CGPoint point = [sender locationInView:self.view];
    if (CGRectContainsPoint(self.followingsLabel.frame, point)) {
        [self performSegueWithIdentifier:@"fllingsSegue" sender:self];
    }


}
- (IBAction)onFollowButtonTapped:(UIButton *)sender {
    
}

@end
