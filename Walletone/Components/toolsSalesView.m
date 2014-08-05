//
//  toolsSalesView.m
//  Walletone
//
//  Created by Viktor Bespalov on 04/08/14.
//  Copyright (c) 2014 Viktor Bespalov. All rights reserved.
//

#import "ToolsSalesView.h"
#import "KAProgressLabel.h"

@implementation ToolsSalesView
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
                               nil];
        
        NSArray* imageArray = [NSArray arrayWithObjects:[UIImage imageNamed:@"imageBlue"],
                               [UIImage imageNamed:@"imageLilac"],
                               [UIImage imageNamed:@"imageOrange"],
                               [UIImage imageNamed:@"imageGreen"],nil];
        
        NSArray* subTextArray = @[@"Банковские карты",@"Терминалы",@"Со счета мобильного",@"Салоны связи"];
        
        UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), 1)];
        view.backgroundColor = vbGray;
        [self addSubview:view];
        
        UILabel* title = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, CGRectGetWidth(self.frame), 20)];
        title.text = @"Инструменты продаж";
        title.textAlignment = NSTextAlignmentCenter;
        title.textColor = vbGray;
        title.font = [UIFont fontWithName:@"Uninsta-Normal" size:14];
        [self addSubview:title];
        
        CGFloat margin; //отступ справа/слева = 20
        CGFloat indent = margin = 20;
        for (int i=0; i<percentArray.count; i++) {
            UIImageView* logo = [[UIImageView alloc] initWithImage:imageArray[i]];
            logo.frame = CGRectMake(indent, 40, 50, 50);
            logo.layer.cornerRadius = 25;
            logo.layer.borderColor = vbGray.CGColor;
            logo.layer.borderWidth = 0;
            logo.layer.masksToBounds = YES;
            [self addSubview:logo];
            
            KAProgressLabel *percentText = [[KAProgressLabel alloc] initWithFrame:CGRectMake(indent, CGRectGetMaxY(logo.frame)-15, 60, 60)];
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
            [percentText setColorTable: @{
                                          NSStringFromProgressLabelColorTableKey(ProgressLabelTrackColor):vbGray,
                                          NSStringFromProgressLabelColorTableKey(ProgressLabelProgressColor):colorArray[i]
                                          }];
            [self addSubview:percentText];
            
            UILabel *subText = [[UILabel alloc] initWithFrame:CGRectMake(indent-5, CGRectGetMaxY(percentText.frame)-25, 60+5, 40)];
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
