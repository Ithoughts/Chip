
#import <Foundation/Foundation.h>

/**
 *     SampleAppMenu  Protocol
 */

@class SampleAppMenu;

@protocol SampleAppMenuCommandProtocol <NSObject>

// this method is called when a menu item is selected. the application can return NO to notify the command failed.
- (bool)menuProcess:(SampleAppMenu *)menu command:(int)command value:(bool)value;

@end




/**
 *     SampleAppMenuItem
 */
@interface SampleAppMenuItem : NSObject

@property (nonatomic, retain) NSString * text;
@property (nonatomic) int command;

- (BOOL) isON;
- (BOOL) isRadioButton;
- (BOOL) isCheckBox;
- (BOOL) isTextItem;
- (BOOL) swapSelection;

@end

/**
 *      SampleAppMenuGroup
 */
@interface SampleAppMenuGroup : NSObject

- (NSString *) title;

// command will be used for the notification, a negative value is internally handled as a "back" command
- (void) addTextItem:(NSString *)text command:(int) command;

- (void) addSelectionItem:(NSString *)text command:(int) command isSelected:(bool)isSelected;

- (void) setActiveItem:(NSUInteger) indexItem;

- (NSUInteger) nbItems;

@end


/**
 *      SampleAppMenu
 */
@interface SampleAppMenu : NSObject

@property (nonatomic, retain) NSString * title;

@property (nonatomic, assign) id <SampleAppMenuCommandProtocol> commandProtocol;

+ (SampleAppMenu *)instance;

+ (SampleAppMenu *) prepareWithCommandProtocol:(id<SampleAppMenuCommandProtocol>) commandProtocol title:(NSString *) title;

- (SampleAppMenuGroup *) addGroup:(NSString *) title;

- (SampleAppMenuGroup *) addSelectionGroup:(NSString *) title;

- (NSUInteger) nbGroups;

- (bool) notifyCommand:(int)command value:(bool) value;

- (void) clear;

- (bool)setSelectionValueForCommand:(int ) command value:(bool) value;

// for rendering purpose
- (NSUInteger) nbItemsInGroupIndex:(NSUInteger) index;

- (NSString *) titleForGroupIndex:(NSUInteger) index;

- (SampleAppMenuItem *) itemInGroup:(NSUInteger) indexGroup atIndex:(NSUInteger)indexItem;

- (SampleAppMenuGroup *) groupAtIndex:(NSUInteger) indexGroup;

@end
