//
//  ControllerGif.m
//  gifCreator
//
//  Created by remi on 09/04/14.
//  Copyright (c) 2014 remi. All rights reserved.
//

#import "ControllerGif.h"
#import "ImageCollectionController.h"
#import "AppDelegate.h"
#import "FlatUIKit.h"
#import "ImageCollectionController.h"

@interface ControllerGif ()

@end

@implementation ControllerGif

- (void) initLabel {
    UIFont *myFont          = [UIFont boldFlatFontOfSize:16];
    UILabel *speedTile      = [[UILabel alloc] initWithFrame:CGRectMake(0, ([UIScreen mainScreen].bounds.size.height) / 2 - 5, [UIScreen mainScreen].bounds.size.width, 40)];
    [speedTile setFont:myFont];
    speedTile.text          = @"speed frames";
    speedTile.textAlignment = NSTextAlignmentCenter;
    speedTile.textColor     = [UIColor whiteColor];

    UILabel *more           = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 15, [UIScreen mainScreen].bounds.size.height / 2 + 15, 10, 40)];
    [more setFont:myFont];
    more.text               = @"+";
    more.textAlignment      = NSTextAlignmentCenter;
    more.textColor          = [UIColor whiteColor];


    UILabel *less           = [[UILabel alloc] initWithFrame:CGRectMake(10, [UIScreen mainScreen].bounds.size.height / 2 + 15, 10, 40)];
    [less setFont:myFont];
    less.text               = @"-";
    less.textAlignment      = NSTextAlignmentCenter;
    less.textColor          = [UIColor whiteColor];

    [self.view addSubview:speedTile];
    [self.view addSubview:more];
    [self.view addSubview:less];
}

- (void) editGif {
    [self.navigationController popViewControllerAnimated:YES];
//    [self.navigationController pushViewController:navController animated:YES];
//    [self.navigationController presentViewController:navController animated:YES completion:nil];
//    [self presentViewController:navController animated:YES completion:nil];
}

- (void) initButtoon {
    FUIButton *saveCamera      = [[FUIButton alloc] initWithFrame:CGRectMake(10, [UIScreen mainScreen].bounds.size.height - 124, [UIScreen mainScreen].bounds.size.width / 2 - 15, 50)];
    saveCamera.buttonColor     = [UIColor orangeColor];
    saveCamera.shadowColor     = [UIColor redColor];
    saveCamera.shadowHeight    = 3.0f;
    saveCamera.cornerRadius    = 6.0f;

    [saveCamera setTitle:@"Save photo" forState:UIControlStateNormal];
    saveCamera.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [saveCamera setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [saveCamera setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    [self.view addSubview:saveCamera];
    
    FUIButton *editGif      = [[FUIButton alloc] initWithFrame:CGRectMake(25 + ([UIScreen mainScreen].bounds.size.width / 2 - 20), [UIScreen mainScreen].bounds.size.height - 124, [UIScreen mainScreen].bounds.size.width / 2 - 15, 50)];
    editGif.buttonColor     = [UIColor orangeColor];
    editGif.shadowColor     = [UIColor redColor];
    editGif.shadowHeight    = 3.0f;
    editGif.cornerRadius    = 6.0f;
    
    [editGif setTitle:@"Edit photo" forState:UIControlStateNormal];
    editGif.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [editGif setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [editGif setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    
    [editGif addTarget:self action:@selector(editGif) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:saveCamera];
    [self.view addSubview:editGif];
    
//    [saveCamera addTarget:self action:@selector(deletePhoto) forControlEvents:UIControlEventTouchUpInside];
}

- (void) progressView {
    self.progressImage = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];

    [self.progressImage configureFlatProgressViewWithTrackColor:[UIColor silverColor]
                                              progressColor:[UIColor alizarinColor]];
    self.progressImage.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height / 2 + 10, [UIScreen mainScreen].bounds.size.width, 50);
    self.progressImage.progress = 0;
//    [self.view addSubview:self.progressImage];
//    [self performSelector:@selector(setTimerProgress) withObject:nil afterDelay:self->speedInterval];
}

- (void) setTimerProgress {
    if (self.progressImage.progress >= 1.0)
        self.progressImage.progress = 0;

        self.progressImage.progress += (float)(1.0 / (float)self->numberPhotos);
    [self performSelector:@selector(setTimerProgress) withObject:nil afterDelay:self->speedInterval];

//    NSTimer *timer =  [NSTimer timerWithTimeInterval:0.2 target:self selector:@selector(progressFrameImage) userInfo:nil repeats:YES];
//    [timer fire];
}

- (instancetype) init {
    self = [ControllerGif alloc];
    self.title = @"GIF Creator";
    self->speedInterval = 0.5;
    self.speed = [[UISlider alloc] initWithFrame:CGRectMake(20, [UIScreen mainScreen].bounds.size.height / 2 + 10, [UIScreen mainScreen].bounds.size.width - 40, 50)];
    self.speed.minimumValue = 0.1;
    self.speed.maximumValue = 1.0;
    self.speed.value = 0.5;
    [self.speed addTarget:self action:@selector(changeSpeed) forControlEvents:UIControlEventValueChanged];
    self.imageGif = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height / 2)];
    self.imageGif.backgroundColor = [UIColor blackColor];
    self.view.backgroundColor = [UIColor colorWithRed:42.0 / 255.0 green:49.0 / 255.0 blue:55.0 / 255.0 alpha:1];
    [self.view addSubview:self.speed];
    return (self);
}

- (void) changeSpeed {
    self->speedInterval = self.speed.value;
    [self.imageGif stopAnimating];
    [self displayGif];
}

- (void) displayGif {
    AppDelegate *de = (AppDelegate *)[[UIApplication sharedApplication] delegate];

    self->numberPhotos = (int)[de.photos count];
    self.imageGif.animationImages = [NSArray arrayWithArray:de.photos];
    self.imageGif.animationDuration = self->speedInterval;
    self.imageGif.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.imageGif];
    [self.imageGif startAnimating];
}

- (void) viewDidAppear:(BOOL)animated {
    AppDelegate *de = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSLog(@"%lu", (unsigned long)[de.photos count]);
    ImageCollectionController *photoController = [[ImageCollectionController alloc] init];
    NSLog(@"%lu", (unsigned long)[photoController.photos count]);
    [self displayGif];
    
     self.navigationItem.hidesBackButton = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initButtoon];
    [self progressView];
    [self initLabel];
    [self.speed configureFlatSliderWithTrackColor:[UIColor silverColor]
                                  progressColor:[UIColor colorWithRed:82.0 / 255.0 green:200.0 / 255.0 blue:109.0 / 255.0 alpha:1]
                                     thumbColor:[UIColor pomegranateColor]];
    [self displayGif];
}

@end
