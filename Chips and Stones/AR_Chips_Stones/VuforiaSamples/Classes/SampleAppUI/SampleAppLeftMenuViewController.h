

#import <UIKit/UIKit.h>

@class SampleAppSlidingMenuController;

@interface SampleAppLeftMenuViewController : UIViewController
{
    id observer;
}

@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, assign) SampleAppSlidingMenuController *slidingMenuViewController;

- (void) updateMenu;

@end