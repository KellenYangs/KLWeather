//
//  ViewController.m
//  雪花加载动画
//
//  Created by bcmac3 on 16/1/25.
//  Copyright © 2016年 KellenYangs. All rights reserved.
//

#import "ViewController.h"
#import "EmitterLayerView.h"
#import "CALayer+MaskLayer.h"

@interface ViewController ()
@property (nonatomic, strong) EmitterLayerView *snow;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor grayColor];
    
    [self initSnow];
}

- (void)initSnow {
    self.snow = [[EmitterLayerView alloc] initWithFrame:CGRectMake(100, 100, 150, 150)];
//    self.snow.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.snow];
    self.snow.snowImage  = [UIImage imageNamed:@"rain"];
    self.snow.birthRate  = 120.f;
    self.snow.gravity    = 2005.f;
    self.snow.speed     = 10.f;
    self.snow.snowColor  = [UIColor whiteColor];
    self.snow.layer.mask = [CALayer createMaskLayerWithSize:CGSizeMake(150, 150)
                                               maskPNGImage:[UIImage imageNamed:@"alpha"]];
    [self.snow show];
    self.snow.transform  = CGAffineTransformMake(1.4, 0, 0, 1.4, 0, 0);
//    self.snow.alpha      = 0.f;
}


@end
