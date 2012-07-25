//
//  Blagged.h
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 16/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIGestureRecognizerSubclass.h>


typedef enum {
    CheckmarkFirstStrokeDown,
    CheckmarkSecondStrokeUp
} CheckmarkGestureState;


@interface CheckmarkGestureRecognizer : UIGestureRecognizer {
    
    CheckmarkGestureState _checkmarkState;
    CGPoint _turnPoint;
    CGPoint _startPoint;
    
}

- (void)resetCheckmark;

- (void)reset;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event;


@end
