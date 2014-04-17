//
//  ImageCell.m
//  gifCreator
//
//  Created by remi on 09/04/14.
//  Copyright (c) 2014 remi. All rights reserved.
//

#import "ImageCell.h"

@implementation ImageCell

- (void) displayPhoto {
    NSLog(@"Touch");
}

- (id)initWithFrame:(CGRect)frame
{
    self                            = [super initWithFrame:frame];
    if (self) {
    _image                          = [[UIImageView alloc] initWithFrame:[self.contentView bounds]];
    _image.image                    = [UIImage imageNamed:@"addButton"];
    [self.contentView addSubview:_image];
    UIGestureRecognizer *touchPhoto = [[UIGestureRecognizer alloc] initWithTarget:self action:@selector(displayPhoto)];
    [self addGestureRecognizer:touchPhoto];
    }
    return self;
}

@end
