//
//  toolsSalesView.h
//  Walletone
//
//  Created by Viktor Bespalov on 04/08/14.
//  Copyright (c) 2014 Viktor Bespalov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToolsSalesView : UIView

//dataArray float value
-(id)initWithFrame:(CGRect)frame dataArray:(NSArray *)dataArray;
-(void)animateFill;

@end
