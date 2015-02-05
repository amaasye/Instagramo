//
//  ProfileViewController.m
//  Instagramo
//
//  Created by Kyle Magnesen on 2/2/15.
//  Copyright (c) 2015 Syed, Kyle and JP. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@property (strong, nonatomic) IBOutlet UILabel *countPostsLabel;
@property (strong, nonatomic) IBOutlet UILabel *countFollowersLabel;
@property (strong, nonatomic) IBOutlet UILabel *countFollowingsLabel;
@property (strong, nonatomic) IBOutlet UILabel *userNameLabel;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *logoutButton;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
- (IBAction)onLogoutButtonTapped:(UIBarButtonItem *)sender {
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
