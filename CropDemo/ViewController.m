//
//  ViewController.m
//  CropDemo
//
//  Created by Tops on 05/12/14.
//  Copyright (c) 2014 Tops. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Rotate.h"
#import "SUPGridView.h"


#define radians(degrees) (degrees * M_PI/180)

@interface ViewController ()
{
    IBOutlet UIView *top_View;
    UIView *down_View;
    BOOL rotate;
    SUPGridView *grid;
}
@property (strong, nonatomic) IBOutlet UIImage *browsed_Img;
@property (strong, nonatomic) IBOutlet UIImage *original_Img;

@property (strong, nonatomic) IBOutlet UIImageView *top_Bar;
@property (strong, nonatomic) IBOutlet UIButton *btn_Bottom_Bar;
@end

@implementation ViewController
@synthesize browsed_Img, top_Bar, scroll_View, img_View, btn_Bottom_Bar, original_Img,numberOfColumns,numberOfRows;



- (void)viewDidLoad
{
    [super viewDidLoad];
    [img_View setImage:[UIImage imageNamed:@"2.jpg"]];
    numberOfColumns=0;
    numberOfRows=0;
}
-(void)viewWillAppear:(BOOL)animated
{
    [self resize_Image4];
    [self drawRect:CGRectMake(10,50,300,450)];
    
}
-(void)resize_Image4
{
    browsed_Img=img_View.image;
    [scroll_View setShowsHorizontalScrollIndicator:NO];
    [scroll_View setShowsVerticalScrollIndicator:NO];
    
    [scroll_View setMinimumZoomScale:[scroll_View frame].size.width / [img_View frame].size.width];
    scroll_View.maximumZoomScale=4.0;
    scroll_View.contentSize=CGSizeMake(self.img_View.frame.size.width, self.img_View.frame.size.height);
    scroll_View.clipsToBounds=YES;
    scroll_View.delegate=self;
    
    
    [top_Bar setBackgroundColor:[UIColor colorWithRed:0.866 green:0.341 blue:0 alpha:1.0]];
    [btn_Bottom_Bar setBackgroundColor:[UIColor colorWithRed:0.161 green:0.498 blue:0.721 alpha:1.0]];
    
    CGSize size = browsed_Img.size;
    CGFloat ratio = 0;
    
    if(size.width > size.height)
    {
        if(size.height != 320)
        {
            ratio = 320.0 / size.height;
            CGRect new_Img_Rect = CGRectMake(0.0, 0.0, ratio * size.width, ratio * size.height);
            UIGraphicsBeginImageContext(new_Img_Rect.size);
            [browsed_Img drawInRect:new_Img_Rect];
            browsed_Img = UIGraphicsGetImageFromCurrentImageContext();
        }
    }
    else
    {
        if(browsed_Img.size.width != 320)
        {
            ratio = 320.0 / size.width;
            CGRect new_Img_Rect = CGRectMake(0.0, 0.0, ratio * size.width, ratio * size.height);
            UIGraphicsBeginImageContext(new_Img_Rect.size);
            [browsed_Img drawInRect:new_Img_Rect];
            browsed_Img = UIGraphicsGetImageFromCurrentImageContext();
        }
        
    }
    
    [img_View setFrame:CGRectMake(0,0, browsed_Img.size.width, browsed_Img.size.height)];
    [scroll_View setContentSize:CGSizeMake(img_View.frame.size.width, img_View.frame.size.height)];
}

-(void)resize_Image6
{
    browsed_Img=img_View.image;
    [scroll_View setShowsHorizontalScrollIndicator:NO];
    [scroll_View setShowsVerticalScrollIndicator:NO];
    
    [scroll_View setMinimumZoomScale:[scroll_View frame].size.width / [img_View frame].size.width];
    scroll_View.maximumZoomScale=4.0;
    //scroll_View.contentSize=CGSizeMake(self.img_View.frame.size.width, self.img_View.frame.size.height);
    scroll_View.clipsToBounds=YES;
    scroll_View.delegate=self;
    
    
    [top_Bar setBackgroundColor:[UIColor colorWithRed:0.866 green:0.341 blue:0 alpha:1.0]];
    [btn_Bottom_Bar setBackgroundColor:[UIColor colorWithRed:0.161 green:0.498 blue:0.721 alpha:1.0]];
    
    CGSize size = browsed_Img.size;
    CGFloat ratio = 0;
    
    if(size.width > size.height)
    {
        if(size.height != 320)
        {
            ratio = 450/size.height;
            CGRect new_Img_Rect = CGRectMake(0.0, 0.0, ratio*size.width, ratio * size.height);
            UIGraphicsBeginImageContext(new_Img_Rect.size);
            [browsed_Img drawInRect:new_Img_Rect];
            browsed_Img = UIGraphicsGetImageFromCurrentImageContext();
        }
    }
    else
    {
        if(browsed_Img.size.width != 320)
        {
            ratio = 300/size.width;
            CGRect new_Img_Rect = CGRectMake(0.0, 0.0, ratio * size.width, ratio * size.height);
            UIGraphicsBeginImageContext(new_Img_Rect.size);
            [browsed_Img drawInRect:new_Img_Rect];
            browsed_Img = UIGraphicsGetImageFromCurrentImageContext();
        }
        
    }
    
    [img_View setFrame:CGRectMake(0,0, browsed_Img.size.width, browsed_Img.size.height)];
    [scroll_View setContentSize:CGSizeMake(img_View.frame.size.width, img_View.frame.size.height)];
}

-(void)set_Image
{
    [img_View setFrame:CGRectMake(0,0, browsed_Img.size.width, browsed_Img.size.height)];
    [scroll_View setContentSize:CGSizeMake(img_View.frame.size.width, img_View.frame.size.height + (scroll_View.frame.size.height-320))];
    {
        //        down_View = [[UIView alloc]initWithFrame:CGRectMake(-1, 410, 322, btn_Bottom_Bar.frame.origin.y-410+1)];
        //        [down_View setBackgroundColor:[UIColor blackColor]];
        //        [down_View setAlpha:0.6];
        //        [down_View.layer setBorderWidth:1.0];
        //        [down_View.layer setBorderColor:[[UIColor colorWithRed:0.866 green:0.341 blue:0 alpha:1.0] CGColor]];
        //        [self.view addSubview:btn_Bottom_Bar];
        //        [self.view addSubview:down_View];
        
        [top_View.layer setBorderWidth:1.0];
        [top_View.layer setBorderColor:[[UIColor colorWithRed:0.866 green:0.341 blue:0 alpha:1.0] CGColor]];
        
        //        UIPinchGestureRecognizer *recognizer_Pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handle_Pinch:)];
        //        [img_View addGestureRecognizer:recognizer_Pinch];
    }
}
- (IBAction)rotate_Action:(id)sender
{
    [img_View setFrame:CGRectMake(img_View.frame.origin.x, img_View.frame.origin.y, img_View.frame.size.height, img_View.frame.size.width)];
    [scroll_View setContentSize:CGSizeMake(img_View.frame.size.width,img_View.frame.size.height)];
    [img_View setImage:[img_View.image imageRotatedByDegrees: -90]];
}

- (IBAction)crop4Click:(id)sender
{
    self.img_View.transform = CGAffineTransformIdentity;
    if (YES)
    {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.25];
        [UIView setAnimationBeginsFromCurrentState:YES];
    }
    
    [scroll_View setFrame:CGRectMake(0,50, 320, 320)];
    [self resize_Image4];
    
    if (YES) {
        [UIView commitAnimations];
    }
}
- (IBAction)crop6Click:(id)sender
{
    self.img_View.transform = CGAffineTransformIdentity;
    if (YES)
    {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.25];
        [UIView setAnimationBeginsFromCurrentState:YES];
        
    }
    [scroll_View setFrame:CGRectMake(10,50,300,450)];
    [self resize_Image6];
    
    if (YES) {
        [UIView commitAnimations];
    }
}
#pragma ------------------------------------------------------------------------------------
- (void)handle_Pinch:(UIPinchGestureRecognizer *)recognizer
{
    [self adjustAnchorPointForGestureRecognizer:recognizer];
    
    [img_View setFrame:CGRectMake(0, top_View.frame.size.height, img_View.frame.size.width, img_View.frame.size.height)];
    if ([recognizer state] == UIGestureRecognizerStateBegan || [recognizer state] == UIGestureRecognizerStateChanged) {
        [recognizer view].transform = CGAffineTransformScale([[recognizer view] transform], [recognizer scale], [recognizer scale]);
        [recognizer setScale:1];
    }
    
    
    [scroll_View setContentSize:CGSizeMake(img_View.frame.size.width, img_View.frame.size.height+(scroll_View.frame.size.height-320))];
    
    scroll_View.contentOffset = [recognizer locationInView:self.view];
    
    if([(UIPinchGestureRecognizer*)recognizer state] == UIGestureRecognizerStateEnded) {
        if (img_View.frame.size.width<320) {
            [scroll_View setZoomScale:1.0];
            [img_View setFrame:CGRectMake(0, 30, 320, browsed_Img.size.height)];
            [scroll_View setContentSize:CGSizeMake(320, img_View.frame.size.height+(scroll_View.frame.size.height-320))];
            [img_View setImage:browsed_Img];
        }
    }
}
- (void)adjustAnchorPointForGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        UIView *piece = gestureRecognizer.view;
        CGPoint locationInView = [gestureRecognizer locationInView:piece];
        CGPoint locationInSuperview = [gestureRecognizer locationInView:piece.superview];
        
        piece.layer.anchorPoint = CGPointMake(locationInView.x / piece.bounds.size.width, locationInView.y / piece.bounds.size.height);
        piece.center = locationInSuperview;
    }
}
#pragma ------------------------------------------------------------------------------------
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return img_View;
}

-(void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    UIView *subView=[scrollView.subviews objectAtIndex:0];
    CGFloat offsetX = (scrollView.bounds.size.width > scrollView.contentSize.width)?
    (scrollView.bounds.size.width - scrollView.contentSize.width) * 0.5 : 0.0;
    CGFloat offsetY = (scrollView.bounds.size.height > scrollView.contentSize.height)?
    (scrollView.bounds.size.height - scrollView.contentSize.height) * 0.5 : 0.0;
    
    
    if(YES)
    {
        [scroll_View setContentSize:CGSizeMake(scroll_View.contentSize.width, scroll_View.contentSize.height)];
    }
    else
    {
        [scroll_View setContentSize:CGSizeMake(scroll_View.contentSize.width, scroll_View.contentSize.height)];
    }
    
}
#pragma ------------------------------------------------------------------------------------
- (IBAction)done_Editing_Image:(id)sender
{
    
    float zoomScale =[scroll_View zoomScale];
	CGRect rect;
    rect.origin.x = ([scroll_View contentOffset].x) ;
	rect.origin.y = ([scroll_View contentOffset].y);
	rect.size.width = ([scroll_View bounds].size.width * zoomScale);
	rect.size.height = (320*zoomScale);
    
	CGImageRef crop = CGImageCreateWithImageInRect([[img_View image] CGImage], rect);
	UIImage *cropped_Img = [UIImage imageWithCGImage:crop];
    UIImage *img =[self captureView:self.view];
}
- (UIImage *)captureView:(UIView *)view {
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(300, 450), NO, [UIScreen mainScreen].scale);
    [view drawViewHierarchyInRect:CGRectMake(-10,-50, self.view.bounds.size.width, self.view.bounds.size.height) afterScreenUpdates:YES];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
- (IBAction)back_Action:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma ------------------------------------------------------------------------------------
- (UIImage *)rotateImage:(UIImage*)src byRadian:(CGFloat)radian {
    UIView *rotatedViewBox = [[UIView alloc] initWithFrame:CGRectMake(0, 0, src.size.width, src.size.height)];
    CGAffineTransform t = CGAffineTransformMakeRotation(radian);
    rotatedViewBox.transform = t;
    CGSize rotatedSize = rotatedViewBox.frame.size;
    UIGraphicsBeginImageContext(rotatedSize);
    CGContextRef bitmap = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(bitmap, rotatedSize.width/2, rotatedSize.height/2);
    CGContextRotateCTM(bitmap, radian);
    CGContextScaleCTM(bitmap, 1.0, 1.0);
    CGContextDrawImage(bitmap, CGRectMake(src.size.width / 2, src.size.height / 2, src.size.width, src.size.height), [src CGImage]);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
-(IBAction) btnSideMenuOpenClick : (id) sender {
    //    imgtemp.image = [self rotateImage:imgtemp.image byRadian:90 * M_PI/180];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [img_View setFrame:CGRectMake(0, top_View.frame.size.height, img_View.frame.size.width, img_View.frame.size.height)];
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0);
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    
    CGFloat columnWidth = self.scroll_View.frame.size.width / (self.numberOfColumns + 1.0);
    
    for(int i = 1; i <= self.numberOfColumns; i++)
    {
        CGPoint startPoint;
        CGPoint endPoint;
        
        startPoint.x = columnWidth * i;
        startPoint.y = 0.0f;
        
        endPoint.x = startPoint.x;
        endPoint.y = self.scroll_View.frame.size.height;
        
        CGContextMoveToPoint(context, startPoint.x, startPoint.y);
        CGContextAddLineToPoint(context, endPoint.x, endPoint.y);
        CGContextStrokePath(context);
    }
    
    CGFloat rowHeight = self.scroll_View.frame.size.height / (self.numberOfRows + 1.0);
    
    for(int j = 1; j <= self.numberOfRows; j++)
    {
        CGPoint startPoint;
        CGPoint endPoint;
        
        startPoint.x = 0.0f;
        startPoint.y = rowHeight * j;
        
        endPoint.x = self.scroll_View.frame.size.width;
        endPoint.y = startPoint.y;
        
        CGContextMoveToPoint(context, startPoint.x, startPoint.y);
        CGContextAddLineToPoint(context, endPoint.x, endPoint.y);
        CGContextStrokePath(context);
    }
}

@end
