//
//  ImageCollectionController+ConfigTab.m
//  gifCreator
//
//  Created by remi on 10/04/14.
//  Copyright (c) 2014 remi. All rights reserved.
//

#import "ImageCollectionController+ConfigTab.h"
#import "FlatUIKit.h"

@implementation ImageCollectionController (ConfigTab)

- (void) initconfigBar {
    UIView *configBar = [[UIView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 64, [UIScreen mainScreen].bounds.size.width, 64)];

    
    FUIButton *add = [[FUIButton alloc] initWithFrame:CGRectMake(5, (64 - 48) / 2, [UIScreen mainScreen].bounds.size.width / 3 - 10, 48)];
    add.buttonColor = [UIColor turquoiseColor];
    add.shadowColor = [UIColor greenSeaColor];
    add.shadowHeight = 3.0f;
    add.cornerRadius = 6.0f;
    
    [add setTitle:@"Add photo" forState:UIControlStateNormal];
    add.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [add setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [add setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    [add addTarget:self action:@selector(addPhoto) forControlEvents:UIControlEventTouchUpInside];
    
    
    FUIButton *delete = [[FUIButton alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 3 * 2 + 5, (64 - 48) / 2, [UIScreen mainScreen].bounds.size.width / 3 - 10, 48)];
    delete.buttonColor = [UIColor orangeColor];
    delete.shadowColor = [UIColor redColor];
    delete.shadowHeight = 3.0f;
    delete.cornerRadius = 6.0f;
    
    [delete setTitle:@"delete photo" forState:UIControlStateNormal];
    delete.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [delete setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [delete setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    [delete addTarget:self action:@selector(deletePhoto) forControlEvents:UIControlEventTouchUpInside];
    
    
    FUIButton *copy = [[FUIButton alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 3 + 5, (64 - 48) / 2, [UIScreen mainScreen].bounds.size.width / 3 - 10, 48)];
    copy.buttonColor = [UIColor turquoiseColor];
    copy.shadowColor = [UIColor greenSeaColor];
    copy.shadowHeight = 3.0f;
    copy.cornerRadius = 6.0f;
    
    [copy setTitle:@"copy photo" forState:UIControlStateNormal];
    copy.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [copy setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [copy setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    [copy addTarget:self action:@selector(copyPhoto) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *addButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width / 3, 64)];
    [addButton setImage:[UIImage imageNamed:@"addButton"] forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(addPhoto) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *deleteButton = [[UIButton alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 3, 0, [UIScreen mainScreen].bounds.size.width / 3, 64)];
    [deleteButton setTitle:@"delete photo" forState:UIControlStateNormal];
    [deleteButton addTarget:self action:@selector(deletePhoto) forControlEvents:UIControlEventTouchUpInside];

    UIButton *copyButton = [[UIButton alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 3 * 2 , 0, [UIScreen mainScreen].bounds.size.width / 3, 64)];
    [copyButton setTitle:@"copy photo" forState:UIControlStateNormal];
    [copyButton addTarget:self action:@selector(copyPhoto) forControlEvents:UIControlEventTouchUpInside];

    
    configBar.backgroundColor = [UIColor colorWithRed:82.0 / 255.0 green:200.0 / 255.0 blue:109.0 / 255.0 alpha:1];
    
    [configBar addSubview:copy];
//    [configBar addSubview:addButton];
    [configBar addSubview:add];
    [configBar addSubview:delete];
    [self.view addSubview:configBar];
}

@end
