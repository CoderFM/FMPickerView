//
//  FMViewController.m
//  FMPickerView
//
//  Created by zhoufaming251@163.com on 06/30/2020.
//  Copyright (c) 2020 zhoufaming251@163.com. All rights reserved.
//

#import "FMViewController.h"
#import <FMPickerView.h>

@interface FMViewController ()

@end

@implementation FMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    FMPickerDataView *picker = [[FMPickerDataView alloc] initWithFrame:CGRectMake(0, 0, 375, 375)];
    [self.view addSubview:picker];
    [picker showTitle:@"不联动" items:@[@[@"1", @"2", @"3"], @[@"3", @"3", @"1", @"6"]] showText:^NSString * _Nullable(NSInteger component, id  _Nonnull obj) {
        return obj;
    } complete:^(NSArray * _Nonnull selects, NSDictionary * _Nonnull selectRows) {
        
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)tanClick:(id)sender {
    [[FMPickerDataView showLinkageTitle:@"联动显示" components:2 items:@[@[@"1", @"2", @"3"], @[@"3", @"3", @"1", @"6"]] componentItems:^NSArray * _Nullable(NSInteger component, id  _Nonnull lastObj) {
        return lastObj;
    } showText:^NSString * _Nullable(NSInteger component, id  _Nonnull obj) {
        if ([obj isKindOfClass:[NSString class]]) {
            return obj;
        } else {
            return @"联动";
        }
    } complete:^(NSArray * _Nonnull selects, NSDictionary * _Nonnull selectRows) {
        
    }] setConfigureShowLabel:^(NSString * _Nonnull showText, UILabel * _Nonnull label, BOOL isSelected) {
        label.textColor = isSelected ? [UIColor redColor] : [UIColor blackColor];
    }];
}
- (IBAction)noLinkClick:(id)sender {
    [[FMPickerDataView showTitle:@"不联动" items:@[@[@"1", @"2", @"3"], @[@"3", @"3", @"1", @"6"]] showText:^NSString * _Nullable(NSInteger component, id  _Nonnull obj) {
        return obj;
    } complete:^(NSArray * _Nonnull selects, NSDictionary * _Nonnull selectRows) {
        
    }] showSelectRows:@{@0:@4}];
}
- (IBAction)dateClick:(id)sender {
    [FMDatePickerView showTitle:@"选择日期" dateMode:UIDatePickerModeTime date:[NSDate date] maxDate:nil minDate:nil complete:^(NSDate * _Nonnull date) {
        
    }];
}

- (IBAction)addressClick:(UIButton *)sender {
    NSString *plist = [[NSBundle mainBundle] pathForResource:@"BRCity" ofType:@"plist"];
    [[FMPickerDataView showLinkageTitle:@"地址" components:sender.tag plist:plist componentItems:^NSArray * _Nullable(NSInteger component, id  _Nonnull lastObj) {
        return [lastObj valueForKey:@"n"];
    } showText:^NSString * _Nullable(NSInteger component, id  _Nonnull obj) {
        return [obj valueForKey:@"v"];
    } complete:^(NSArray * _Nonnull selects, NSDictionary * _Nonnull selectRows) {
        
    }] showSelectRows:@{@0:@10,@1:@2,@3:@20}];
}


@end
