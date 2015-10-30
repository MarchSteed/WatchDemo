//
//  SecondViewController.m
//  WatchDemo
//
//  Created by LesogoMini on 15/10/30.
//  Copyright © 2015年 重庆美天科技有限公司. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
- (IBAction)replaceWithThirdVC:(id)sender {
    
    NSMutableArray *vcArray = [NSMutableArray arrayWithArray:self.navigationController.viewControllers];
    [vcArray removeLastObject];
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    
    SecondViewController *secondVC = [storyBoard instantiateViewControllerWithIdentifier:@"SecondViewController"];;
    ThirdViewController *thirdVC = [storyBoard instantiateViewControllerWithIdentifier:@"ThirdViewController"];;
    
//    [vcArray addObject:secondVC];
    [vcArray addObject:thirdVC];
    
    [self.navigationController setViewControllers:vcArray animated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
