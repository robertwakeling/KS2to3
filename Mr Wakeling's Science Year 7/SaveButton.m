//
//  SaveButton.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 25/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SaveButton.h"

@implementation SaveButton


- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        
         self.titleLabel.font = [UIFont fontWithName:@"Chalkduster" size:16];
        self.titleLabel.lineBreakMode = UILineBreakModeWordWrap;
        
       // self.titleLabel.textColor = [UIColor greenColor];
        [self setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    }
    return self;
}


//- (id)initWithFrame:(CGRect)frame{
//    self = [super initWithFrame:frame];
//    if (self) {
//        // Initialization code
//        
//        UIButton *theButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//        theButton.frame = frame;
//        // [self changeTheButtonType];
//        [self addSubview:theButton];
//        self.titleLabel.font = [UIFont fontWithName:@"Chalkduster" size:16];
//        self.titleLabel.lineBreakMode = UILineBreakModeWordWrap;
//        
//        self.titleLabel.textColor = [UIColor greenColor];
//        
//    }
//    return self;
//}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
