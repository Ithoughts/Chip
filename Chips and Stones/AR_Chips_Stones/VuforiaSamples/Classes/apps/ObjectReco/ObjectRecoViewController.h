

#import <UIKit/UIKit.h>
#import "SampleAppMenu.h"
#import "ObjectRecoEAGLView.h"
#import "SampleApplicationSession.h"
#import <QCAR/DataSet.h>

@interface ObjectRecoViewController : UIViewController <SampleApplicationControl, SampleAppMenuCommandProtocol>{
    CGRect viewFrame;
    ObjectRecoEAGLView* eaglView;
    QCAR::DataSet*  currentDataSet;
    UITapGestureRecognizer * tapGestureRecognizer;
    SampleApplicationSession * vapp;
    BOOL extendedTrackingIsOn;
}

@end
