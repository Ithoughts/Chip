

#import <UIKit/UIKit.h>

//  Custom button that contains an UIImageView on its center and can be rotated
//  given a UIDeviceOrientation. This class is used on CustomToolbar in order to
//  mimic the iOS camera screen.

@interface CustomButton : UIButton
{
    UIImageView *customImageView;
    UIImage *customImage;
}

@property (retain) UIImage *customImage;

-(void)rotateWithOrientation:(UIDeviceOrientation)anOrientation;

@end
