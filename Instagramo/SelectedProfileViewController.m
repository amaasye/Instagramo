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
#import "User.h"

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

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
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
//    PFQuery *storePhoto = [user objectForKey:@"User"];
    PFQuery *queryUser = [PFUser query];
    [queryUser whereKey: @"username" equalTo:self.selectedUser.username];

    [queryUser getObjectInBackgroundWithId:self.selectedUser.objectId block:^(PFObject *object, NSError *error) {
        if (!error) {
//            for (PFObject *object in object) {
                PFFile *profilePic = [object objectForKey:@"profilePic"];
                [profilePic getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
                    UIImage *image = [UIImage imageWithData:data];
                    self.imageView.image = image;
                    [self.imageView reloadInputViews];

                }];
//        }
        }
    }];
//    [queryUser findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//        
//    }];
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
