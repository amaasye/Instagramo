//
//  CameraViewController.m
//  Instagramo
//
//  Created by Kyle Magnesen on 2/2/15.
//  Copyright (c) 2015 Syed, Kyle and JP. All rights reserved.
//

#import <Parse/Parse.h>
#import "CameraViewController.h"

@interface CameraViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *addPhotoImageView;
@property (strong, nonatomic) IBOutlet UITextField *captionTextField;

@end

@implementation CameraViewController


- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)saveBarButtonItemTapped:(UIBarButtonItem *)sender {
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
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Savezies" message:@"You need to create an account before you can access this awesomeness. \n Es necesario crear una cuenta antes de poder acceder a esta genialidad. " delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];

    [alert show];
}


@end
