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
#import "CurrencyView.h"
#import "SaleView.h"
#import "BuyersView.h"

@interface VBSecondViewController ()
{
    ConversionView* conversionView;
    ToolsSalesView* toolsSalesView;
    CurrencyView* currencyView;
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
    [currencyView animateFill];
}

-(void)viewDidLoad
{
    /*
    NSArray *percentArray = @[@"33",@"56",@"87",@"32"];
    conversionView = [[ConversionView alloc] initWithFrame:CGRectMake(0, 100, 320, 150) dataArray:percentArray];
    [self.view addSubview:conversionView];
    
    NSArray* toolsSalesArrray = @[@"34",@"21",@"28",@"17"];
    toolsSalesView = [[ToolsSalesView alloc] initWithFrame:CGRectMake(0, 260, 320, 150) dataArray:toolsSalesArrray];
    [self.view addSubview:toolsSalesView];
    
    NSArray* currencyArray = @[@"34",@"21",@"28",@"97",@"10"];
    currencyView = [[CurrencyView alloc] initWithFrame:CGRectMake(0, 420, 320, 150) dataArray:currencyArray];
    [self.view addSubview:currencyView];
     */
    
    SaleView* saleView = [[SaleView alloc] initWithFrame:CGRectMake(0, 100, 320, 100)];
    [self.view addSubview:saleView];
    
    BuyersView* buyersView = [[BuyersView alloc] initWithFrame:CGRectMake(0, 210, 320, 100)];
    [self.view addSubview:buyersView];
}

@end
