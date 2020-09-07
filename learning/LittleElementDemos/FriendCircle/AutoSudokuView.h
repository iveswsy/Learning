//
//  AutoSudokuView.h
//  learning
//
//  Created by 王守允 on 2020/8/30.
//  Copyright © 2020 ives. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AutoSudokuView : UIView


///初始化的时候传入最大宽度，方便布局使用
-(instancetype)initWithMaxWidth:(CGFloat)width;

///本次需要添加宫格的个数
@property (nonatomic, assign) NSInteger buttonCount;

@property (nonatomic, copy) NSArray <NSString*>* imgs;

@end

NS_ASSUME_NONNULL_END
