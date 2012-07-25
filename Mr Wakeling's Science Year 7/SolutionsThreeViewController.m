//
//  SolutionsThreeViewController.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 21/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SolutionsThreeViewController.h"

@interface SolutionsThreeViewController ()

@end

@implementation SolutionsThreeViewController
@synthesize drawImage;
@synthesize scoreLabel;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    mouseSwiped = NO;
    UITouch *touch = [touches anyObject];
    
    if ([touch tapCount] == 2) {
        drawImage.image = nil;
        theScore = 0;
        scoreLabel.text = nil;
        
        return;
    }
    
    
    lastPoint = [touch locationInView:self.view];
   // lastPoint.y -= 20;
   // NSLog(@"%.1f, %.1f", lastPoint.x, lastPoint.y);
    
  //  NSLog(@"%f & %f", lastPoint.x, lastPoint.y);
        
    CGRect firstRect = CGRectMake(20, 150, 200, 100);
    if ((CGRectContainsPoint(firstRect, lastPoint)) && (a == 0) && (!first))
    {
        first = YES; 
        
        second = NO;
        third = NO;
        fourth = NO;
        fifth = NO;
       
    } 
//    else {
//        first = NO;
//    }
        
    CGRect secondRect = CGRectMake(20, 300, 200, 100);
    if ((CGRectContainsPoint(secondRect, lastPoint)) && (b == 0) && (!second))
    {
        
        second = YES;
        first = NO;
        
        third = NO;
        fourth = NO;
        fifth = NO;
    }
//    else {
//        second = NO;
//    }
    
    CGRect thirdRect = CGRectMake(20, 450, 200, 100);
    if ((CGRectContainsPoint(thirdRect, lastPoint)) && (c == 0) && (!third))
    {
        
        third = YES;
        first = NO;
        second = NO;
        
        fourth = NO;
        fifth = NO;
    } 
//    else {
//        third = NO;
//    }
    
    CGRect fourthRect = CGRectMake(20, 600, 200, 100);
    if ((CGRectContainsPoint(fourthRect, lastPoint)) && (d == 0) && (!fourth))
    {
        
        fourth = YES;
        first = NO;
        second = NO;
        third = NO;
       
        fifth = NO;
    } 
 //   else {
//        fourth = NO;
//    }
    
    CGRect fifthRect = CGRectMake(20, 750, 200, 100);
    if ((CGRectContainsPoint(fifthRect, lastPoint)) && (e == 0) && (!fifth))
    {
        
        fifth = YES;
        first = NO;
        second = NO;
        third = NO;
        fourth = NO;
        
    } 
//    else {
//        fifth = NO;
//    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    mouseSwiped = YES;
    
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self.view];
   // currentPoint.y -= 20;
    
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [drawImage.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 5.0);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 1.0, 0.0, 0.0, 1.0);
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    drawImage.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    lastPoint = currentPoint;
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    
    if ([touch tapCount] == 2) {
        drawImage.image = nil;
        a = 0, b = 0, c = 0, d = 0, e = 0;
        scoreLabel.text = nil;
        return;
    }
    
    
    if(!mouseSwiped) {
        UIGraphicsBeginImageContext(self.view.frame.size);
        [drawImage.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 5.0);
        CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 1.0, 0.0, 0.0, 1.0);
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
        CGContextStrokePath(UIGraphicsGetCurrentContext());
        CGContextFlush(UIGraphicsGetCurrentContext());
        drawImage.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
//    NSMutableArray *temp = [[NSMutableArray alloc] init];
//    [temp addObject:[NSNumber numberWithBool:first]];
//    [temp addObject:[NSNumber numberWithBool:second]];
//    [temp addObject:[NSNumber numberWithBool:third]];
//    [temp addObject:[NSNumber numberWithBool:fourth]];
//    [temp addObject:[NSNumber numberWithBool:fifth]];
//    
//    
 //   NSLog(@"Finished %f & %f", lastPoint.x, lastPoint.y);
    CGRect firstRect = CGRectMake(500, 300, 200, 100);
    if ((CGRectContainsPoint(firstRect, lastPoint)) && (a == 0) && (first))
    {
        a = 1;
        first = NO;
        second = NO;
        third = NO;
        fourth = NO;
        fifth = NO;
    
    }
    if (!(CGRectContainsPoint(firstRect, lastPoint)) && (a == 0) && (first))
    {
        [self clearing];
    }
    
    CGRect secondRect = CGRectMake(500, 600, 200, 100);
    if ((CGRectContainsPoint(secondRect, lastPoint)) && (b == 0) &&(second))
    {
        b = 1;
        first = NO;
        second = NO;
        third = NO;
        fourth = NO;
        fifth = NO;
    }  
    if (!(CGRectContainsPoint(secondRect, lastPoint)) && (b == 0) && (second))
    {
        [self clearing];
    }
    CGRect thirdRect = CGRectMake(500, 150, 200, 100);
    if ((CGRectContainsPoint(thirdRect, lastPoint)) && (c == 0) && (third))
    {
        c = 1;
        first = NO;
        second = NO;
        third = NO;
        fourth = NO;
        fifth = NO;
    } 
    if (!(CGRectContainsPoint(thirdRect, lastPoint)) && (c == 0) && (third))
    {
        [self clearing];
    }
    
    CGRect fourthRect = CGRectMake(500, 750, 200, 100);
    if ((CGRectContainsPoint(fourthRect, lastPoint)) && (d == 0) && (fourth))
    {
        d = 1;
        first = NO;
        second = NO;
        third = NO;
        fourth = NO;
        fifth = NO;
    } 
    if (!(CGRectContainsPoint(fourthRect, lastPoint)) && (d == 0) && (fourth))
    {
        [self clearing];
    }
    CGRect fifthRect = CGRectMake(500, 450, 200, 100);
    if ((CGRectContainsPoint(fifthRect, lastPoint)) && (e == 0) && (fifth))
    {
        e = 1;
        first = NO;
        second = NO;
        third = NO;
        fourth = NO;
        fifth = NO;
    } 
    if (!(CGRectContainsPoint(fifthRect, lastPoint)) && (e == 0) && (fifth))
    {
        [self clearing];
    }

    theScore = a + b + c + d + e;
    scoreLabel.text = [NSString stringWithFormat:@"%i/5", theScore];
    scoreLabel.font = [UIFont fontWithName:@"Chalkduster" size:20];
    if (theScore <=2) {
        scoreLabel.textColor = [UIColor redColor];
    }
    if (theScore <=4) {
        scoreLabel.textColor = [UIColor orangeColor];
    }
    if (theScore == 5)
    {
        scoreLabel.textColor = [UIColor greenColor];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Congratulations!" message:@"You know the meanings of all those words!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    
}

-(void)clearing
{
    UIAlertView *theAlert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"These need a bit more practice!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [theAlert show];
    drawImage.image = nil;
    a = 0, b = 0, c = 0, d = 0, e = 0;
    scoreLabel.text = nil;
    first = NO;
    second = NO;
    third = NO;
    fourth = NO;
    fifth = NO;

}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    Tester *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"Overall1"];
    [self.navigationController pushViewController:detail animated:YES];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Solutions3" object:self];
}

- (void)viewDidUnload
{

    [self setScoreLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
