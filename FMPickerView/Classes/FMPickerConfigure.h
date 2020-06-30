//
//  FMPickerConfigure.h
//  FMFormSubmitKit_Example
//
//  Created by 郑桂华 on 2020/6/30.
//  Copyright © 2020 zhoufaming251@163.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FMPickerConfigure : NSObject

@property(nonatomic, assign)CGFloat bottomHeight;
@property(nonatomic, assign)CGFloat topHeight;
@property(nonatomic, assign)CGFloat pickerHeight;

@property(nonatomic, assign)CGFloat sureBtnWidth;
@property(nonatomic, assign)CGFloat closeBtnWidth;

@property(nonatomic, assign)CGFloat bgBlackAlpha;

@property(nonatomic, assign)BOOL hiddenRemovePicker;

+ (instancetype)defaultConfigure;

@end

NS_ASSUME_NONNULL_END
