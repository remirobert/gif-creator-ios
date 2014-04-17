//
//  ImageCollectionController.h
//  gifCreator
//
//  Created by remi on 09/04/14.
//  Copyright (c) 2014 remi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlatUIKit.h"

@interface ImageCollectionController : UICollectionViewController <UIPickerViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIAlertViewDelegate, FUIAlertViewDelegate>
{
    int indexSelected;
    FUIAlertView *alertView;
}

@property (nonatomic) NSMutableArray                  *photos;

- (void) addPhoto;
- (void) deletePhoto;
- (void) copyPhoto;
- (void) makeGif;
- (void) resetGif;

@end
