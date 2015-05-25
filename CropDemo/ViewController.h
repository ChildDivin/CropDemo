//
//  ViewController.h
//  CropDemo
//
//  Created by Tops on 05/12/14.
//  Copyright (c) 2014 Tops. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIScrollViewDelegate>
{
    
}
@property (nonatomic, assign) int numberOfColumns;
@property (nonatomic, assign) int numberOfRows;


@property (strong, nonatomic) IBOutlet UIScrollView *scroll_View;
@property (strong, nonatomic) IBOutlet UIImageView *img_View;

- (IBAction)done_Editing_Image:(id)sender;
- (IBAction)back_Action:(id)sender;

- (IBAction)rotate_Action:(id)sender;

@end
