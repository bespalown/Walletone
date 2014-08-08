//
//  VBGraphView.h
//  Walletone
//
//  Created by Viktor Bespalov on 08/08/14.
//  Copyright (c) 2014 Viktor Bespalov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BEMSimpleLineGraphView.h"

@interface VBGraphView : UIView <BEMAnimationDelegate, BEMSimpleLineGraphDelegate>
{
    int previousStepperValue;
    int totalNumber;
    BEMSimpleLineGraphView *greenGraph;
    BEMSimpleLineGraphView *blueGraph;
}

@property (strong, nonatomic) NSMutableArray *arrayOfValuesBlue;
@property (strong, nonatomic) NSMutableArray *arrayOfValuesGreen;
@property (strong, nonatomic) NSMutableArray *arrayOfDates;

@end
