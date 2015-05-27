

#import <UIKit/UIKit.h>
#import "SampleAppMenu.h"
#import "VirtualButtonsEAGLView.h"
#import "SampleApplicationSession.h"
#import <QCAR/DataSet.h>



@interface VirtualButtonsViewController : UIViewController <SampleApplicationControl, SampleAppMenuCommandProtocol>{
    CGRect viewFrame;
    VirtualButtonsEAGLView* eaglView;
    UITapGestureRecognizer * tapGestureRecognizer;
    SampleApplicationSession * vapp;
    
    QCAR::DataSet*  dataSet;

    bool buttonStateChanged;
    bool buttonActivated[NB_BUTTONS];
}

@end
