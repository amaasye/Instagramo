//
//  FeedTableViewCell.h
//  Instagramo
//
//  Created by Kyle Magnesen on 2/4/15.
//  Copyright (c) 2015 Syed, Kyle and JP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *usernameLabel;
@property (strong, nonatomic) IBOutlet UIImageView *picAddedImageView;
@property (strong, nonatomic) IBOutlet UITextView *commentTextView;

@end
