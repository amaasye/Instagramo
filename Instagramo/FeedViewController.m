//
//  ViewController.m
//  Instagramo
//
//  Created by Syed Amaanullah on 2/2/15.
//  Copyright (c) 2015 Syed, Kyle and JP. All rights reserved.
//

#import <Parse/Parse.h>
#import "FeedViewController.h"
#import "Photo.h"
#import "User.h"
#import "FeedTableViewCell.h"
#import "CommentsTableViewController.h"
#import "SelectedProfileViewController.h"

@interface FeedViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *feedTableView;
@property (nonatomic) NSMutableArray *photos;

@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self loadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [self loadData];
}

- (void)loadData{
    self.photos = [NSMutableArray new];

    PFQuery *query = [PFQuery queryWithClassName:@"Images"];

    [query orderByDescending:@"updatedAt"];
//    query.limit = 100;

    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error)
        {
                for (PFObject *object in objects)
                {
                    Photo *photo = [Photo new];
                    photo.username =[object objectForKey:@"username"];
                    photo.imageFile = [object objectForKey:@"imageFile"];
                    photo.user = [[User alloc]initWithPFObject:[object objectForKey:@"user"]];

                    photo.caption = [object objectForKey:@"caption"];
                    [self.photos addObject:photo];
                }

            [self.feedTableView reloadData];
        }
        else
        {

            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }

        NSLog(@"here");
    }];
//    NSLog(@"%lu", (unsigned long)self.photos.count);
}

#pragma mark ------------ TABLEVIEW DELEGATE AND DATASOURCE ------------

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.photos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    FeedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserCell"];
    Photo *photo = self.photos [indexPath.row];

    [photo.imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {

        UIImage *image = [UIImage imageWithData:data];
        photo.image = image;

        cell.picAddedImageView.image = image;
    }];


    cell.usernameLabel.text = photo.username;
//    cell.picAddedImageView.image = photo.image;
    cell.commentTextView.text = photo.caption;
    
    return cell;
}

#pragma mark ------------ Actions ------------

- (IBAction)onRefreshTapped:(UIBarButtonItem *)sender {
    [self loadData];
}

#pragma mark ------------ Segue To Comment View ---------------------

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"commentSegue"]) {

        CommentsTableViewController *commentVC = segue.destinationViewController;
        NSIndexPath *indexPath = [self.feedTableView indexPathForCell:sender];
        Photo *photoPoster = self.photos[indexPath.row];
        commentVC.photoPoster = photoPoster.user;
        commentVC.photoPoster.objectId = photoPoster.photoID;

    } else if ([segue.identifier isEqualToString:@"feedToUserSegue"]) {

        SelectedProfileViewController *selectProfileVC = segue.destinationViewController;
        NSIndexPath *indexPath = [self.feedTableView indexPathForCell:sender];
        Photo *selectedPhoto = self.photos[indexPath.row];
        selectProfileVC.selectedUser = selectedPhoto.user;
    }
}

@end
