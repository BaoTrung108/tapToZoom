//
//  ViewController.m
//  tapOnZoom
//
//  Created by trung bao on 09/12/2015.
//  Copyright © 2015 baotrung. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)butimage1:(id)sender {
    [self butstoryboard1];
}
- (IBAction)butimage2:(id)sender {
    [self butstoryboard2];
}

-(void) butstoryboard1 {
    UIStoryboard* detail1 = [UIStoryboard storyboardWithName:@"detail1"
                                                      bundle:nil];
    UIViewController* initialdetail1 = [detail1 instantiateInitialViewController];
    initialdetail1.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:initialdetail1
                       animated:NO
                     completion:nil];
}

-(void) butstoryboard2 {
    UIStoryboard* detail2 = [UIStoryboard storyboardWithName:@"detail2"
                                                      bundle:nil];
    UIViewController* initialdetail2 = [detail2 instantiateInitialViewController];
    initialdetail2.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:initialdetail2
                       animated:NO
                     completion:nil];
}

@end
