//
//  VBFirstViewController.m
//  RESideMenuStoryboards
//
//  Created by Viktor Bespalov on 10/9/13.
//  Copyright (c) 2013 Viktor Bespalov. All rights reserved.
//

#import "VBFirstViewController.h"
#import "UIViewController+RESideMenu.h"
#import "ConversionView.h"
#import "ToolsSalesView.h"
#import "CurrencyView.h"
#import "SaleView.h"
#import "BuyersView.h"

@interface VBFirstViewController () <UIScrollViewDelegate>
{
    ConversionView* conversionView;
    ToolsSalesView* toolsSalesView;
    CurrencyView* currencyView;
}
@end

@implementation VBFirstViewController

-(void)viewDidLoad
{
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithTitle:@"=" style:UIBarButtonItemStyleBordered target:self action:@selector(presentLeftMenuViewController:)];
    [leftBarButton setTintColor:vbGreen];
    self.navigationItem.leftBarButtonItem = leftBarButton;
    
    UIBarButtonItem *rightBarButtun = [[UIBarButtonItem alloc] initWithTitle:@"=" style:UIBarButtonItemStyleBordered target:self action:@selector(presentLeftMenuViewController:)];
    [rightBarButtun setTintColor:vbGreen];
    self.navigationItem.rightBarButtonItem = rightBarButtun;
    
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    label.text = [NSString stringWithFormat:@"23 568 Р"];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = vbGreen;
    label.font = [UIFont fontWithName:@"Uninsta-Normal" size:30];
    label.contentMode = UIViewContentModeTop;

    [self.navigationItem setTitleView:label];
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: vbGray};
    self.navigationController.navigationBar.barTintColor = vbBackground;
    self.navigationController.navigationBar.translucent = NO;
    
    _scrollView.backgroundColor = vbBackground;
    _scrollView.delegate = (id)self;
    
    SaleView* saleView = [[SaleView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    [_scrollView addSubview:saleView];
    
    NSArray *percentArray = @[@"33",@"56",@"87",@"32"];
    conversionView = [[ConversionView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(saleView.frame), 320, 150) dataArray:percentArray];
    [_scrollView addSubview:conversionView];
    
    NSArray* toolsSalesArrray = @[@"34",@"21",@"28",@"17"];
    toolsSalesView = [[ToolsSalesView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(conversionView.frame), 320, 150) dataArray:toolsSalesArrray];
    [_scrollView addSubview:toolsSalesView];
    
    BuyersView* buyersView = [[BuyersView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(toolsSalesView.frame), 320, 100)];
    [_scrollView addSubview:buyersView];
    
    NSArray* currencyArray = @[@"34",@"21",@"28",@"97",@"10"];
    currencyView = [[CurrencyView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(buyersView.frame), 320, 150) dataArray:currencyArray];
    [_scrollView addSubview:currencyView];
  
    [self performSelector:@selector(animLoad) withObject:self afterDelay:2];
}

-(void)animLoad
{
    [conversionView animateFill];
    [toolsSalesView animateFill];
}

- (void)viewDidLayoutSubviews {
    [_scrollView setContentSize:CGSizeMake(320, CGRectGetMaxY(currencyView.frame))];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint p = scrollView.contentOffset;
    NSLog(@"x=%f,y=%f",p.x,p.y);
    if (p.y == 176.0f) {
        [currencyView animateFill];
    }
}

@end
