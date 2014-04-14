//
//  ImageCollectionController.h
//  gifCreator
//
//  Created by remi on 09/04/14.
//  Copyright (c) 2014 remi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageCollectionController : UICollectionViewController <UIPickerViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    int indexSelected;
}

@property (nonatomic) NSMutableArray *photos;

- (void) addPhoto;
- (void) deletePhoto;
- (void) copyPhoto;

@end
