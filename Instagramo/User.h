//
//  User.h
//  Instagramo
//
//  Created by Syed Amaanullah on 2/5/15.
//  Copyright (c) 2015 Syed, Kyle and JP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface User : NSObject

//@property PFObject *object;
//@property NSString *username;
//@property NSString *password;
//@property NSString *emailAddress;
//@property UIImage *profilePic;
//
//@property NSArray *followers;
//@property NSArray *followings;

@property NSString *objectId;
@property NSString *username;

- (instancetype)initWithPFObject:(PFObject *)object;

@end
