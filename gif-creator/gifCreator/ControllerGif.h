//
//  ControllerGif.h
//  gifCreator
//
//  Created by remi on 09/04/14.
//  Copyright (c) 2014 remi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ControllerGif : UIViewController
{
    float speedInterval;
    int numberPhotos;
}

@property (nonatomic, strong) UIProgressView *progressImage;
@property (nonatomic, strong) UIImageView *imageGif;
@property (nonatomic) UISlider *speed;

@end
