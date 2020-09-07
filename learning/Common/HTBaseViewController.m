//
//  HTBaseViewController.m
//  learning
//
//  Created by ask123 on 2020/7/20.
//  Copyright © 2020 ives. All rights reserved.
//

#import "HTBaseViewController.h"
#import "MJRefresh.h"

@interface HTBaseViewController ()

@end

@implementation HTBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


#pragma mark ------- set nav left item
-(void)createBackBtnWithImageName:(NSString *)imageName{
    UIButton *btn_back = [UIButton buttonWithType:UIButtonTypeCustom];
    btn_back.frame = CGRectMake(0, 0, 40, 30);
    btn_back.contentEdgeInsets = UIEdgeInsetsMake(0, -2, 0, 0);
    btn_back.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [btn_back setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    btn_back.tag = 9;
    //保证所有touch事件button的highlighted属性为NO,即可去除高亮效果
    [btn_back addTarget:self action:@selector(preventFlicker:) forControlEvents:UIControlEventAllTouchEvents];
    [btn_back addTarget:self action:@selector(popToLastVC:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:btn_back];
    self.navigationItem.leftBarButtonItem = leftItem;
}
-(void)popToLastVC:(UIButton *)sender{
    NSArray *viewControllers = self.navigationController.viewControllers;
    if (viewControllers.count == 0) {
        return;
    }
    if (self.navBtnAction) {//如果vc中调用了block回调就走自己的回调
        self.navBtnAction(sender);
    }else{//如果vc中没有调用block回调，直接返回到到上级页面
        [self.navigationController popViewControllerAnimated:YES];
    }
}
#pragma mark ------- wipe out button highlight
-(void)preventFlicker:(UIButton *)sender{
    sender.highlighted = NO;
}

#pragma mark ------- set nav right item
-(void)createNavRightBtnWithImageName:(NSString *)imageName{
    UIButton *btn_right = [UIButton buttonWithType:UIButtonTypeCustom];
    btn_right.frame = CGRectMake(0, 0, 40, 30);
    btn_right.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 2);
    btn_right.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [btn_right setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    btn_right.tag = 10;
    //保证所有touch事件button的highlighted属性为NO,即可去除高亮效果
    [btn_right addTarget:self action:@selector(preventFlicker:) forControlEvents:UIControlEventAllTouchEvents];
    [btn_right addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:btn_right];
    self.navigationItem.rightBarButtonItem = rightItem;
}
-(void)rightBtnClick:(UIButton *)sender{
    NSArray *viewControllers = self.navigationController.viewControllers;
    if (viewControllers.count == 0) {
        return;
    }
    if (self.navBtnAction) {//如果vc中调用了block回调就走自己的回调
        self.navBtnAction(sender);
    }else{//如果vc中没有调用block回调，直接返回到到上级页面
        [self.navigationController popViewControllerAnimated:YES];
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
