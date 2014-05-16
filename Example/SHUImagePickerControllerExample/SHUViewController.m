//
//  SHUViewController.m
//  SHUImagePickerControllerExample
//
//  Created by Sergey Shulga on 4/27/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "SHUViewController.h"
#import <SHUImagePickerController/SHUImagePicker.h>

@interface SHUViewController ()

@property (strong, nonatomic) SHUImagePicker *imagePicker;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation SHUViewController


- (IBAction)buttonPressed:(id)sender {
    self.imagePicker = [[SHUImagePicker alloc] init];
    
    __weak SHUViewController *weakSelf = self;
    [self.imagePicker showPickerInViewController:self
                                   forSourceType:UIImagePickerControllerSourceTypePhotoLibrary cropSize:CGSizeMake(150.f, 150.f)
                                       fromRect:[sender frame] withCallback:^(UIImage *cropedImage) {
        SHUViewController *strongSelf = weakSelf;
        strongSelf.imageView.image = cropedImage;
    }];
}

@end
