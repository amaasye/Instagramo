//
//  Photo.h
//  Instagramo
//
//  Created by Kyle Magnesen on 2/4/15.
//  Copyright (c) 2015 Syed, Kyle and JP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "Comment.h"

@class User;

@interface Photo : NSObject

@property UIImage *image;
@property UIImage *profilePic;
@property NSString *photoID;
@property NSString *username;
@property NSString *caption;
@property NSString *comment;
@property PFFile *imageFile;

@property User *user;

@end
