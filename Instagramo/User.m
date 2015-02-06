//
//  User.m
//  Instagramo
//
//  Created by Syed Amaanullah on 2/5/15.
//  Copyright (c) 2015 Syed, Kyle and JP. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithPFObject:(PFObject *)object{
    self = [super init];
    self.username = [object objectForKey:@"username"];
    self.objectId = object.objectId;
    return self;
}

@end
