//
//  SeriesParallelThreeViewController.h
//  Mr Wakeling's Science Year 7
//
//  Created by Robert Wakeling on 29/07/2012.
//
//

#import <UIKit/UIKit.h>
#import "Tester.h"

@interface SeriesParallelThreeViewController : UIViewController <UIAlertViewDelegate>
{
    NSDictionary *model;
    NSArray *keys;
    
    int i;
    NSString *currenti;
    NSString *temp;
    
    int theScore;
    
}

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UIButton *series;
@property (weak, nonatomic) IBOutlet UIButton *parallel;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end
