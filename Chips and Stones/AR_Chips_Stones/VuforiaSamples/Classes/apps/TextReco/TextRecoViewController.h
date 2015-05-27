

#import <UIKit/UIKit.h>
#import "TextRecoEAGLView.h"
#import "SampleApplicationSession.h"
#import <QCAR/DataSet.h>
#import "SampleAppMenu.h"

@interface TextRecoViewController : UIViewController <SampleApplicationControl, SampleAppMenuCommandProtocol>{
    CGRect viewFrame;
    CGRect viewQCARFrame;

    TextRecoEAGLView * eaglView;
    UITapGestureRecognizer * tapGestureRecognizer;
    SampleApplicationSession * vapp;

    int ROICenterX;
    int ROICenterY;
    int ROIWidth;
    int ROIHeight;
}

@end
