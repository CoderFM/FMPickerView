//
//  FMPickerDataView.m
//  FMFormSubmitKit_Example
//
//  Created by 郑桂华 on 2020/6/30.
//  Copyright © 2020 zhoufaming251@163.com. All rights reserved.
//

#import "FMPickerDataView.h"

@interface FMPickerDataView ()<UIPickerViewDelegate, UIPickerViewDataSource>

@property(nonatomic, strong)NSMutableDictionary<NSNumber *, NSNumber *> *selectRows;

@end

@implementation FMPickerDataView

- (void)initUI{
    [super initUI];
    UIPickerView *picker = [[UIPickerView alloc] init];
    picker.delegate = self;
    picker.dataSource = self;
    [self.pickerContentView addSubview:picker];
    self.linkageType = FMPickerLinkageTypeForbid;
    self.pickerView = picker;
    self.selectRows = [NSMutableDictionary dictionary];
    self.components = 1;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.pickerView.frame = self.pickerContentView.bounds;
}

- (void)setItems:(NSMutableArray *)items{
    _items = items;
    [self resetSelectRows];
    [self.pickerView reloadAllComponents];
}

- (void)setComponents:(NSInteger)components{
    _components = components;
    [self resetSelectRows];
    [self.pickerView reloadAllComponents];
}

- (void)resetSelectRows{
    [self.selectRows removeAllObjects];
    for (int i = 0; i<self.components; i++) {
        self.selectRows[@(i)] = @0;
    }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    if (self.linkageType == FMPickerLinkageTypeForbid) {
        return self.items.count;
    }
    return self.components;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (self.linkageType == FMPickerLinkageTypeForbid) {
        if (component < self.items.count) {
            NSArray *arr = self.items[component];
            return arr.count;
        } else {
            return 0;
        }
    }
    if (component == 0) {
        return self.items.count;
    }
    NSArray *items;
    id item = self.items[[self.selectRows[@0] integerValue]];
    for (int i = 1; i <= component; i++) {
        items = !self.componentItems?[NSArray array]:self.componentItems(i, item);
        item = items[[self.selectRows[@(i)] integerValue]];
    }
    return items.count;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    if (view == nil) {
        view = [[UILabel alloc] init];
    }
    NSString *name = @"";
    if (self.linkageType == FMPickerLinkageTypeForbid) {
        if (component < self.items.count) {
            NSArray *arr = self.items[component];
            if (row < arr.count) {
                id item = arr[row];
                name = !self.labelShowText?@"":self.labelShowText(item);
            }
        } else {
            name = @"";
        }
    } else {
        if (component == 0) {
            id item = self.items[row];
            name = !self.labelShowText?@"":self.labelShowText(item);
        } else {
            id item = self.items[[self.selectRows[@0] integerValue]];
            for (NSInteger i = 1; i <= component; i++) {
                NSArray *items = !self.componentItems?[NSArray array]:self.componentItems(i,item);
                if (row < items.count) {
                    item = items[row];
                }
            }
            name = !self.labelShowText?@"":self.labelShowText(item);
        }
    }
    UILabel *label = (UILabel *)view;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = name;
    label.font = [UIFont systemFontOfSize:16];

    return label;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    return self.bounds.size.width / self.components;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 40;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (self.linkageType == FMPickerLinkageTypeForbid) {
        return;
    }
    self.selectRows[@(component)] = @(row);
    for (int i = (int)component + 1; i < self.components; i++) {
        self.selectRows[@(i)] = @0;
    }
    [self showCurrentComponentRow];
}

- (void)showCurrentComponentRow{
    for (int component = 0; component < self.components; component++) {
        NSInteger row = [self.selectRows[@(component)] integerValue];
        [self.pickerView selectRow:row inComponent:component animated:YES];
        if (component + 1 < self.components) {
            [self.pickerView reloadComponent:component + 1];
        }
    }
}

@end
