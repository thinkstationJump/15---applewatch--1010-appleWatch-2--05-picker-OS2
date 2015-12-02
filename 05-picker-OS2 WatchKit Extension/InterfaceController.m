//
//  InterfaceController.m
//  05-picker-OS2 WatchKit Extension
//
//  Created by xiaomage on 15/10/10.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()

/*
 OS2新出的控件
 - (void)focus;
 - (void)resignFocus;
 
 // Change the selected item index.
 - (void)setSelectedItemIndex:(NSInteger)itemIndex;
 
 - (void)setItems:(nullable NSArray<WKPickerItem *> *)items;
 
.
 - (void)setCoordinatedAnimations:(nullable NSArray<WKInterfaceObject<WKImageAnimatable> *> *)coordinatedAnimations;
 .
 - (void)setEnabled:(BOOL)enabled;
 */
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfacePicker *pickerTest;

/** items数组 */
@property (nonatomic, strong) NSMutableArray *items;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfacePicker *stackP;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfacePicker *sp;

@end


@implementation InterfaceController

- (NSMutableArray *)items
{
    if (!_items) {
        _items = [NSMutableArray array];
        
        /*
         @property (nonatomic, copy, nullable) NSString *title;.
         @property (nonatomic, copy, nullable) NSString *caption;
         =
         @property (nonatomic, copy, nullable) WKImage *accessoryImage;
         
         @property (nonatomic, copy, nullable) WKImage *contentImage;

         */
        
        for (NSInteger i = 0; i < 9; i++) {
            
            WKPickerItem *item = [[WKPickerItem alloc] init];
            item.title = [NSString stringWithFormat:@"title%d", i];
            item.caption = [NSString stringWithFormat:@"caption%d", i];;
            item.accessoryImage = [WKImage imageWithImageData:UIImagePNGRepresentation([UIImage imageNamed:@"ad_00"])];
            item.contentImage = [WKImage imageWithImage:[UIImage imageNamed:@"ad_01.png"]];
            
            [_items addObject:item];
        }
    }
    return _items;
}

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    
    [self.pickerTest setItems:self.items];
    [self.stackP setItems:self.items];
    [self.sp setItems:self.items];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

// 点击pikcer的某个item时候调用
- (void)pickerDidFocus:(WKInterfacePicker *)picker
{
    NSLog(@"%s, line = %d", __FUNCTION__, __LINE__);
}

- (void)pickerDidResignFocus:(WKInterfacePicker *)picker
{
    NSLog(@"%s, line = %d", __FUNCTION__, __LINE__);
}

- (void)pickerDidSettle:(WKInterfacePicker *)picker
{
    NSLog(@"%s, line = %d", __FUNCTION__, __LINE__);
}

@end



