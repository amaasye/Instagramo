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

@interface SelectedProfileViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark ------------ COLLECTIONVIEW DELEGATE AND DATASOURCE ------------

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"selectedUserCell" forIndexPath:indexPath];

    return cell;
}

@end
