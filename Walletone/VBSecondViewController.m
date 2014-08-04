//
//  VBSecondViewController.m
//  RESideMenuStoryboards
//
//  Created by Viktor Bespalov on 10/9/13.
//  Copyright (c) 2013 Viktor Bespalov. All rights reserved.
//

#import "VBSecondViewController.h"

#import "ConversionView.h"
#import "ToolsSalesView.h"

@interface VBSecondViewController ()
{
    ConversionView* conversionView;
    ToolsSalesView* toolsSalesView;
}
@end

@implementation VBSecondViewController

- (IBAction)pushViewController:(id)sender
{
    /*
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.title = @"Pushed Controller";
    viewController.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:viewController animated:YES];
     */
    
    [conversionView animateFill];
    [toolsSalesView animateFill];
}

-(void)viewDidLoad
{
    NSArray *percentArray = @[@"33",@"56",@"87",@"32"];
    
    conversionView = [[ConversionView alloc] initWithFrame:CGRectMake(0, 100, 320, 150) dataArray:percentArray];
    [self.view addSubview:conversionView];
    
    NSArray* arr = @[@"34",@"21",@"28",@"17"];
    toolsSalesView = [[ToolsSalesView alloc] initWithFrame:CGRectMake(0, 260, 320, 150) dataArray:arr];
    [self.view addSubview:toolsSalesView];
}

@end
