//
//  CameraViewController.m
//  Instagramo
//
//  Created by Kyle Magnesen on 2/2/15.
//  Copyright (c) 2015 Syed, Kyle and JP. All rights reserved.
//

#import "CameraViewController.h"

@interface CameraViewController ()

@end

@implementation CameraViewController


- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)takePhoto
{
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePickerController.editing = YES;
    imagePickerController.delegate = (id)self;

    [self presentViewController:imagePickerController animated:YES completion:nil];
}
-(IBAction)selectPhotoButton:(UIButton *)sender{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    [picker setSourceType:(UIImagePickerControllerSourceTypePhotoLibrary)];
    [self presentViewController:picker animated:YES completion:nil];
}





@end
