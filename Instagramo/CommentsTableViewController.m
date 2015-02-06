//
//  CommentsTableViewController.m
//  Instagramo
//
//  Created by Kyle Magnesen on 2/5/15.
//  Copyright (c) 2015 Syed, Kyle and JP. All rights reserved.
//

#import <Parse/Parse.h>
#import "CommentsTableViewController.h"
#import "Photo.h"

@interface CommentsTableViewController ()

@property (strong, nonatomic) IBOutlet UITableView *commentTableView;
@property (nonatomic) NSMutableArray *comments;

@end

@implementation CommentsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self loadComments];
}

- (void) setComments:(NSMutableArray *)comments {
    _comments = comments;
    [self.commentTableView reloadInputViews];
}

- (void)loadComments {
    self.comments = [NSMutableArray new];

    PFQuery *query = [PFQuery queryWithClassName:@"Comments"];
//    [query whereKey:@"Photo" equalTo:];
//    dispatch_queue_t feedQueue = dispatch_queue_create("feedQueue", NULL);

    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
//            dispatch_async(feedQueue, ^{
                for (PFObject *object in objects) {

                    Photo *commentPoster = [Photo new];
                    commentPoster.comment =[object objectForKey:@"message"];
                    commentPoster.username =[object objectForKey:@"username"];
                    commentPoster.photoID = [object objectForKey:@"comments"];
                    [self.comments addObject:commentPoster];

                    [self.commentTableView reloadData];
                }
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    [self.commentTableView reloadData];
//                });
//            });
        } else {

            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

- (IBAction)onAddButtonTapped:(UIBarButtonItem *)sender {

    UIAlertController *alertcontroller = [UIAlertController alertControllerWithTitle:@"Post Comment" message:nil preferredStyle:UIAlertControllerStyleAlert];

    [alertcontroller addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        nil;
    }];

    UIAlertAction *addAction = [UIAlertAction
                               actionWithTitle:@"Add Comment"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   UITextField *commentTextField = alertcontroller.textFields.firstObject;

                                   PFObject *comments = [PFObject objectWithClassName: @"Comments"];
                                   PFUser *currentUser = [PFUser currentUser];

                                   comments[@"username"] = currentUser.username;
                                   comments[@"message"] = commentTextField.text;
                                   NSLog(@"%@",commentTextField.text);
                                   
                                   [commentTextField resignFirstResponder];
                                   [comments saveInBackground];
                               }];

    [alertcontroller addAction:addAction];

    [self presentViewController:alertcontroller animated:YES completion:^{
        [self loadComments];
    }];

}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.comments.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"commentsCell" forIndexPath:indexPath];
    Photo *comment = self.comments [indexPath.row];

    cell.textLabel.text = comment.username;
    cell.detailTextLabel.text = comment.comment;

    return cell;
}

@end
