//
//  ImageCollectionController.m
//  gifCreator
//
//  Created by remi on 09/04/14.
//  Copyright (c) 2014 remi. All rights reserved.
//

#import "ImageCollectionController.h"
#import "ImageCell.h"
#import "ControllerGif.h"
#import "AppDelegate.h"
#import "ImageCollectionController+ConfigTab.h"

@interface ImageCollectionController ()

@end

@implementation ImageCollectionController

- (instancetype) init {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    layout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width / 3 - 1, [UIScreen mainScreen].bounds.size.width / 3 - 1);
    layout.minimumInteritemSpacing = 1.0;
    layout.minimumLineSpacing = 2.0;
    self = [super initWithCollectionViewLayout:layout];
    self.photos = [[NSMutableArray alloc] init];
    self->indexSelected = -1;
    self.collectionView.allowsMultipleSelection = YES;
    return (self);
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return ([self.photos count]);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ImageCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"photo" forIndexPath:indexPath];

    if (cell.isSelected == YES)
        NSLog(@"is selected [%d]", indexPath.row);
    else
        NSLog(@"is deselected [%d]", indexPath.row);
    cell.image.contentMode = UIViewContentModeScaleAspectFit;
    cell.image.image = [self.photos objectAtIndex:indexPath.row];
    cell.frame = CGRectMake(cell.frame.origin.x, cell.frame.origin.y, [UIScreen mainScreen].bounds.size.width / 3 - 1, [UIScreen mainScreen].bounds.size.height / 3 - 1);
    return (cell);
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [self.photos addObject:info[UIImagePickerControllerEditedImage]];
    AppDelegate *de = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    de.photos = self.photos;
    [self.collectionView reloadData];
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"display");
    return (YES);
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"deselected");
    [self.collectionView reloadData];
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"selected");
//    if (self->indexSelected == indexPath.row)
//        self->indexSelected = -1;
//    else
//        self->indexSelected = indexPath.row;
//    NSLog(@"select %d", self->indexSelected);
    [self.collectionView reloadData];
}

- (void) addPhoto {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;    
    [self presentViewController:picker animated:YES completion:NULL];
}

- (void) copyPhoto {
    if (self->indexSelected == -1)
        return ;
    NSLog(@"index item = %d", self->indexSelected);
    [self.photos insertObject: [self.photos objectAtIndex:self->indexSelected % [self.photos count]] atIndex:self->indexSelected];
    self->indexSelected = -1;
    [self.collectionView reloadData];
}

- (void) deletePhoto {
    if (self->indexSelected == -1)
        return ;
    NSLog(@"index item = %d", self->indexSelected);
    [self.photos removeObjectAtIndex:self->indexSelected % [self.photos count]];
    self->indexSelected = -1;
    [self.collectionView reloadData];
}

- (void) makeGif {
    ControllerGif *gif = [[ControllerGif alloc] init];
    [self.navigationController pushViewController:gif animated:YES];
}

- (void) resetGif {
    AppDelegate *de = (AppDelegate *)[[UIApplication sharedApplication] delegate];

    [self.photos removeAllObjects];
    de.photos = self.photos;
    [self.collectionView reloadData];
}

- (void) initButtonNavigationBar {
    self.title = @"GIF Creator";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"X" style:UIBarButtonItemStyleBordered target:self action:@selector(resetGif)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@">" style:UIBarButtonItemStyleBordered target:self action:@selector(makeGif)];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.collectionView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64);
    
    [self initconfigBar];
    [self initButtonNavigationBar];
    [self.collectionView registerClass:[ImageCell class] forCellWithReuseIdentifier:@"photo"];
    self.view.backgroundColor = self.collectionView.backgroundColor = [UIColor colorWithRed:42.0 / 255.0 green:49.0 / 255.0 blue:55.0 / 255.0 alpha:1];
}

@end
