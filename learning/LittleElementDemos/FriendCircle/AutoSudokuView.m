//
//  AutoSudokuView.m
//  learning
//
//  Created by 王守允 on 2020/8/30.
//  Copyright © 2020 ives. All rights reserved.
//

#import "AutoSudokuView.h"
#import "Masonry.h"

typedef enum : NSUInteger {
    FCButtonLayoutStyleOne,//一张图片
    FCButtonLayoutStyleTwo,//两张图片
    FCButtonLayoutStyleFour,//四张图片
    FCButtonLayoutStyleOther,//其他
} FCButtonLayoutStyle;

@interface AutoSudokuView ()


///容器视图 来自适应九宫格高度
@property (nonatomic, strong) UIView * containerView;
///容器视图的底部约束
@property (nonatomic, weak) MASConstraint * containerViewConstraintbottom;
///button布局类型
@property (nonatomic) FCButtonLayoutStyle layoutStyle;
///最大宽度
@property (nonatomic) CGFloat maxWidth;
///装多宫格的数组,复用视图
@property (nonatomic, strong) NSMutableArray <UIButton*>* buttons;
@end

@implementation AutoSudokuView

-(void)setButtonCount:(NSInteger)buttonCount{
    
    //有图片的情况
    if (buttonCount != 0) {
        
        if (buttonCount == 1) {
            self.layoutStyle = FCButtonLayoutStyleOne;
        }else if (buttonCount == 2){
            self.layoutStyle = FCButtonLayoutStyleTwo;
        }else if (buttonCount == 4){
            self.layoutStyle = FCButtonLayoutStyleFour;
        }else{
            self.layoutStyle = FCButtonLayoutStyleOther;
        }
        
        //每次重新创建宫格的个数 从容器视图中移除
        [self.containerView.subviews enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (!obj.hidden) {
                [obj removeFromSuperview];
                obj.hidden = true;
            }
        }];
        
        //循环从初始化list中取出在添加到容器视图当中
        for (int i = 0; i< buttonCount; i++) {
            UIButton *btn = self.buttons[i];
            [self.containerView addSubview:btn];
            btn.hidden = false;
        }
        
        //间距x,y
        CGFloat marginX = 10.0;
        CGFloat marginY = marginX;
        
        //一张图片的情况
        if (self.layoutStyle == FCButtonLayoutStyleOne) {
            
            //button宽度
            CGFloat btnWidth = self.maxWidth - marginX * 2;
            
            UIButton *subv = self.containerView.subviews[0];
            subv.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];

            [subv mas_updateConstraints:^(MASConstraintMaker *make){
                make.left.mas_equalTo(marginX);
                make.top.mas_equalTo(marginY);
                make.size.mas_equalTo(CGSizeMake(btnWidth, btnWidth));
            }];
            
        }
        
        
        //两张，四张图片的情况
        if (self.layoutStyle == FCButtonLayoutStyleFour || self.layoutStyle == FCButtonLayoutStyleTwo) {
            
            //button宽度
            CGFloat btnWidth = (self.maxWidth - marginX * 3) / 2;
            
            for (int i = 0; i < self.containerView.subviews.count ; i++) {
                
                UIButton *subv = self.containerView.subviews[i];
                subv.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
                
                [subv mas_updateConstraints:^(MASConstraintMaker *make){
                    make.left.mas_equalTo(marginX + i % 2 * (btnWidth + marginX));
                    make.top.mas_equalTo(marginY + i / 2 * (btnWidth + marginY));
                    make.size.mas_equalTo(CGSizeMake(btnWidth, btnWidth));
                }];
                
            }
            
        }
        
        //其他情况
        if (self.layoutStyle == FCButtonLayoutStyleOther) {
            
            //button宽度
            CGFloat btnWidth = (self.maxWidth - marginX * 4) / 3;
            
            for (int i = 0; i < self.containerView.subviews.count ; i++) {
                
                UIButton *subv = self.containerView.subviews[i];
                subv.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
                
                [subv mas_updateConstraints:^(MASConstraintMaker *make){
                    make.left.mas_equalTo(marginX + i % 3 * (btnWidth + marginX));
                    make.top.mas_equalTo(marginY + i / 3 * (btnWidth + marginY));
                    make.size.mas_equalTo(CGSizeMake(btnWidth, btnWidth));
                }];
                
            }
            
        }
        
        //卸载上一次容器视图的底部约束
        if (self.containerViewConstraintbottom) {
            [self.containerViewConstraintbottom uninstall];
        }
        //重新生成容器视图的底部约束 参考最后一个宫格的底部
        [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
            self.containerViewConstraintbottom = make.bottom.equalTo(self.containerView.subviews.lastObject).offset(marginX);
        }];
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.containerView.mas_bottom);
        }];
        
    }
    
    //无图片的情况
    else{
        
        //每次重新创建宫格的个数 从容器视图中移除
        [self.containerView.subviews enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (!obj.hidden) {
                [obj removeFromSuperview];
                obj.hidden = true;
            }
        }];
        //卸载上一次容器视图的底部约束
        if (self.containerViewConstraintbottom) {
            [self.containerViewConstraintbottom uninstall];
        }
        //重新生成容器视图的底部约束 参考最后一个宫格的底部
        [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
            self.containerViewConstraintbottom = make.bottom.equalTo(self.containerView.mas_top).offset(0);
        }];
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.containerView.mas_bottom);
        }];
        
    }
    
//    self.layoutStyle = 0;
    
}

- (void)setImgs:(NSArray<NSString *> *)imgs{
    for (int i = 0; i < imgs.count; i++) {
        UIButton *btn = (UIButton *) _buttons[i];
        [btn setImage:[UIImage imageNamed:imgs[i]] forState:UIControlStateNormal];
    }
}

-(instancetype)initWithMaxWidth:(CGFloat)width{
    
    self = [super init];
    if (self) {
        
        self.maxWidth = width;
        self.backgroundColor = [UIColor systemGroupedBackgroundColor];
        for (int i = 0; i < 9; i++) {
            UIButton * button = [UIButton new];
            button.hidden = true;
            [self.buttons addObject:button];
        }
        [self addSubview:self.containerView];
        [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(self);
        }];
        
    }
    return self;
    
}

/// MARK: ---- 懒加载
-(NSMutableArray *)buttons {
    if (!_buttons) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}
-(UIView *)containerView {
    if (!_containerView) {
        _containerView = [UIView new];
    }
    return _containerView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
