//
//  ActivityViewController.m
//  Instagramo
//
//  Created by Kyle Magnesen on 2/2/15.
//  Copyright (c) 2015 Syed, Kyle and JP. All rights reserved.
//

#import "ActivityViewController.h"

@interface ActivityViewController () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *activityTableView;

@end

@implementation ActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

#pragma mark ------------ TABLEVIEW DELEGATE AND DATASOURCE ------------

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"activityCell"];

    return cell;
}

@end
