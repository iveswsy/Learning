//
//  HTBaseViewController.h
//  learning
//
//  Created by ask123 on 2020/7/20.
//  Copyright © 2020 ives. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^tableViewRefreshBlock)(NSInteger pageNum);
typedef void(^navigationBtnBlock)(UIButton *navBtn);

NS_ASSUME_NONNULL_BEGIN

@interface HTBaseViewController : UIViewController

@property (nonatomic, copy)navigationBtnBlock navBtnAction;
-(void)addTableHeaderRefresh:(BOOL)headerRefresh tableFooterRefresh:(BOOL)footerRefresh;

@end

NS_ASSUME_NONNULL_END
