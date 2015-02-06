//
//  User.h
//  Instagramo
//
//  Created by Syed Amaanullah on 2/5/15.
//  Copyright (c) 2015 Syed, Kyle and JP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface User : NSObject

@property NSString *username;
@property NSString *password;
@property NSString *emailAddress;
@property UIImage *profilePic;

@property NSArray *followers;
@property NSArray *followings;


@end
