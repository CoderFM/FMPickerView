//
//  FMDatePickerView.m
//  FMFormSubmitKit_Example
//
//  Created by 郑桂华 on 2020/6/30.
//  Copyright © 2020 zhoufaming251@163.com. All rights reserved.
//

#import "FMDatePickerView.h"

@implementation FMDatePickerView

- (void)initUI{
    [super initUI];
    UIDatePicker *picker = [[UIDatePicker alloc] init];
    picker.datePickerMode = UIDatePickerModeDate;
    [self.pickerContentView addSubview:picker];
    self.datePicker = picker;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.datePicker.frame = self.pickerContentView.bounds;
}

@end
