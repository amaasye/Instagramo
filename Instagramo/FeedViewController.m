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
    [self loadData];
}



- (void)loadData{
    self.photos = [NSMutableArray new];

    PFQuery *query = [PFQuery queryWithClassName:@"Images"];
    dispatch_queue_t feedQueue = dispatch_queue_create("feedQueue", NULL);

    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            dispatch_async(feedQueue, ^{
                for (PFObject *object in objects) {

                    PFFile *imageFile = [object objectForKey:@"imageFile"];
                    [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {

                        UIImage *image = [UIImage imageWithData:data];
                        Photo *photo = [Photo new];
                        photo.image = image;
                        photo.username =[object objectForKey:@"username"];
                        photo.caption = [object objectForKey:@"caption"];
                        [self.photos addObject:photo];

                        [self.feedTableView reloadData];
                    }];
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.feedTableView reloadData];
                });
            });
        } else {

            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
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

    cell.usernameLabel.text = photo.username;
    cell.picAddedImageView.image = photo.image;
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
        commentVC.photoPoster = photoPoster;
        commentVC.title = photoPoster.username;

    } else if ([segue.identifier isEqualToString:@"feedToUserSegue"]) {

        SelectedProfileViewController *selectProfileVC = segue.destinationViewController;
        NSIndexPath *indexPath = [self.feedTableView indexPathForCell:sender];
        Photo *selectedUser = self.photos[indexPath.row];
        selectProfileVC.selectedUser = selectedUser;
        selectedUser.image = selectedUser.image;
        selectedUser.username = selectedUser.username;
    }
}

@end
