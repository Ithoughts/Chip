

#import "SampleAppMenu.h"

// 宏定义
#define kMaxMenuGroups 5
#define kMaxMenuItemsPerGroup 12

/**
 *         SampleAppMenuItem
 */

typedef enum {
    TYPE_TEXT,
    TYPE_CHECKBOX,
    TYPE_RADIOBUTTON
} MenuType;

@interface SampleAppMenuItem()

// 选择类型
@property (nonatomic) int itemType;

// 是否选择
@property (nonatomic) bool selectionValue;

@end

@implementation SampleAppMenuItem

- (BOOL) isON
{
    return self.selectionValue;
}

- (BOOL) isRadioButton
{
    return self.itemType == TYPE_RADIOBUTTON;
}

- (BOOL) isCheckBox
{
    return self.itemType == TYPE_CHECKBOX;
}

- (BOOL) isTextItem
{
    return self.itemType == TYPE_TEXT;
}

- (BOOL) swapSelection
{
    self.selectionValue = !self.selectionValue;
    return self.selectionValue;
}
@end



/**
 *        SampleAppMenuGroup 
 */
@interface SampleAppMenuGroup()

//标题
@property (nonatomic, retain) NSString * title;

//是否选择
@property (nonatomic) bool isSelectionGroup;

//可变数组
@property (retain) NSMutableArray * menuItems;

@end

@implementation SampleAppMenuGroup

- (id)initWithTitle:(NSString *) title;
{
    self = [super init];
    if (self) {
        self.title = title;
        self.isSelectionGroup = NO;
        
        // 初始化数组
        self.menuItems = [NSMutableArray arrayWithCapacity:kMaxMenuItemsPerGroup];
    }
    return self;
}

- (void)dealloc
{
    [_title release];
    [_menuItems release];
    [super dealloc];
}

- (void) addTextItem:(NSString *)text command:(int) command
{
    SampleAppMenuItem * mi = [[[SampleAppMenuItem alloc] init] autorelease];
    mi.text = text;
    mi.command = command;
    mi.itemType = TYPE_TEXT;
    mi.selectionValue = NO;
    [self.menuItems addObject:mi];
}

- (void) addSelectionItem:(NSString *)text command:(int) command isSelected:(bool)isSelected
{
    SampleAppMenuItem * mi = [[[SampleAppMenuItem alloc]init] autorelease];
    mi.text = text;
    mi.command = command;
    mi.itemType = self.isSelectionGroup ? TYPE_RADIOBUTTON : TYPE_CHECKBOX;
    mi.selectionValue = isSelected;
    [self.menuItems addObject:mi];
}

- (SampleAppMenuItem *) itemAtIndex:(NSUInteger) index
{
    return [self.menuItems objectAtIndex:index];
}

- (void) setActiveItem:(NSUInteger) indexItem
{
    NSUInteger index = 0;
    
    for (SampleAppMenuItem * item in self.menuItems) {
        item.selectionValue = (index == indexItem) ;
        index++;
    }
}

- (bool)setSelectionValueForCommand:(int) command value:(bool) value
{
    for (SampleAppMenuItem * item in self.menuItems) {
        if (item.command == command) {
            item.selectionValue = value;
            return true;
        }
    }
    return false;
}

- (NSString *) titleOrNil
{
    if ((self.title == nil) || ([self.title length] == 0)) {
        return nil;
    }
    return self.title;
}

- (NSUInteger) nbItems
{
    return [self.menuItems count];
}

@end


/**
 *         SampleAppMenu
 */
@interface SampleAppMenu ()

// 可变数组
@property (retain) NSMutableArray * menuGroups;

@end

@implementation SampleAppMenu

// 创建一个单例
+(SampleAppMenu *)instance
{
    static dispatch_once_t pred;
    static SampleAppMenu * shared = nil;
    
    dispatch_once(&pred, ^{
        shared = [[SampleAppMenu alloc] init];
      });
    
    return shared;
}

+ (SampleAppMenu *) prepareWithCommandProtocol:(id<SampleAppMenuCommandProtocol>) commandProtocol title:(NSString *) title
{
    SampleAppMenu * menu = [SampleAppMenu instance];
    menu.commandProtocol = commandProtocol;
    menu.title = title;
    [menu.menuGroups removeAllObjects];
    
    return menu;
}

- (id)init
{
    self = [super init];
    if (self) {
        
        // 初始化数组
        self.menuGroups = [NSMutableArray arrayWithCapacity:kMaxMenuGroups];
    }
    return self;
}

- (SampleAppMenuGroup *) addGroup:(NSString *) title
{
    SampleAppMenuGroup * group = [[SampleAppMenuGroup alloc] initWithTitle:title];
    [self.menuGroups addObject:group];
    [group release];
    
    return group;
}

- (SampleAppMenuGroup *) addSelectionGroup:(NSString *)title
{
    SampleAppMenuGroup * group = [self addGroup:title];
    group.isSelectionGroup = true;
    
    return group;
}

- (NSUInteger)nbGroups
{
    return [self.menuGroups count];
}

- (NSUInteger) nbItemsInGroupIndex:(NSUInteger)index
{
    SampleAppMenuGroup * group = [self.menuGroups objectAtIndex:index];
    return [group nbItems];
}

- (NSString *) titleForGroupIndex:(NSUInteger)index
{
    SampleAppMenuGroup * group = [self.menuGroups objectAtIndex:index];
    return [group titleOrNil];
}


- (bool)setSelectionValueForCommand:(int)command value:(bool)value
{
    
    for (SampleAppMenuGroup * group in self.menuGroups) {
        
        if ([group setSelectionValueForCommand:command value:value]) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"kMenuChange" object:nil];
            return true;
        }
    }
    return false;
}
- (SampleAppMenuGroup *) groupAtIndex:(NSUInteger)indexGroup
{
    return [self.menuGroups objectAtIndex:indexGroup];
}

- (SampleAppMenuItem *) itemInGroup:(NSUInteger)indexGroup atIndex:(NSUInteger)indexItem
{
    SampleAppMenuGroup * group = [self.menuGroups objectAtIndex:indexGroup];
    return [group itemAtIndex:indexItem];
}

- (bool) notifyCommand:(int)command  value:(bool)value
{
    return [self.commandProtocol menuProcess:self command:command value:value];
}

- (void)clear
{
    [self.menuGroups removeAllObjects];
    self.title = nil;
}
@end
