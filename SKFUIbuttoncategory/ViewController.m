//
//  ViewController.m
//  SKFUIbuttoncategory
//
//  Created by 孙凯峰 on 16/9/1.
//  Copyright © 2016年 孙凯峰. All rights reserved.
//

#import "ViewController.h"
#import "UIControl+FMGControl.h"
#import "UIButton+EnlargeEdge.h"



@interface ViewController ()
- (IBAction)ButtonClick:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *ViewButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.ViewButton.acceptEventInterval=5;
    [self.ViewButton setEnlargeEdgeWithTop:30 right:30 bottom:30 left:30];
//    self.setEnlargeEdge set
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ButtonClick:(id)sender {
    NSLog(@"点击了按钮");
}
@end
