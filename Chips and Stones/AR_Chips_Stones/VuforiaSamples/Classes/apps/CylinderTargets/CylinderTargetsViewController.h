

#import <UIKit/UIKit.h>
#import "CylinderTargetsEAGLView.h"
#import "SampleAppMenu.h"
#import "SampleApplicationSession.h"
#import <QCAR/DataSet.h>

@interface CylinderTargetsViewController : UIViewController <SampleApplicationControl, SampleAppMenuCommandProtocol>{
    CGRect viewFrame;
    CylinderTargetsEAGLView* eaglView;
    UITapGestureRecognizer * tapGestureRecognizer;
    SampleApplicationSession * vapp;
    QCAR::DataSet*  dataSet;
}

@end
