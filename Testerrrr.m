//
//  Testerrrr.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 24/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Testerrrr.h"

@implementation Testerrrr

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 2.0);
    
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    
    CGRect first = CGRectMake(20, 150, 200, 100);
    CGRect second = CGRectMake(20, 300, 200, 100);
    CGRect third = CGRectMake(20, 450, 200, 100);
    CGRect fourth = CGRectMake(20, 600, 200, 100);
    CGRect fifth = CGRectMake(20, 750, 200, 100);
    
    CGRect Afirst = CGRectMake(500, 150, 200, 100);
    CGRect Asecond = CGRectMake(500, 300, 200, 100);
    CGRect Athird = CGRectMake(500, 450, 200, 100);
    CGRect Afourth = CGRectMake(500, 600, 200, 100);
    CGRect Afifth = CGRectMake(500, 750, 200, 100);

    CGContextAddRect(context, first);
    CGContextAddRect(context, second);
    CGContextAddRect(context, third);
    CGContextAddRect(context, fourth);
    CGContextAddRect(context, fifth);
    
    CGContextAddRect(context, Afirst);
    CGContextAddRect(context, Asecond);
    CGContextAddRect(context, Athird);
    CGContextAddRect(context, Afourth);
    CGContextAddRect(context, Afifth);

    CGContextStrokePath(context);
    
}


@end
