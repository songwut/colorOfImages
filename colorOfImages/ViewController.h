//
//  ViewController.h
//  colorOfImages
//
//  Created by Songwut on 1/5/13.
//  Copyright (c) 2013 Songwut. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    UIColor *rgbNews;
    UIImage *originalImage;
    int ix;
    int iy;
}
@property (weak, nonatomic) IBOutlet UITextField *pointx;
@property (weak, nonatomic) IBOutlet UITextField *pointy;

@property (weak, nonatomic) IBOutlet UIView *showColorView;
@property (weak, nonatomic) IBOutlet UIImageView *originalImg;
@end
