//
//  User.m
//  Instagramo
//
//  Created by Syed Amaanullah on 2/5/15.
//  Copyright (c) 2015 Syed, Kyle and JP. All rights reserved.
//

#import "User.h"

@interface User ()
@property NSString *userID;
@end

@implementation User
@dynamic username;
@dynamic password;
@dynamic emailAddress;

+(NSString *)parseClassName{
    return @"User";
}

+(void)load{
    [self registerSubclass];
}

@end
