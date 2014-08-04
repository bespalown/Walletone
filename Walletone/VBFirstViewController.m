//
//  VBFirstViewController.m
//  RESideMenuStoryboards
//
//  Created by Viktor Bespalov on 10/9/13.
//  Copyright (c) 2013 Viktor Bespalov. All rights reserved.
//

#import "VBFirstViewController.h"
#import "UIViewController+RESideMenu.h"

@interface VBFirstViewController ()

@end

@implementation VBFirstViewController

-(void)viewDidLoad
{
    VBAppDelegate* appDelegate = [[UIApplication sharedApplication] delegate];
    
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithTitle:@"=" style:UIBarButtonItemStyleBordered target:self action:@selector(presentLeftMenuViewController:)];
    [leftBarButton setTintColor:vbGreen];
    self.navigationItem.leftBarButtonItem = leftBarButton;
    
    UIBarButtonItem *rightBarButtun = [[UIBarButtonItem alloc] initWithTitle:@"=" style:UIBarButtonItemStyleBordered target:self action:@selector(presentLeftMenuViewController:)];
    [rightBarButtun setTintColor:vbGreen];
    self.navigationItem.rightBarButtonItem = rightBarButtun;
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor grayColor]};

}

- (void)viewDidLayoutSubviews {
    [_scrollView setContentSize:CGSizeMake(320, 1500)];
}

@end
