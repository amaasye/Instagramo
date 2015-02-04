//
//  RootViewController.m
//  Instagramo
//
//  Created by Syed Amaanullah on 2/3/15.
//  Copyright (c) 2015 Syed, Kyle and JP. All rights reserved.
//

#import "RootViewController.h"
#import <Parse/Parse.h>


@interface RootViewController ()
@end

@implementation RootViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if ([PFUser currentUser] == nil) {
        [self performSegueWithIdentifier:@"initialSegue" sender:self];
    }
    else {
        [self performSegueWithIdentifier:@"passInitialSegue" sender:self];
    }
}


@end
