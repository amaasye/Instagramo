//
//  ChangeProfilePicViewController.m
//  Instagramo
//
//  Created by Kyle Magnesen on 2/3/15.
//  Copyright (c) 2015 Syed, Kyle and JP. All rights reserved.
//

#import "EditProfilePicViewController.h"

@interface EditProfilePicViewController ()

@end

@implementation EditProfilePicViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)onEditProfilePicTapped:(UIButton *)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    [picker setSourceType:(UIImagePickerControllerSourceTypePhotoLibrary)];
    [self presentViewController:picker animated:YES completion:nil];
}


@end
