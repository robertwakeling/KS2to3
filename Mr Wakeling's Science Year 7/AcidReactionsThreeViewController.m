//
//  AcidReactionsThreeViewController.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 10/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AcidReactionsThreeViewController.h"

@interface AcidReactionsThreeViewController ()

@end

@implementation AcidReactionsThreeViewController
@synthesize titleLabel;
@synthesize questionLabel;
@synthesize answer;

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
    
    titleLabel.hidden = NO;
    questionLabel.hidden = YES;
    answer.hidden = YES;
}

-(void)testYourself:(id)sender
{
    if (titleLabel.hidden = NO) {
        titleLabel.hidden = YES;
    }
    else {
    titleLabel.hidden = YES;
        questionLabel.hidden = NO;
        answer.hidden = NO;
}
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if ([answer.text isEqualToString:@"chemical reaction"]) {
        UIAlertView *theAlert = [[UIAlertView alloc] initWithTitle:@"Congratulations!" message:@"You now know that metals and acids react!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [theAlert show];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return NO;
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{

        Tester *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"Overall1"];
        [self.navigationController pushViewController:detail animated:YES];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"AcidReactions3" object:self];
}

- (void)viewDidUnload
{
    [self setTitleLabel:nil];
    [self setQuestionLabel:nil];
    [self setAnswer:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
