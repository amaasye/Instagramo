//
//  User.h
//  Instagramo
//
//  Created by Syed Amaanullah on 2/5/15.
//  Copyright (c) 2015 Syed, Kyle and JP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface User : PFObject <PFSubclassing>

@property NSString *username;
@property NSString *password;
@property NSString *emailAddress;
@property NSString *photoID;



@end
