
#import <UIKit/UIKit.h>
#import "SampleGLResourceHandler.h"

@interface SampleAppAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (assign, nonatomic) id <SampleGLResourceHandler> glResourceHandler;

@end
