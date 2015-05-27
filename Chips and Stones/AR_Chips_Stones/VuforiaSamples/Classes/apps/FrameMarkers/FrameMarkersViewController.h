

#import <UIKit/UIKit.h>
#import "SampleAppMenu.h"
#import "FrameMarkersEAGLView.h"
#import "SampleApplicationSession.h"
#import <QCAR/DataSet.h>

@interface FrameMarkersViewController : UIViewController <SampleApplicationControl, SampleAppMenuCommandProtocol>{
    CGRect viewFrame;
    FrameMarkersEAGLView* eaglView;
    UITapGestureRecognizer * tapGestureRecognizer;
    SampleApplicationSession * vapp;
}

@end
