//
//  ViewController.m
//  WatchDemo
//
//  Created by LesogoMini on 15/10/29.
//  Copyright © 2015年 重庆美天科技有限公司. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface ViewController ()

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
- (IBAction)pushToThirdVC:(id)sender {
    NSMutableArray *vcArray = [NSMutableArray arrayWithArray:self.navigationController.viewControllers];
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    
    SecondViewController *secondVC = [storyBoard instantiateViewControllerWithIdentifier:@"SecondViewController"];;
    ThirdViewController *thirdVC = [storyBoard instantiateViewControllerWithIdentifier:@"ThirdViewController"];;
    
    [vcArray addObject:secondVC];
    [vcArray addObject:thirdVC];
    
    [self.navigationController setViewControllers:vcArray animated:YES];
}

@end
