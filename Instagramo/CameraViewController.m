//
//  CameraViewController.m
//  Instagramo
//
//  Created by Kyle Magnesen on 2/2/15.
//  Copyright (c) 2015 Syed, Kyle and JP. All rights reserved.
//

#import <Parse/Parse.h>
#import "CameraViewController.h"

@interface CameraViewController () <UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *addPhotoImageView;
@property (strong, nonatomic) IBOutlet UITextField *captionTextField;

@end

@implementation CameraViewController


- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)saveBarButtonItemTapped:(UIBarButtonItem *)sender {
    [self showAlert];

    NSData* data = UIImageJPEGRepresentation(self.addPhotoImageView.image, 0.5f);
    PFFile *imageFile = [PFFile fileWithName:@"photo.jpeg" data: data];
    PFObject *photo = [PFObject objectWithClassName: @"Images"];
    PFUser *currentUser = [PFUser currentUser];

    photo[@"imageFile"] = imageFile;
    photo[@"username"] = currentUser.username;
    photo[@"caption"] = self.captionTextField.text;
    NSLog(@"%@",self.captionTextField.text);

    [self.captionTextField resignFirstResponder];
    [photo saveInBackground];
}

- (IBAction)takePhoto {
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePickerController.editing = YES;
    imagePickerController.delegate = (id)self;

    [self presentViewController:imagePickerController animated:YES completion:nil];
}

-(IBAction)selectPhotoButton:(UIButton *)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    [picker setSourceType:(UIImagePickerControllerSourceTypePhotoLibrary)];
    [self presentViewController:picker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image = [info valueForKey: UIImagePickerControllerOriginalImage];
    self.addPhotoImageView.image = image;
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

-(void)showAlert {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Save?!" message:@"Are you 100% sure that you want to share this awesomeness with the world? " delegate:self cancelButtonTitle:@"Yes" otherButtonTitles:@"No", nil];

    [alert show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == [alertView cancelButtonIndex]) {
        NSLog(@"It's All Good");
    }
}


@end
