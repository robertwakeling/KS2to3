//
//  DefaultLabel.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 25/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DefaultLabel.h"

@implementation DefaultLabel

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.font = [UIFont fontWithName:@"Chalkduster" size:18];
        self.textAlignment = UITextAlignmentCenter;
        self.numberOfLines = 0;
        self.lineBreakMode = UILineBreakModeWordWrap;
        
        float redColour = arc4random() % 255/255.0f;
        float greenColour = arc4random() % 255/255.0f;
        float blueColour = arc4random() % 255/255.0f;
        
        self.textColor = [UIColor colorWithRed:redColour green:greenColour blue:blueColour alpha:1];
    }
    return self;
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
