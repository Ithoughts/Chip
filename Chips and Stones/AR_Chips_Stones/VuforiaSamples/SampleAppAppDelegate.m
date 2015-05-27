
#import "SampleAppAppDelegate.h"
//#import "SampleAppSelectorViewController.h"

#import "TextRecoViewController.h"

@implementation SampleAppAppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
//  SampleAppSelectorViewController * vc = [[[SampleAppSelectorViewController alloc] initWithNibName:@"SampleAppSelectorViewController" bundle:nil] autorelease];
    
    TextRecoViewController * vc = [[[TextRecoViewController alloc] initWithNibName:@"TextRecoViewController" bundle:nil] autorelease];

    UINavigationController * nc = [[UINavigationController alloc] initWithRootViewController: vc];

    nc.navigationBar.barStyle = UIBarStyleDefault;
    
    self.window.rootViewController = nc;
    
    [self.window makeKeyAndVisible];
    
    [nc release];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    if (self.glResourceHandler) {
        
        // Delete OpenGL resources (e.g. framebuffer) of the  AR View
        [self.glResourceHandler finishOpenGLESCommands];
        [self.glResourceHandler freeOpenGLESResources];
    }
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
   
}

@end
