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
#import "VBGraphView.h"
#import "UIImage+Overlay.h"
#import "UINavigationItem+AnimatedPrompt.h"

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
    UIImageView* leftImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"leftItem"]];
    leftImageView.frame = CGRectMake(0, 0, 45/2, 35/2);
    
    UIButton* leftButton = [UIButton buttonWithType: UIButtonTypeCustom];
    [leftButton addSubview:leftImageView];
    [leftButton addTarget:self action:@selector(presentLeftMenuViewController:) forControlEvents:UIControlEventTouchUpInside];
    [leftButton setFrame:CGRectMake(10, 25, 45/2, 35/2)];
    [self.navigationController.view.superview addSubview:leftButton];
    
    UIImageView* rightImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"rightItem"]];
    rightImageView.frame = CGRectMake(0, 0, 45/2, 35/2);
    rightImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    UIButton* rightButton = [UIButton buttonWithType: UIButtonTypeCustom];
    [rightButton addSubview:rightImageView];
    [rightButton addTarget:self action:@selector(presentLeftMenuViewController:) forControlEvents:UIControlEventTouchUpInside];
    [rightButton setFrame:CGRectMake(320-45/2-10, 25, 45/2, 35/2)];
    [self.navigationController.view.superview addSubview:rightButton];
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    label.text = [NSString stringWithFormat:@"23 568 Р"];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont fontWithName:@"Uninsta-Normal" size:36];
    label.contentMode = UIViewContentModeTop;

    [self.navigationItem setTitleView:label];
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    self.navigationController.navigationBar.barTintColor = vbGreen;
    self.navigationController.navigationBar.translucent = NO;
    
    _scrollView.backgroundColor = vbBackground;
    _scrollView.delegate = (id)self;
    
    CGFloat margin = 20;
    
    SaleView* saleView = [[SaleView alloc] initWithFrame:CGRectMake(0, 0, 320, 100 + margin)];
    [_scrollView addSubview:saleView];
    
    VBGraphView* graphView = [[VBGraphView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(saleView.frame), 320, 150)];
    [_scrollView addSubview:graphView];
    
    NSArray *percentArray = @[@"33",@"56",@"87",@"32"];
    conversionView = [[ConversionView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(graphView.frame) + margin, 320, 150 + margin) dataArray:percentArray];
    [_scrollView addSubview:conversionView];
    
    NSArray* toolsSalesArrray = @[@"34",@"21",@"28",@"17"];
    toolsSalesView = [[ToolsSalesView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(conversionView.frame), 320, 180 + margin) dataArray:toolsSalesArrray];
    [_scrollView addSubview:toolsSalesView];
    
    BuyersView* buyersView = [[BuyersView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(toolsSalesView.frame), 320, 100 + margin)];
    [_scrollView addSubview:buyersView];
    
    NSArray* currencyArray = @[@"34",@"21",@"28",@"97",@"10"];
    currencyView = [[CurrencyView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(buyersView.frame), 320, 150 + margin) dataArray:currencyArray];
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
    //NSLog(@"x=%f,y=%f",p.x,p.y);
    if (p.y >= 176.0f) {
        [currencyView animateFill];
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    self.navigationItem.prompt = nil;
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (!decelerate) {
        self.navigationItem.prompt = @"Баланс в рублях";
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.navigationItem.prompt = @"Баланс в рублях";
}

@end
