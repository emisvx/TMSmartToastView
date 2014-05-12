//
//  TMSmartToastView.m
//  TMSmartToastView
//
//  Created by Thiago Magalhães on 12/05/14.
//  Copyright (c) 2014 7Links. All rights reserved.
//

#import "TMSmartToastView.h"

@implementation TMSmartToastView

- (TMSmartToastView *) initWithText : (NSString *) text
                            position: (TMSmartToastViewPosition) position
{
    
    self.defaultXib = @"TMDefaultToastView";
    
    self = [[[NSBundle mainBundle] loadNibNamed:self.defaultXib owner:self options:nil] objectAtIndex:0];
    
    if(position) {
        
        self.position = position;
        
    } else {
        
        self.position = TMSmartToastViewPositionCenter;
    }
    
    for (UIView * subview in [self subviews]) {
        switch (subview.tag) {
            case 1:
                self.messageLabel = (UILabel *) subview;
                break;
            default:
                break;
        }
    }
    
    if (self.messageLabel) {
        
        self.messageLabel.text = text;
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-20-[messageLabel]-20-|" options:0 metrics:nil views:@{@"messageLabel":self.messageLabel}]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[messageLabel]|" options:0 metrics:nil views:@{@"messageLabel":self.messageLabel}]];
    }
    
    
    self.alpha = 0.0;
    
    self.duration = 1.5;
    
    return self;
}

- (TMSmartToastView *) initWithText : (NSString *) text
                            position: (TMSmartToastViewPosition) position
                            duration: (NSTimeInterval) duration
{
    self.defaultXib = @"DefaultToast";
    
    self = [[[NSBundle mainBundle] loadNibNamed:self.defaultXib owner:self options:nil] objectAtIndex:0];
    
    if(position) {
        
        self.position = position;
        
    } else {
        
        self.position = TMSmartToastViewPositionCenter;
    }
    
    for (UIView * subview in [self subviews]) {
        switch (subview.tag) {
            case 1:
                self.messageLabel = (UILabel *) subview;
                break;
            default:
                break;
        }
    }
    
    if (self.messageLabel) {
        self.messageLabel.text = text;
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-20-[messageLabel]-20-|" options:0 metrics:nil views:@{@"messageLabel":self.messageLabel}]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[messageLabel]|" options:0 metrics:nil views:@{@"messageLabel":self.messageLabel}]];
    }
    
    
    
    self.alpha = 0.0;
    
    if(duration) {
        
        self.duration = duration;
        
    } else {
        
        self.duration = 1.5;
        
    }
    
    return self;
    
}

- (TMSmartToastView *) initWithText : (NSString *) text
                              center: (CGPoint) center
                            duration: (NSTimeInterval) duration
{
    self.defaultXib = @"DefaultToast";
    
    self = [[[NSBundle mainBundle] loadNibNamed:self.defaultXib owner:self options:nil] objectAtIndex:0];
    
    self.center = center;
    
    for (UIView * subview in [self subviews]) {
        switch (subview.tag) {
            case 1:
                self.messageLabel = (UILabel *) subview;
                break;
            default:
                break;
        }
    }
    
    if (self.messageLabel) {
        self.messageLabel.text = text;
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-20-[messageLabel]-20-|" options:0 metrics:nil views:@{@"messageLabel":self.messageLabel}]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[messageLabel]|" options:0 metrics:nil views:@{@"messageLabel":self.messageLabel}]];
    }
    
    self.alpha = 0.0;
    
    if(duration) {
        
        self.duration = duration;
        
    } else {
        
        self.duration = 1.5;
        
    }
    
    return self;
}

- (void) show
{
    if(!self.superview){
        UIWindow * keyWindow = [[UIApplication sharedApplication] keyWindow];
        
        if(self.position) {
            
            switch (self.position) {
                case TMSmartToastViewPositionTop:
                    self.center = CGPointMake(keyWindow.center.x, 74);
                    break;
                case TMSmartToastViewPositionCenter:
                    self.center = keyWindow.center;
                    break;
                case TMSmartToastViewPositionBottom:
                    self.center = CGPointMake(keyWindow.center.x, keyWindow.frame.size.height - 74);
                    break;
                default:
                    break;
            }
            
        }
        
        [keyWindow addSubview:self];
        
        self.transform = CGAffineTransformMakeScale(0.01, 0.01);
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            self.transform = CGAffineTransformIdentity;
            self.alpha = 1.0;
        } completion:^(BOOL finished){
            [self performSelector:@selector(dismiss) withObject:self afterDelay:self.duration];
        }];
        
    }
}

- (void) dismiss
{
    self.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.transform = CGAffineTransformMakeScale(0.01, 0.01);
        self.alpha = 0.0;
    } completion:^(BOOL finished){
        [self removeFromSuperview];
    }];
}

@end
