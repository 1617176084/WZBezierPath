//
//  ViewController.m
//  WZBezierPath
//
//  Created by 黄燕 on 16/5/27.
//  Copyright © 2016年 Mr.Wang. All rights reserved.
//

#import "ViewController.h"
#import "WZBezierPath.h"

@interface ViewController ()

@property(weak, nonatomic) IBOutlet UIButton *btnBegin;
@property(weak, nonatomic) IBOutlet WZBezierPath *viewTarget;
@property(weak, nonatomic) IBOutlet UIView *labBegin;
@property(weak, nonatomic) IBOutlet UIView *labENd;
@property(weak, nonatomic) IBOutlet UIView *labControl;
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}
- (IBAction)beginClick:(UIButton *)sender {
  sender.enabled = false;
  [_viewTarget moveToPoint:_labBegin.center
       addQuadCurveToPoint:_labENd.center
              controlPoint:_labControl.center
                   didStop:^{
                     sender.enabled = true;
                   }];
}

@end
