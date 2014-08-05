//
//  СurrencyView.m
//  Walletone
//
//  Created by Viktor Bespalov on 04/08/14.
//  Copyright (c) 2014 Viktor Bespalov. All rights reserved.
//

#import "CurrencyView.h"
#import "KAProgressLabel.h"

@implementation CurrencyView

{
    NSArray* percentArray;
}

-(id)initWithFrame:(CGRect)frame dataArray:(NSArray *)dataArray
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        percentArray = dataArray;
        
        NSArray* colorArray = [NSArray arrayWithObjects:
                               vbBlue,
                               vbLilac,
                               vbOrange,
                               vbGreen,
                               vbRed,
                               nil];
        
        NSArray* subTextArray = @[@"Евро",@"Рубли",@"Доллары",@"Гривны",@"Разное"];
        
        UILabel* title = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, CGRectGetWidth(self.frame), 20)];
        title.text = @"Валюты";
        title.textAlignment = NSTextAlignmentCenter;
        title.textColor = vbGray;
        title.font = [UIFont fontWithName:@"Uninsta-Normal" size:14];
        [self addSubview:title];
        
        UIView* percentFieldBackground = [[UIView alloc] initWithFrame:CGRectMake(0, 40, CGRectGetWidth(self.frame), 50)];
        percentFieldBackground.backgroundColor = [UIColor colorWithRed:46/255.0f green:47/255.0f blue:50/255.0f alpha:1];
        [self addSubview:percentFieldBackground];
        
        CGFloat margin; //отступ справа/слева = 20
        CGFloat indent = margin = 20;
        for (int i=0; i<percentArray.count; i++) {
            KAProgressLabel *percentField = [[KAProgressLabel alloc] initWithFrame:CGRectMake(indent+10, 40, 20, 50)];
            percentField.textAlignment = NSTextAlignmentCenter;
            percentField.textColor = colorArray[i];
            percentField.numberOfLines = 2;
            percentField.font = [UIFont fontWithName:@"Uninsta-Normal" size:20];
            percentField.contentMode = UIViewContentModeTop;
            [percentField setTag:i+10];
            percentField.progressLabelVCBlock = ^(KAProgressLabel *label, CGFloat progress) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    //[label setText:[NSString stringWithFormat:@"%.0f%%", (progress*100)]];
                });
            };
            [percentField setBackBorderWidth: 0.0];
            [percentField setFrontBorderWidth: 0.0];
            [percentField setProgressType:ProgressLabelRect];
            [percentField setColorTable: @{
                                          NSStringFromProgressLabelColorTableKey(ProgressLabelTrackColor):vbGray,
                                          NSStringFromProgressLabelColorTableKey(ProgressLabelProgressColor):colorArray[i]
                                          }];
            [self addSubview:percentField];

            
            KAProgressLabel *percentText = [[KAProgressLabel alloc] initWithFrame:CGRectMake(indent, CGRectGetMaxY(percentField.frame)+5, 40, 20)];
            percentText.text = [NSString stringWithFormat:@"0%%"];
            percentText.textAlignment = NSTextAlignmentCenter;
            percentText.textColor = colorArray[i];
            percentText.numberOfLines = 2;
            percentText.font = [UIFont fontWithName:@"Uninsta-Normal" size:20];
            percentText.contentMode = UIViewContentModeTop;
            [percentText setTag:i+1];
            percentText.progressLabelVCBlock = ^(KAProgressLabel *label, CGFloat progress) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [label setText:[NSString stringWithFormat:@"%.0f%%", (progress*100)]];
                });
            };
            [percentText setBackBorderWidth: 0];
            [percentText setFrontBorderWidth: 0];
            [percentText setProgressType:ProgressLabelCircle];
            [percentText setColorTable: @{
                                          NSStringFromProgressLabelColorTableKey(ProgressLabelTrackColor):vbGray,
                                          NSStringFromProgressLabelColorTableKey(ProgressLabelProgressColor):colorArray[i]
                                          }];
            [self addSubview:percentText];
            
            UILabel *subText = [[UILabel alloc] initWithFrame:CGRectMake(indent-10, CGRectGetMaxY(percentText.frame), 40+10, 20)];
            subText.text = subTextArray[i];
            subText.textAlignment = NSTextAlignmentCenter;
            subText.textColor = vbGray;
            subText.numberOfLines = 2;
            subText.font = [UIFont fontWithName:@"Uninsta-Normal" size:12];
            subText.contentMode = UIViewContentModeTop;
            [self addSubview:subText];
            
            indent += (self.frame.size.width-margin)/percentArray.count;
        }
    }
    return self;
}

-(void)animateFill
{
    for (int i = 0; i < percentArray.count; i++) {
        KAProgressLabel* labelText = (KAProgressLabel *)[self viewWithTag:i+1];
        [labelText setProgress:[percentArray[i] floatValue]/100
                        timing:TPPropertyAnimationTimingEaseOut
                      duration:1.0
                         delay:0.0];
        
        KAProgressLabel* labelField = (KAProgressLabel *)[self viewWithTag:i+10];
        [labelField setProgress:[percentArray[i] floatValue]/100
                         timing:TPPropertyAnimationTimingEaseOut
                       duration:1.0
                          delay:0.0];
    }
}

@end
