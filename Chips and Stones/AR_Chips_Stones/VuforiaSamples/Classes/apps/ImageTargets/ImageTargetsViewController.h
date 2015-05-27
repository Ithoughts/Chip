

#import <UIKit/UIKit.h>
#import "SampleAppMenu.h"
#import "ImageTargetsEAGLView.h"
#import "SampleApplicationSession.h"
#import <QCAR/DataSet.h>

@interface ImageTargetsViewController : UIViewController <SampleApplicationControl, SampleAppMenuCommandProtocol>
{
    CGRect viewFrame;

    ImageTargetsEAGLView * eaglView;
    SampleApplicationSession *vapp;
    
    
    // Data Set
    QCAR::DataSet * dataSetCurrent;
    QCAR::DataSet * dataSetTarmac;
    QCAR::DataSet * dataSetStonesAndChips;
    
    // Tap Gesture Recognizer
    UITapGestureRecognizer *tapGestureRecognizer;
    
    // Switch To Select
    BOOL switchToTarmac;
    BOOL switchToStonesAndChips;
    BOOL extendedTrackingIsOn;
}

@end
