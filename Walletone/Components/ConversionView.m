//
//  ConversionView.m
//  Walletone
//
//  Created by Viktor Bespalov on 04/08/14.
//  Copyright (c) 2014 Viktor Bespalov. All rights reserved.
//

#import "ConversionView.h"
#import "KAProgressLabel.h"

@implementation ConversionView
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
                               vbRed,
                               vbBlue,
                               vbOrange,
                               vbGreen,
                               nil];
        
        NSArray* subTextArray = @[@"Всего",@"Банковские карты",@"Терминалы",@"Салоны связи"];
        
        UILabel* title = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, CGRectGetWidth(self.frame), 20)];
        title.text = @"Конверсия по способам оплаты";
        title.textAlignment = NSTextAlignmentCenter;
        title.textColor = vbGray;
        title.font = [UIFont fontWithName:@"Uninsta-Normal" size:14];
        [self addSubview:title];

        
        CGFloat margin; //отступ справа/слева = 20
        CGFloat indent = margin = 20;
        for (int i=0; i<percentArray.count; i++) {
            KAProgressLabel *percentText = [[KAProgressLabel alloc] initWithFrame:CGRectMake(indent, 40, 60, 60)];
            percentText.text = [NSString stringWithFormat:@"0%%"];
            percentText.textAlignment = NSTextAlignmentCenter;
            percentText.textColor = colorArray[i];
            percentText.numberOfLines = 2;
            percentText.font = [UIFont fontWithName:@"Uninsta-Normal" size:14];
            percentText.contentMode = UIViewContentModeTop;
            [percentText setStartDegree:0.0];
            [percentText setEndDegree:0.3];
            [percentText setTag:i+1];
            percentText.progressLabelVCBlock = ^(KAProgressLabel *label, CGFloat progress) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [label setText:[NSString stringWithFormat:@"%.0f%%", (progress*100)]];
                });
            };
            [percentText setBackBorderWidth: 2.0];
            [percentText setFrontBorderWidth: 2.0];
            [percentText setColorTable: @{
                                          NSStringFromProgressLabelColorTableKey(ProgressLabelTrackColor):vbGray,
                                          NSStringFromProgressLabelColorTableKey(ProgressLabelProgressColor):colorArray[i]
                                          }];
            [self addSubview:percentText];
            
            UILabel *subText = [[UILabel alloc] initWithFrame:CGRectMake(indent-5, CGRectGetMaxY(percentText.frame), 60+5, 40)];
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
        KAProgressLabel* label = (KAProgressLabel *)[self viewWithTag:i+1];
        [label setProgress:[percentArray[i] floatValue]/100
                          timing:TPPropertyAnimationTimingEaseOut
                        duration:1.0
                           delay:0.0];
    }
}

@end
