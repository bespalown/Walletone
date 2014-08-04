//
//  ConversionView.m
//  Walletone
//
//  Created by Viktor Bespalov on 04/08/14.
//  Copyright (c) 2014 Viktor Bespalov. All rights reserved.
//

#import "ConversionView.h"

@implementation ConversionView
{
    NSArray* percentArray;
}


-(id)initWithFrame:(CGRect)frame dataArray:(NSArray *)dataArray
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor lightGrayColor];
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
        title.textColor = [UIColor grayColor];
        title.font = [UIFont fontWithName:@"Uninsta-Normal" size:14];
        [self addSubview:title];

        
        CGFloat margin; //отступ справа/слева = 20
        CGFloat indent = margin = 20;
        for (int i=0; i<4; i++) {
            KAProgressLabel *percentText = [[KAProgressLabel alloc] initWithFrame:CGRectMake(indent, 40, 60, 20)];
            percentText.text = [NSString stringWithFormat:@"%@%%",percentArray[i]];
            percentText.textAlignment = NSTextAlignmentCenter;
            percentText.textColor = colorArray[i];
            percentText.numberOfLines = 2;
            percentText.font = [UIFont fontWithName:@"Uninsta-Normal" size:14];
            percentText.contentMode = UIViewContentModeTop;
            percentText.delegate = self;
            [percentText setBorderWidth:3];
            [percentText setStartDegree:0.0];
            [percentText setEndDegree:0.3];
            [percentText setProgressColor:colorArray[i]];
            [percentText setTrackColor:[UIColor grayColor]];
            [percentText setTag:i+1];
            [self addSubview:percentText];
            
            UILabel *subText = [[UILabel alloc] initWithFrame:CGRectMake(indent-5, CGRectGetMaxY(percentText.frame), 60+5, 40)];
            subText.text = subTextArray[i];
            subText.textAlignment = NSTextAlignmentCenter;
            subText.textColor = [UIColor grayColor];
            subText.numberOfLines = 2;
            subText.font = [UIFont fontWithName:@"Uninsta-Normal" size:12];
            subText.contentMode = UIViewContentModeTop;
            [self addSubview:subText];
            
            indent += (self.frame.size.width-margin)/4;
        }
    }
    return self;
}

-(void)animateFill
{
    for (int i = 0; i < 4; i++) {
        KAProgressLabel* label = (KAProgressLabel *)[self viewWithTag:i+1];
        [label setProgress:[percentArray[i] floatValue]/100
             withAnimation:TPPropertyAnimationTimingEaseInEaseOut
                  duration:1.0
                afterDelay:0.0];
    }
}

- (void) progressLabel:(KAProgressLabel *) label progressChanged:(CGFloat)progress
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [label setText:[NSString stringWithFormat:@"%.0f%%", (progress*100)]];
    });
}

@end
