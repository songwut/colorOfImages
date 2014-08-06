//
//  ViewController.m
//  colorOfImages
//
//  Created by Songwut on 1/5/13.
//  Copyright (c) 2013 Songwut. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize pointx = pointx;
@synthesize pointy = pointy;
@synthesize originalImg = originalImg;

- (UIColor *)getRGBAsFromImage:(UIImage*)image atX:(int)imgX andY:(int)imgY
{
    UIColor *newColor;
    
    CGImageRef imageRef = [image CGImage];
    NSUInteger width = CGImageGetWidth(imageRef);
    NSUInteger height = CGImageGetHeight(imageRef);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    unsigned char *rawData = (unsigned char*) calloc(height * width * 4, sizeof(unsigned char));
    NSUInteger bytesPerPixel = 4;
    NSUInteger bytesPerRow = bytesPerPixel * width;
    NSUInteger bitsPerComponent = 8;
    CGContextRef context = CGBitmapContextCreate(rawData, width, height,
                                                 bitsPerComponent, bytesPerRow, colorSpace,
                                                 kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    CGColorSpaceRelease(colorSpace);
    
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), imageRef);
    CGContextRelease(context);
    
    unsigned long byteIndex = (bytesPerRow * imgX) + imgY * bytesPerPixel;
    //for (int ii = 0 ; ii < count ; ++ii)
    for (int ii = 0 ; ii < 1 ; ++ii)
    {
        CGFloat red   = (rawData[byteIndex]     * 1.0) / 255.0;
        CGFloat green = (rawData[byteIndex + 1] * 1.0) / 255.0;
        CGFloat blue  = (rawData[byteIndex + 2] * 1.0) / 255.0;
        CGFloat alpha = (rawData[byteIndex + 3] * 0) + 1.0;
        byteIndex += 4;
        
        //UIColor *acolor = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
        //[result addObject:acolor];
        newColor = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    }
    
    free(rawData);
    
    //return acolor;
    return newColor;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    originalImage = [UIImage imageNamed:@"woodter.jpeg"];
    rgbNews = [self getRGBAsFromImage:originalImage atX:20 andY:20];
    [self.originalImg setImage:originalImage];
    self.showColorView.backgroundColor = rgbNews;
    NSLog(@"New Color is: %@", rgbNews);
    NSLog(@"width max: %f", originalImg.bounds.size.width);
    NSLog(@"height max: %f", originalImg.bounds.size.height);
    
    
}
- (IBAction)getColorClick:(id)sender {
    rgbNews = [self getRGBAsFromImage:originalImage atX:[pointx.text intValue] andY:[pointy.text intValue]];
    self.showColorView.backgroundColor = rgbNews;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

@end
