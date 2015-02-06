//
//  ChangeProfilePicViewController.m
//  Instagramo
//
//  Created by Kyle Magnesen on 2/3/15.
//  Copyright (c) 2015 Syed, Kyle and JP. All rights reserved.
//

#import "EditProfilePicViewController.h"
#import <Parse/Parse.h>

@interface EditProfilePicViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *profilePic;

@end

@implementation EditProfilePicViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)onSaveTapped:(UIBarButtonItem *)sender {
    NSData *imageData = UIImagePNGRepresentation(self.profilePic.image);
    PFFile *imageFile = [PFFile fileWithName:@"image.png" data:imageData];
    [imageFile saveInBackground];

    PFUser *user = [PFUser currentUser];
    [user setObject:imageFile forKey:@"profilePic"];
    [user saveInBackground];
}

- (IBAction)onEditProfilePicTapped:(UIButton *)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    [picker setSourceType:(UIImagePickerControllerSourceTypePhotoLibrary)];
    [self presentViewController:picker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image = [info valueForKey: UIImagePickerControllerOriginalImage];
    self.profilePic.image = image;
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}



@end
