//
//  ProfileViewController.m
//  Instagramo
//
//  Created by Kyle Magnesen on 2/2/15.
//  Copyright (c) 2015 Syed, Kyle and JP. All rights reserved.
//

#import "ProfileViewController.h"
#import <Parse/Parse.h>
#import "FollowersTableViewController.h"
#import "User.h"
#import "Photo.h"


@interface ProfileViewController ()

@property (strong, nonatomic) IBOutlet UILabel *countFollowersLabel;
@property (strong, nonatomic) IBOutlet UILabel *countFollowingsLabel;
@property (strong, nonatomic) IBOutlet UILabel *userNameLabel;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *logoutButton;
@property (strong, nonatomic) IBOutlet UIImageView *profilePic;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //    [self loadProfilePic];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self loadProfilePic];
}

- (void)loadProfilePic {

    PFUser *currentUser = [PFUser currentUser];

    if (currentUser) {
        PFQuery *userQuery = [PFUser query];

        [userQuery getObjectInBackgroundWithId:currentUser.objectId block:^(PFObject *object, NSError *error) {

            if (!error) {

                PFFile *currentProfilePic = (PFFile *)[object objectForKey:@"profilePic"];

                [currentProfilePic getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {

                    UIImage *image = [UIImage imageWithData:data];
                    self.profilePic.image = image;
                    self.userNameLabel.text = [NSString stringWithFormat:@"%@",[[PFUser currentUser]valueForKey:@"username"]] ;

                    //                            [self.profilePic reloadInputViews];
                    [self.userNameLabel reloadInputViews];
                }];
            } else {

                NSString *errorString = [[error userInfo] objectForKey:@"error"];
                UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                [errorAlertView show];

            }
        }];
    }
}

- (void)handlerGetFollowingInformation:(id)value {
    //    BOOL success = [Utility checkWebServiceErrors:value controller:self.navigationController];
    //
    //    if (success) {
//    User *friend = (User *)value;

//    self.followingFriendsArray = [[NSArray alloc] initWithArray:friend.followings];
//    self.followerFriendsArray = [[NSArray alloc] initWithArray:friend.followers];

}

- (IBAction)onFollowersLabelTapped:(UITapGestureRecognizer *)sender {
    CGPoint point = [sender locationInView:self.view];
    if (CGRectContainsPoint(self.countFollowersLabel.frame, point)) {
        [self performSegueWithIdentifier:@"followersSegue" sender:self];

        FollowersTableViewController *fvc = [[FollowersTableViewController alloc] initWithNibName:@"FollowingViewController" bundle:nil];

        fvc.friends = _followerFriendsArray;

        [self.navigationController pushViewController:fvc animated:YES];
    }
}



- (IBAction)onFollowingLabelTapped:(UITapGestureRecognizer *)sender {
    CGPoint point = [sender locationInView:self.view];
    if (CGRectContainsPoint(self.countFollowingsLabel.frame, point)) {
        [self performSegueWithIdentifier:@"followingsSegue" sender:self];

        FollowersTableViewController *fvc = [[FollowersTableViewController alloc] initWithNibName:@"FollowingViewController" bundle:nil];

        fvc.friends = _followerFriendsArray;

        [self.navigationController pushViewController:fvc animated:YES];
    }
}

- (IBAction)onLogoutButtonTapped:(UIBarButtonItem *)sender {
    [self logOutUser];

}

- (void)logOutUser {
    if ([PFUser currentUser]) {
        [PFUser logOut];
    } else {
        NSLog(@"currentUser: %@", [PFUser currentUser]);
    }
}


#pragma mark ------------ COLLECTIONVIEW DELEGATE AND DATASOURCE ------------

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PicsAddedCell" forIndexPath:indexPath];
    
    return cell;
}

@end
