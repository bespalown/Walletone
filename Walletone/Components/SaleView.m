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
    UILabel *rightButton_countSales;
    UILabel *rightButton_countSales_percent;
    UILabel *rightButton_sumlabel;
    BOOL isRightButtonReverse;
    
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
        isRightButtonReverse = NO;
        self.backgroundColor = [UIColor clearColor];
        
        UIButton* leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [leftButton setFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame))];
        [leftButton setBackgroundColor:[UIColor clearColor]];
        //[leftButton addTarget:self action:@selector(leftButtonActions) forControlEvents:UIControlEventTouchUpInside];
        //leftButton.layer.borderColor = vbGray.CGColor;
        //leftButton.layer.borderWidth = 1;
        
        UILabel *leftButtonHeaderlabel = [[UILabel alloc] initWithFrame:
                                          CGRectMake(0, 16, CGRectGetWidth(leftButton.frame), 13)];
        leftButtonHeaderlabel.text = @"Продажи за 30 дней";
        leftButtonHeaderlabel.textColor = vbGray;
        leftButtonHeaderlabel.font = [UIFont fontWithName:@"Uninsta-Normal" size:13];
        leftButtonHeaderlabel.textAlignment = NSTextAlignmentCenter;
        leftButtonHeaderlabel.userInteractionEnabled = NO;
        leftButtonHeaderlabel.exclusiveTouch = NO;
        
        leftButton_countSales = [[UILabel alloc] initWithFrame:
                                 CGRectMake(0, CGRectGetMaxY(leftButtonHeaderlabel.frame)+12, 95, 28)];
        leftButton_countSales.text = @"285";
        leftButton_countSales.font = [UIFont fontWithName:@"Uninsta-Normal" size:36];
        leftButton_countSales.textAlignment = NSTextAlignmentRight;
        leftButton_countSales.textColor = vbOrange;
        leftButton_countSales.userInteractionEnabled = NO;
        leftButton_countSales.exclusiveTouch = NO;
        [leftButton addSubview:leftButton_countSales];
        
        leftButton_countSales_percent = [[UILabel alloc] initWithFrame:
                                         CGRectMake(97, CGRectGetMaxY(leftButtonHeaderlabel.frame)+12, 32, 16)];
        leftButton_countSales_percent.text = @"+45%";
        leftButton_countSales_percent.font = [UIFont fontWithName:@"Uninsta-Normal" size:10];
        leftButton_countSales_percent.textColor = vbBackground;
        leftButton_countSales_percent.backgroundColor = vbOrange;
        leftButton_countSales_percent.layer.cornerRadius = 1;
        leftButton_countSales_percent.layer.masksToBounds = YES;
        leftButton_countSales_percent.textAlignment = NSTextAlignmentCenter;
        leftButton_countSales_percent.userInteractionEnabled = NO;
        leftButton_countSales_percent.exclusiveTouch = NO;
        [leftButton addSubview:leftButton_countSales_percent];
        
        leftButton_sumlabel = [[UILabel alloc] initWithFrame:
                               CGRectMake(0, CGRectGetMaxY(leftButton_countSales.frame)-5, CGRectGetWidth(leftButton.frame), 36)];
        leftButton_sumlabel.text = [NSString stringWithFormat:@"на сумму %@ Р", @"234 900"];
        leftButton_sumlabel.textColor = vbGray;
        leftButton_sumlabel.font = [UIFont fontWithName:@"Uninsta-Normal" size:11];
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
        [rightButton setFrame:CGRectMake(CGRectGetWidth(self.frame)/2, 0, CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame))];
        [rightButton setBackgroundColor:[UIColor clearColor]];
        //[rightButton addTarget:self action:@selector(rightButtonActions) forControlEvents:UIControlEventTouchUpInside];
        //rightButton.layer.borderColor = vbGray.CGColor;
        //rightButton.layer.borderWidth = 1;

        UILabel *rightButtonHeaderlabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 16, CGRectGetWidth(rightButton.frame), 13)];
        rightButtonHeaderlabel.text = @"Продажи за вчера";
        rightButtonHeaderlabel.textColor = vbGray;
        rightButtonHeaderlabel.font = [UIFont fontWithName:@"Uninsta-Normal" size:13];
        rightButtonHeaderlabel.textAlignment = NSTextAlignmentCenter;
        rightButtonHeaderlabel.userInteractionEnabled = NO;
        rightButtonHeaderlabel.exclusiveTouch = NO;
        [rightButton addSubview:rightButtonHeaderlabel];

        rightButton_countSales = [[UILabel alloc] initWithFrame:
                                           CGRectMake(0, CGRectGetMaxY(rightButtonHeaderlabel.frame)+12, 95, 28)];
        rightButton_countSales.text = @"46";
        rightButton_countSales.font = [UIFont fontWithName:@"Uninsta-Normal" size:36];
        rightButton_countSales.textAlignment = NSTextAlignmentRight;
        rightButton_countSales.textColor = vbBlue;
        rightButton_countSales.userInteractionEnabled = NO;
        rightButton_countSales.exclusiveTouch = NO;
        [rightButton addSubview:rightButton_countSales];
        
        rightButton_countSales_percent = [[UILabel alloc] initWithFrame:
                                                   CGRectMake(97, CGRectGetMaxY(rightButtonHeaderlabel.frame)+12, 32, 16)];
        rightButton_countSales_percent.text = @"+23%";
        rightButton_countSales_percent.font = [UIFont fontWithName:@"Uninsta-Normal" size:10];
        rightButton_countSales_percent.textColor = vbBackground;
        rightButton_countSales_percent.backgroundColor = vbBlue;
        rightButton_countSales_percent.layer.cornerRadius = 1;
        rightButton_countSales_percent.layer.masksToBounds = YES;
        rightButton_countSales_percent.textAlignment = NSTextAlignmentCenter;
        rightButton_countSales_percent.userInteractionEnabled = NO;
        rightButton_countSales_percent.exclusiveTouch = NO;
        [rightButton addSubview:rightButton_countSales_percent];
        
        rightButton_sumlabel = [[UILabel alloc] initWithFrame:
                                         CGRectMake(0, CGRectGetMaxY(rightButton_countSales.frame)-5, CGRectGetWidth(rightButton.frame), 36)];
        rightButton_sumlabel.text = [NSString stringWithFormat:@"на сумму %@ Р", @"58 300"];
        rightButton_sumlabel.textColor = vbGray;
        rightButton_sumlabel.font = [UIFont fontWithName:@"Uninsta-Normal" size:11];
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

    CGRect tempRectCount = originalCountFrame;
    tempRectCount.origin.y += 30;
    CGRect rectCount = isleftButtonReverse ? tempRectCount : originalCountFrame;
    
    CGRect rectCountPercent = leftButton_countSales_percent.frame;
    rectCountPercent.origin.y = isleftButtonReverse ? rectCountPercent.origin.y + 34 : rectCountPercent.origin.y - 34;
    
    CGRect tempRectSum = originalSumFrame;
    tempRectSum.origin.y -= 30;
    CGRect rectSum = isleftButtonReverse ? tempRectSum : originalSumFrame;

    //11 36

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
            leftButton_sumlabel.frame = rectSum;
            
            leftButton_sumlabel.font = [UIFont fontWithName:@"Uninsta-Normal" size:isleftButtonReverse ? 33 : 11];
            leftButton_sumlabel.text = isleftButtonReverse ? [NSString stringWithFormat:@"%@ Р", @"234 900"] :
                                                    [NSString stringWithFormat:@"на сумму %@ Р", @"234 900"];
        } completion:^(BOOL finished) { }];
    });
}

-(void) rightButtonActions
{
    isRightButtonReverse = isRightButtonReverse ? NO : YES;
    
    UIColor* colorCount = isRightButtonReverse ? vbGray : vbBlue;
    UIColor* colorSum = isRightButtonReverse ? vbBlue : vbGray;
    
    CGFloat transormCount = isRightButtonReverse ? 0.6 : 1;
    
    CGRect rectCount = rightButton_countSales.frame;
    rectCount.origin.y = isRightButtonReverse ? rectCount.origin.y + 30 : rectCount.origin.y - 30;
    
    CGRect rectCountPercent = rightButton_countSales_percent.frame;
    rectCountPercent.origin.y = isRightButtonReverse ? rectCountPercent.origin.y + 34 : rectCountPercent.origin.y - 34;

    CGRect rectSum = rightButton_sumlabel.frame;
    rectSum.origin.y = isRightButtonReverse ? rectSum.origin.y - 30 : rectSum.origin.y + 30;
    
    //11 36
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView transitionWithView:rightButton_countSales duration:0.5 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            rightButton_countSales.textColor = colorCount;
            rightButton_countSales.transform = CGAffineTransformMakeScale(transormCount, transormCount);
            rightButton_countSales.frame = rectCount;
            
            rightButton_countSales_percent.frame = rectCountPercent;
        } completion:^(BOOL finished) { }];
    });
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView transitionWithView:rightButton_sumlabel duration:0.5 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            rightButton_sumlabel.textColor = colorSum;
            rightButton_sumlabel.frame = rectSum;
            
            rightButton_sumlabel.font = [UIFont fontWithName:@"Uninsta-Normal" size:isRightButtonReverse ? 33 : 11];
            rightButton_sumlabel.text = isRightButtonReverse ? [NSString stringWithFormat:@"%@ Р", @"58 300"] :
                                                        [NSString stringWithFormat:@"на сумму %@ Р", @"58 300"];
        } completion:^(BOOL finished) { }];
    });
}

@end
