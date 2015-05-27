

#import <UIKit/UIKit.h>

@class SampleAppLeftMenuViewController;

@interface SampleAppSlidingMenuController : UIViewController <UIGestureRecognizerDelegate>
{
    UITapGestureRecognizer * tapGestureRecognizer;
    UIPanGestureRecognizer * panGestureRecognizer;
    CGFloat kSlidingMenuWidth;
    
    BOOL ignoreDoubleTap;
    BOOL showingLeftMenu;
}

- (id)initWithRootViewController:(UIViewController *)controller;

- (void)showRootController:(BOOL)animated;

- (void)shouldIgnoreDoubleTap;

- (void)showLeftMenu:(BOOL)animated;

- (void)dismiss;

@end

