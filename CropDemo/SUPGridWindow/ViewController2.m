//
//  ViewController2.m
//  CropDemo
//
//  Created by Tops on 08/12/14.
//  Copyright (c) 2014 Tops. All rights reserved.
//

#import "ViewController2.h"
#import "YKImageCropperOverlayView.h"


typedef NS_ENUM(NSUInteger, OverlayViewPanningMode) {
    OverlayViewPanningModeNone     = 0,
    OverlayViewPanningModeLeft     = 1 << 0,
    OverlayViewPanningModeRight    = 1 << 1,
    OverlayViewPanningModeTop      = 1 << 2,
    OverlayViewPanningModeBottom   = 1 << 3
};

@interface ViewController2 ()
@property (nonatomic, strong) YKImageCropperOverlayView *overlayView;
@property (nonatomic, assign) int numberOfColumns;
@property (nonatomic, assign) int numberOfRows;


@end

@implementation ViewController2
@synthesize numberOfRows,numberOfColumns;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Overlay
    self.view.backgroundColor = [UIColor blackColor];
    self.overlayView = [[YKImageCropperOverlayView alloc] initWithFrame:self.view.frame];
    //self.overlayView.maxSize = self.view.baseRect.size;
    [self.view addSubview:self.overlayView];
    
    
    
    self.overlayView.clearRect = self.view.frame;
    [self.overlayView setNeedsDisplay];
    
//    
    numberOfColumns=10;
    numberOfRows=10;
//    
//    
//    
    [self drawRect:CGRectMake(0, 50, 300, 300)];
}



- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 5.0);
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
   
    CGFloat columnWidth = self.view.frame.size.width / (self.numberOfColumns + 1.0);
    
    for(int i = 1; i <= self.numberOfColumns; i++)
    {
        CGPoint startPoint;
        CGPoint endPoint;
        
        startPoint.x = columnWidth * i;
        startPoint.y = 0.0f;
        
        endPoint.x = startPoint.x;
        endPoint.y = 300;
        
        CGContextMoveToPoint(context, startPoint.x, startPoint.y);
        CGContextAddLineToPoint(context, endPoint.x, endPoint.y);
        CGContextStrokePath(context);
    }
    
    // ---------------------------
    // Drawing row lines
    // ---------------------------
    
    // calclulate row height
    CGFloat rowHeight = 300 / (self.numberOfRows + 1.0);
    
    for(int j = 1; j <= self.numberOfRows; j++)
    {
        CGPoint startPoint;
        CGPoint endPoint;
        
        startPoint.x = 0.0f;
        startPoint.y = rowHeight * j;
        
        endPoint.x = 300;
        endPoint.y = startPoint.y;
        
        CGContextMoveToPoint(context, startPoint.x, startPoint.y);
        CGContextAddLineToPoint(context, endPoint.x, endPoint.y);
        CGContextStrokePath(context);
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

@end
