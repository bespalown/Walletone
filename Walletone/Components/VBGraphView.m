//
//  VBGraphView.m
//  Walletone
//
//  Created by Viktor Bespalov on 08/08/14.
//  Copyright (c) 2014 Viktor Bespalov. All rights reserved.
//

#import "VBGraphView.h"

@implementation VBGraphView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel* title = [[UILabel alloc] initWithFrame:CGRectMake(0, 15, CGRectGetWidth(self.frame), 15)];
        title.text = @"Графики продаж";
        title.textAlignment = NSTextAlignmentCenter;
        title.textColor = vbGray;
        title.font = [UIFont fontWithName:@"Uninsta-Normal" size:16];
        [self addSubview:title];
        
        _arrayOfValuesGreen = [[NSMutableArray alloc] init];
        _arrayOfValuesBlue = [[NSMutableArray alloc] init];
        _arrayOfDates = [[NSMutableArray alloc] initWithObjects:
                         @"",
                         @"4 АПР",
                         @"8",
                         @"12",
                         @"16",
                         @"20",
                         @"24",
                         @"28",
                         @"2 МАЯ",
                         @"6",
                         @"10",
                         @"",
                         nil];

        for (int i = 0; i < _arrayOfDates.count; i++) {
            [_arrayOfValuesGreen addObject:[NSNumber numberWithInteger:(arc4random() % 70000)]]; // Random values for the graph
            [_arrayOfValuesBlue addObject:[NSNumber numberWithInteger: (arc4random() % 70000)]]; // Random values for the graph
        }

        greenGraph = [[BEMSimpleLineGraphView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(title.frame)+18, CGRectGetWidth(self.frame), 100)];
        greenGraph.delegate = self;
        greenGraph.colorTop = [UIColor clearColor];
        greenGraph.colorBottom = vbGreenAlpha; // Leaving this not-set on iOS 7 will default to your window's tintColor
        greenGraph.colorLine = vbGreen;
        greenGraph.colorXaxisLabel = vbGreen;
        greenGraph.widthLine = 1.0;
        //greenGraph.enableTouchReport = YES;
        //greenGraph.enablePopUpReport = YES;
        greenGraph.enableBezierCurve = YES;
        greenGraph.sizePoint = 1;
        greenGraph.colorXaxisLabel = [UIColor clearColor];
        greenGraph.labelFont = [UIFont fontWithName:@"Uninsta-Normal" size:16];
        [self addSubview:greenGraph];
        
        blueGraph = [[BEMSimpleLineGraphView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(title.frame)+18, CGRectGetWidth(self.frame), 100)];
        blueGraph.delegate = self;
        blueGraph.colorTop = [UIColor clearColor];
        blueGraph.colorBottom = vbBlueAlpha; // Leaving this not-set on iOS 7 will default to your window's tintColor
        blueGraph.colorLine = vbBlue;
        blueGraph.colorXaxisLabel = vbBlue;
        blueGraph.widthLine = 1.0;
        //blueGraph.enableTouchReport = YES;
        //blueGraph.enablePopUpReport = YES;
        blueGraph.enableBezierCurve = YES;
        blueGraph.sizePoint = 1;
        blueGraph.colorXaxisLabel = vbBackground;
        blueGraph.labelFont = [UIFont fontWithName:@"Uninsta-Normal" size:10];
        [self addSubview:blueGraph];
        
        
        float xmax = -MAXFLOAT;
        float xmin = MAXFLOAT;
        for (NSNumber *num in _arrayOfValuesGreen) {
            float x = num.floatValue;
            if (x < xmin) xmin = x;
            if (x > xmax) xmax = x;
        }
        
        NSUInteger indexXmax = [_arrayOfValuesGreen indexOfObject:[NSNumber numberWithInteger:xmax]];
        CGFloat positionX = (CGFloat)CGRectGetWidth(self.frame)/_arrayOfValuesGreen.count;

        
        CGFloat weightLabel = 80;
        if ((positionX*(indexXmax+1) - weightLabel/2) < 0) {
            positionX = 5;
        } else if ((positionX*(indexXmax+1) - weightLabel/2) > CGRectGetWidth(self.frame)-weightLabel/2 - 10)
        {
            positionX = CGRectGetWidth(self.frame)-weightLabel/2 -10;
        }
        
        UILabel* maxGreenValueLabel = [[UILabel alloc] initWithFrame:
                                       CGRectMake(positionX, CGRectGetMaxY(title.frame)+10, weightLabel, 15)];
        maxGreenValueLabel.text = [NSString stringWithFormat:@"%d Р",[[_arrayOfValuesGreen objectAtIndex:indexXmax] integerValue]];
        maxGreenValueLabel.textAlignment = NSTextAlignmentLeft;
        maxGreenValueLabel.textColor = vbGreen;
        maxGreenValueLabel.font = [UIFont fontWithName:@"Uninsta-Normal" size:14];
        [self addSubview:maxGreenValueLabel];
    }
    return self;
}



#pragma mark - SimpleLineGraph Data Source

- (NSInteger)numberOfPointsInLineGraph:(BEMSimpleLineGraphView *)graph {
    return [_arrayOfDates count];
}

- (CGFloat)lineGraph:(BEMSimpleLineGraphView *)graph valueForPointAtIndex:(NSInteger)index {
    if (graph == greenGraph) {
        return [[_arrayOfValuesGreen objectAtIndex:index] floatValue];
    }
    else
        return [[_arrayOfValuesBlue objectAtIndex:index] floatValue];
}

#pragma mark - SimpleLineGraph Delegate

- (NSInteger)numberOfGapsBetweenLabelsOnLineGraph:(BEMSimpleLineGraphView *)graph {
    return 0;
}

- (NSString *)lineGraph:(BEMSimpleLineGraphView *)graph labelOnXAxisForIndex:(NSInteger)index {
    
    return [_arrayOfDates objectAtIndex:index];
}

- (void)lineGraph:(BEMSimpleLineGraphView *)graph didTouchGraphWithClosestIndex:(NSInteger)index {
    //self.labelValues.text = [NSString stringWithFormat:@"%@", [self.ArrayOfValues objectAtIndex:index]];
    //self.labelDates.text = [NSString stringWithFormat:@"in %@", [self.ArrayOfDates objectAtIndex:index]];
}

- (void)lineGraph:(BEMSimpleLineGraphView *)graph didReleaseTouchFromGraphWithClosestIndex:(CGFloat)index {
    /*
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.labelValues.alpha = 0.0;
        self.labelDates.alpha = 0.0;
    } completion:^(BOOL finished){
        
        self.labelValues.text = [NSString stringWithFormat:@"%i", [[self.myGraph calculatePointValueSum] intValue]];
        self.labelDates.text = [NSString stringWithFormat:@"between 2000 and %@", [self.ArrayOfDates lastObject]];
        
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            self.labelValues.alpha = 1.0;
            self.labelDates.alpha = 1.0;
        } completion:nil];
    }];
     */
}

- (void)lineGraphDidFinishLoading:(BEMSimpleLineGraphView *)graph {
    //self.labelValues.text = [NSString stringWithFormat:@"%i", [[self.myGraph calculatePointValueSum] intValue]];
    //self.labelDates.text = [NSString stringWithFormat:@"between 2000 and %@", [self.ArrayOfDates lastObject]];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
