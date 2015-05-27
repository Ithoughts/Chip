

#import "SampleAppSelectorViewController.h"
#import "SampleAppAboutViewController.h"
#import "SampleAppMenu.h"


/****************************************    model   ***************************************/

@interface SampleApplicationInfo : NSObject

@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * aboutPageName;
@property (nonatomic, copy) NSString * viewControllerClassName;

@end

@implementation SampleApplicationInfo


@end

/*********************************************************************************************/




/****************************   SampleAppSelectorViewController  ***********************/

@interface SampleAppSelectorViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (retain) NSMutableArray * sampleApplications;

@end

@implementation SampleAppSelectorViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.title = @"Augmented Reality";
        self.sampleApplications = [[NSMutableArray alloc] init];
        
        [self addApplication:@"Image Targets" viewControllerClassName:@"ImageTargetsViewController" aboutPageName:@"IT_about"];
        [self addApplication:@"Cylinder Targets" viewControllerClassName:@"CylinderTargetsViewController" aboutPageName:@"CY_about"];
        [self addApplication:@"Multi Targets" viewControllerClassName:@"MultiTargetsViewController" aboutPageName:@"MT_about"];
        [self addApplication:@"User Defined Targets" viewControllerClassName:@"UserDefinedTargetsViewController" aboutPageName:@"UD_about"];
        [self addApplication:@"Object Reco" viewControllerClassName:@"ObjectRecoViewController" aboutPageName:@"OR_about"];
        [self addApplication:@"Cloud Reco" viewControllerClassName:@"CloudRecoViewController" aboutPageName:@"CR_about"];
        [self addApplication:@"Text Reco" viewControllerClassName:@"TextRecoViewController" aboutPageName:@"TR_about"];
        [self addApplication:@"Frame Markers" viewControllerClassName:@"FrameMarkersViewController" aboutPageName:@"FM_about"];
        [self addApplication:@"Virtual Buttons" viewControllerClassName:@"VirtualButtonsViewController" aboutPageName:@"VB_about"];
    }
    
    return self;
}

/*************************** custom definition method  ************************/

- (void) addApplication:(NSString *)title viewControllerClassName:(NSString *)viewControllerClassName aboutPageName:(NSString *)aboutPageName
{
    SampleApplicationInfo * app = [[[SampleApplicationInfo alloc] init] autorelease];
    
    app.title = title;
    app.viewControllerClassName = viewControllerClassName;
    app.aboutPageName = aboutPageName;
    
    // 将 model 添加到 array
    [self.sampleApplications addObject:app];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    SampleApplicationInfo * application = [self.sampleApplications objectAtIndex:indexPath.row];
    
    if (application.viewControllerClassName != nil) {
        
        // change the back button
        self.navigationItem.backBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"Back"
                                                                                  style: UIBarButtonItemStyleBordered
                                                                                 target:nil
                                                                                 action:nil] autorelease];
        [[SampleAppMenu instance] clear];
        
        SampleAppAboutViewController * vc = [[[SampleAppAboutViewController alloc] initWithNibName:@"SampleAppAboutViewController"
                                                                                            bundle:nil] autorelease];
        vc.appTitle = application.title;
        vc.appAboutPageName = application.aboutPageName;
        vc.appViewControllerClassName = application.viewControllerClassName;
        
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark - UITableViewDataSource Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.sampleApplications count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"SampleAppSelectorViewControllerCell";

    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier: cellIdentifier];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier] autorelease];
    }
    
    SampleApplicationInfo * application = [self.sampleApplications objectAtIndex: indexPath.row];
    
    cell.textLabel.text = application.title;
    
    if (application.viewControllerClassName != nil) {
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    } else {

        cell.accessoryType = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
