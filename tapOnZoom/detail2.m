//
//  detail2.m
//  tapOnZoom
//
//  Created by trung bao on 09/12/2015.
//  Copyright © 2015 baotrung. All rights reserved.
//

#import "detail2.h"

@interface detail2 () <UIScrollViewDelegate,UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation detail2
{
    UIScrollView* scrollView;
    UIImageView* photo;
    UITapGestureRecognizer* singTap,* doubleTap;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 60, self.view.bounds.size.width, self.view.bounds.size.height - 60)];
    scrollView.delegate = self;
    scrollView.maximumZoomScale = 10.0;
    scrollView.minimumZoomScale = 0.25;
    photo = [[UIImageView alloc] initWithFrame:scrollView.bounds];
    photo.image = [UIImage imageNamed:@"image2"];
    photo.userInteractionEnabled = YES;
    photo.multipleTouchEnabled = YES;
    photo.contentMode = UIViewContentModeScaleAspectFit;
    singTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                      action:@selector(Tap:)];
    singTap.numberOfTapsRequired = 1;
    singTap.delegate = self;
    [photo addGestureRecognizer:singTap];
    doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                        action:@selector(DoubleTap:)];
    doubleTap.numberOfTapsRequired = 2;
    doubleTap.delegate = self;
    [photo addGestureRecognizer:doubleTap];
    [singTap requireGestureRecognizerToFail:doubleTap];
    [scrollView addSubview:photo];
    [self.view addSubview:scrollView];
    self.label.text = @"1.00";
}
- (void)scrollViewDidZoom:(UIScrollView *) scrollView {
    self.label.text = [NSString stringWithFormat:@"%2.2f",scrollView.zoomScale];
}
- (void) Tap: (UITapGestureRecognizer*) Tap {
    CGPoint tapPoint = [Tap locationInView:photo];
    float newScale = scrollView.zoomScale * 1.5;
    [self zoomRectForScale:newScale withCenter:tapPoint];
}
- (void) DoubleTap: (UITapGestureRecognizer*) Tap {
    CGPoint tapPoint = [Tap locationInView:photo];
    float newScale = scrollView.zoomScale / 1.5;
    [self zoomRectForScale:newScale withCenter:tapPoint];
}
-(void) zoomRectForScale: (float) scale withCenter: (CGPoint) center {
    CGRect zoomRect;
    CGSize scrollViewSize = scrollView.bounds.size;
    zoomRect.size.width = scrollViewSize.width / scale;
    zoomRect.size.height = scrollViewSize.height / scale;
    zoomRect.origin.x = center.x - (zoomRect.size.width / 2);
    zoomRect.origin.y = center.y - (zoomRect.size.height / 2);
    [scrollView zoomToRect:zoomRect animated:YES];
    self.label.text = [NSString stringWithFormat:@"%2.2f",scrollView.zoomScale];
}
- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return photo;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backMaster:(id)sender {
    UIStoryboard* master = [UIStoryboard storyboardWithName:@"Main"
                                                     bundle:nil];
    UIViewController* initialmaster = [master instantiateInitialViewController];
    initialmaster.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:initialmaster
                       animated:NO
                     completion:nil];
}

@end
