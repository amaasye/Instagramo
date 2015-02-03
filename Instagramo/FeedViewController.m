//
//  ViewController.m
//  Instagramo
//
//  Created by Syed Amaanullah on 2/2/15.
//  Copyright (c) 2015 Syed, Kyle and JP. All rights reserved.
//

#import "FeedViewController.h"

@interface FeedViewController () <UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

#pragma mark ------------ TABLEVIEW DELEGATE AND DATASOURCE ------------

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserCell"];

    return cell;
}

#pragma mark ------------ COLLECTIONVIEW DELEGATE AND DATASOURCE ------------

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PictureCell" forIndexPath:indexPath];

    return cell;
}

@end
