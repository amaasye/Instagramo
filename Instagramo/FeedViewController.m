//
//  ViewController.m
//  Instagramo
//
//  Created by Syed Amaanullah on 2/2/15.
//  Copyright (c) 2015 Syed, Kyle and JP. All rights reserved.
//

#import "FeedViewController.h"

@interface FeedViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

//-(void)loadData{
//
//    PFQuery *query = [PFQuery queryWithClassName:@"Photo"];
//    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//        if (!error) {
//
//            for (PFObject *object in objects) {
//
//                PFFile *imageFile = [object objectForKey:@"photo"];
//                [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
//
//                    UIImage *image = [UIImage imageWithData:data];
//                    Photo *photo = [Photo new];
//                    photo.image = image;
//                    photo.username =[object objectForKey:@"username"];
//                    photo.caption = [object objectForKey:@"caption"];
//                    [self.photos addObject:photo];
//
//                    [self.tableView reloadData];
//                }];
//
//            }
//        } else {
//
//            NSLog(@"Error: %@ %@", error, [error userInfo]);
//        }
//    }];
//    NSLog(@"%lu", (unsigned long)self.photos.count);
//}

#pragma mark ------------ TABLEVIEW DELEGATE AND DATASOURCE ------------

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserCell"];

    return cell;
}

@end
