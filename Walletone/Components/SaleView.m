//
//  SaleView.m
//  Walletone
//
//  Created by Viktor Bespalov on 05/08/14.
//  Copyright (c) 2014 Viktor Bespalov. All rights reserved.
//

#import "SaleView.h"



@implementation SaleView
{
    UILabel *leftButton_countSales;
    UILabel *leftButton_countSales_percent;
    UILabel *leftButton_sumlabel;
    
    CGRect originalCountFrame;
    CGRect originalSumFrame;
    
    BOOL isleftButtonReverse;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        isleftButtonReverse = NO;
        self.backgroundColor = [UIColor whiteColor];
        
        UIButton* leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [leftButton setFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame))];
        [leftButton setBackgroundColor:[UIColor clearColor]];
        [leftButton addTarget:self action:@selector(leftButtonActions) forControlEvents:UIControlEventTouchUpInside];
        leftButton.layer.borderColor = vbGray.CGColor;
        leftButton.layer.borderWidth = 1;
        
        UILabel *leftButtonHeaderlabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(leftButton.frame), 30)];
        leftButtonHeaderlabel.text = @"Продажи за 30 дней";
        leftButtonHeaderlabel.font = [UIFont fontWithName:@"Uninsta-Normal" size:12];
        leftButtonHeaderlabel.textAlignment = NSTextAlignmentCenter;
        leftButtonHeaderlabel.userInteractionEnabled = NO;
        leftButtonHeaderlabel.exclusiveTouch = NO;
        
        leftButton_countSales = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(leftButtonHeaderlabel.frame), CGRectGetMidX(leftButton.frame), 30)];
        leftButton_countSales.text = @"285";
        leftButton_countSales.font = [UIFont fontWithName:@"Uninsta-Normal" size:30];
        leftButton_countSales.textAlignment = NSTextAlignmentRight;
        leftButton_countSales.textColor = vbOrange;
        leftButton_countSales.userInteractionEnabled = NO;
        leftButton_countSales.exclusiveTouch = NO;
        [leftButton addSubview:leftButton_countSales];
        
        leftButton_countSales_percent = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(leftButton_countSales.frame), CGRectGetMaxY(leftButtonHeaderlabel.frame)+3, 35, 15)];
        leftButton_countSales_percent.text = @"+45%";
        leftButton_countSales_percent.font = [UIFont fontWithName:@"Uninsta-Normal" size:12];
        leftButton_countSales_percent.textColor = vbGray;
        leftButton_countSales_percent.backgroundColor = vbOrange;
        leftButton_countSales_percent.layer.cornerRadius = 1;
        leftButton_countSales_percent.layer.masksToBounds = YES;
        leftButton_countSales_percent.textAlignment = NSTextAlignmentCenter;
        leftButton_countSales_percent.userInteractionEnabled = NO;
        leftButton_countSales_percent.exclusiveTouch = NO;
        [leftButton addSubview:leftButton_countSales_percent];
        
        leftButton_sumlabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(leftButton_countSales.frame), CGRectGetWidth(leftButton.frame), 15)];
        leftButton_sumlabel.text = [NSString stringWithFormat:@"на сумму %@ Р", @"234 900"];
        leftButton_sumlabel.font = [UIFont fontWithName:@"Uninsta-Normal" size:12];
        leftButton_sumlabel.textAlignment = NSTextAlignmentCenter;
        leftButton_sumlabel.userInteractionEnabled = NO;
        leftButton_sumlabel.exclusiveTouch = NO;
        
        [leftButton addSubview:leftButton_sumlabel];
        [leftButton addSubview:leftButtonHeaderlabel];
        [self addSubview:leftButton];
        
        originalCountFrame = leftButton_countSales.frame;
        originalSumFrame = leftButton_sumlabel.frame;
        
        //////
        
        UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [rightButton setFrame:CGRectMake(CGRectGetWidth(self.frame)/2-1, 0, CGRectGetWidth(self.frame)/2+1, CGRectGetHeight(self.frame))];
        [rightButton setBackgroundColor:[UIColor clearColor]];
        rightButton.layer.borderColor = vbGray.CGColor;
        rightButton.layer.borderWidth = 1;

        UILabel *rightButtonHeaderlabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(rightButton.frame), 30)];
        rightButtonHeaderlabel.text = @"Продажи за вчера";
        rightButtonHeaderlabel.font = [UIFont fontWithName:@"Uninsta-Normal" size:12];
        rightButtonHeaderlabel.textAlignment = NSTextAlignmentCenter;
        rightButtonHeaderlabel.userInteractionEnabled = NO;
        rightButtonHeaderlabel.exclusiveTouch = NO;
        [rightButton addSubview:rightButtonHeaderlabel];

        UILabel *rightButton_countSales = [[UILabel alloc] initWithFrame:
                                           CGRectMake(0,
                                                      CGRectGetMaxY(rightButtonHeaderlabel.frame),
                                                      160/2,
                                                      30)];
        rightButton_countSales.text = @"46";
        rightButton_countSales.font = [UIFont fontWithName:@"Uninsta-Normal" size:30];
        rightButton_countSales.textAlignment = NSTextAlignmentRight;
        rightButton_countSales.textColor = vbBlue;
        rightButton_countSales.userInteractionEnabled = NO;
        rightButton_countSales.exclusiveTouch = NO;
        [rightButton addSubview:rightButton_countSales];
        
        UILabel *rightButton_countSales_percent = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(rightButton_countSales.frame), CGRectGetMaxY(rightButtonHeaderlabel.frame)+3, 35, 15)];
        rightButton_countSales_percent.text = @"+23%";
        rightButton_countSales_percent.font = [UIFont fontWithName:@"Uninsta-Normal" size:12];
        rightButton_countSales_percent.textColor = vbGray;
        rightButton_countSales_percent.backgroundColor = vbBlue;
        rightButton_countSales_percent.layer.cornerRadius = 1;
        rightButton_countSales_percent.layer.masksToBounds = YES;
        rightButton_countSales_percent.textAlignment = NSTextAlignmentCenter;
        rightButton_countSales_percent.userInteractionEnabled = NO;
        rightButton_countSales_percent.exclusiveTouch = NO;
        [rightButton addSubview:rightButton_countSales_percent];
        
        UILabel *rightButton_sumlabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(rightButton_countSales.frame), CGRectGetWidth(leftButton.frame), 15)];
        rightButton_sumlabel.text = [NSString stringWithFormat:@"на сумму %@ Р", @"58 300"];
        rightButton_sumlabel.font = [UIFont fontWithName:@"Uninsta-Normal" size:12];
        rightButton_sumlabel.textAlignment = NSTextAlignmentCenter;
        rightButton_sumlabel.userInteractionEnabled = NO;
        rightButton_sumlabel.exclusiveTouch = NO;
        [rightButton addSubview:rightButton_sumlabel];
        
        [self addSubview:rightButton];
    }
    return self;
}

-(void)leftButtonActions {
    isleftButtonReverse = isleftButtonReverse ? NO : YES;

    UIColor* colorCount = isleftButtonReverse ? vbGray : vbOrange;
    UIColor* colorSum = isleftButtonReverse ? vbOrange : vbGray;
    
    CGFloat transormCount = isleftButtonReverse ? 0.6 : 1;
    CGFloat transormSum = isleftButtonReverse ? 1.2 : 1;
    
    CGRect tempRectCount = originalCountFrame;
    tempRectCount.origin.y += 30;
    CGRect rectCount = isleftButtonReverse ? tempRectCount : originalCountFrame;
    
    CGRect rectCountPercent = leftButton_countSales_percent.frame;
    rectCountPercent.origin.y = isleftButtonReverse ? rectCountPercent.origin.y + 34 : rectCountPercent.origin.y - 34;
    
    CGRect tempRectSum = originalSumFrame;
    tempRectSum.origin.y -= 20;
    CGRect rectSum = isleftButtonReverse ? tempRectSum : originalSumFrame;

    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView transitionWithView:leftButton_countSales duration:0.5 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            leftButton_countSales.textColor = colorCount;
            leftButton_countSales.transform = CGAffineTransformMakeScale(transormCount, transormCount);
            leftButton_countSales.frame = rectCount;
            leftButton_countSales_percent.frame = rectCountPercent;
        } completion:^(BOOL finished) { }];
    });
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView transitionWithView:leftButton_sumlabel duration:0.5 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            leftButton_sumlabel.textColor = colorSum;
            leftButton_sumlabel.transform = CGAffineTransformMakeScale(transormSum, transormSum);
            leftButton_sumlabel.frame = rectSum;
        } completion:^(BOOL finished) { }];
    });
}

@end
