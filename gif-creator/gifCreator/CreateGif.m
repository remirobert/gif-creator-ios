//
//  CreateGif.m
//  gifCreator
//
//  Created by remi on 21/04/14.
//  Copyright (c) 2014 remi. All rights reserved.
//

#import <ImageIO/ImageIO.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "CreateGif.h"
#import "UIImage+animatedGIF.h"

@implementation CreateGif

+ (void) makeAnimatedGif:(NSArray *)tabImage :(UIViewController *)vc {
    NSUInteger kFrameCount = [tabImage count];
    
    NSDictionary *fileProperties = @{
                                     (__bridge id)kCGImagePropertyGIFDictionary: @{
                                             (__bridge id)kCGImagePropertyGIFLoopCount: @0, // 0 means loop forever
                                             }
                                     };
    
    NSDictionary *frameProperties = @{
                                      (__bridge id)kCGImagePropertyGIFDictionary: @{
                                              (__bridge id)kCGImagePropertyGIFDelayTime: @(0.3f), // a float (not double!) in seconds, rounded to centiseconds in the GIF data
                                              }
                                      };
    
    NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];
    NSURL *fileURL = [documentsDirectoryURL URLByAppendingPathComponent:@"animated.gif"];
    
    CGImageDestinationRef destination = CGImageDestinationCreateWithURL((__bridge CFURLRef)fileURL, kUTTypeGIF, kFrameCount, NULL);
    CGImageDestinationSetProperties(destination, (__bridge CFDictionaryRef)fileProperties);
    
    for (NSUInteger i = 0; i < kFrameCount; i++) {
        @autoreleasepool {
            CGImageDestinationAddImage(destination, ((UIImage *)[tabImage objectAtIndex:i]).CGImage, (__bridge CFDictionaryRef)frameProperties);
        }
    }
    if (!CGImageDestinationFinalize(destination)) {
        NSLog(@"failed to finalize image destination");
    }
    CFRelease(destination);
    
    NSLog(@"url=%@", fileURL);
    
    return ;
    NSData *data = [NSData dataWithContentsOfURL:fileURL];
    NSLog(@"data length = %d", [data length]);
    UIImage *im = [UIImage imageWithData:data];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        UIImageWriteToSavedPhotosAlbum([UIImage animatedImageWithAnimatedGIFData:data], nil, nil, nil);
    });
    
    UIView *v = [[UIView alloc] initWithFrame:vc.view.frame];
    UIImageView *imgageV = [[UIImageView alloc] initWithFrame:vc.view.frame];
    
    
    imgageV.image = [UIImage animatedImageWithAnimatedGIFURL:fileURL];
    [v addSubview:imgageV];
    [vc.view addSubview:v];
}

@end
