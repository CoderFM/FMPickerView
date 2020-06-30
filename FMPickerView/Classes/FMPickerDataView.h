//
//  FMPickerDataView.h
//  FMFormSubmitKit_Example
//
//  Created by 郑桂华 on 2020/6/30.
//  Copyright © 2020 zhoufaming251@163.com. All rights reserved.
//

#import "FMPickerBaseView.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, FMPickerLinkageType){
    FMPickerLinkageTypeNormal, /// 联动
    FMPickerLinkageTypeForbid  /// 禁止联动
};


@interface FMPickerDataView : FMPickerBaseView

@property(nonatomic, weak)UIPickerView *pickerView;

@property(nonatomic, strong)NSMutableArray *items;
///是否联动
@property(nonatomic, assign)FMPickerLinkageType linkageType;
///label需要显示的文本数据  根据当前应该选中数据  处理返回显示
@property(nonatomic, copy)NSString *(^labelShowText)(id obj);
///FMPickerLinkageTypeNormal联动状态下的列数
@property(nonatomic, assign)NSInteger  components;
///FMPickerLinkageTypeNormal联动状态每一列应当显示的数组数据 components当前列 上一列的选中数据
@property(nonatomic, copy)NSArray *(^componentItems)(NSInteger components, id lastObj);

@end

NS_ASSUME_NONNULL_END
