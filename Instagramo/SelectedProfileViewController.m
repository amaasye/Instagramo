//
//  SelectedProfileViewController.m
//  Instagramo
//
//  Created by Kyle Magnesen on 2/5/15.
//  Copyright (c) 2015 Syed, Kyle and JP. All rights reserved.
//

#import "SelectedProfileViewController.h"

@interface SelectedProfileViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (strong, nonatomic) IBOutlet UILabel *followersLabel;
@property (strong, nonatomic) IBOutlet UILabel *followingsLabel;

@end

@implementation SelectedProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)onFollowersLabelTapped:(UITapGestureRecognizer *)sender {

}
- (IBAction)onFollowingsLabelTapped:(UITapGestureRecognizer *)sender {

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
