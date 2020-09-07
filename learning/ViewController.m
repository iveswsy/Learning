//
//  ViewController.m
//  learning
//
//  Created by ask123 on 2020/6/22.
//  Copyright © 2020 ives. All rights reserved.
//

#import "ViewController.h"
#import "AFHTTPSessionManager.h"

// 定义这个常量，就可以不用在开发过程中使用"mas_"前缀。
#define MAS_SHORTHAND
// 定义这个常量，就可以让Masonry帮我们自动把基础数据类型的数据，自动装箱为对象类型。
#define MAS_SHORTHAND_GLOBALS

#import "Masonry.h"
#import "NSArray+Sudoku.h"
#import "AutoSudokuView.h"
#import "HTFriendCircleVC.h"

@interface ViewController ()<CAAnimationDelegate>
@property (assign) NSInteger ticketSurplusCount;
@property  NSThread *ticketSaleWindow1;
@property  NSThread *ticketSaleWindow2;

@property (nonatomic ,strong) UIView *greenView;

@property (nonatomic,strong) dispatch_source_t timer1;

@property (nonatomic , strong) NSMutableArray *masonryViewArray;

@end


@implementation ViewController{
    NSString *ted;
    
    dispatch_source_t timer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //    [self initTicketStatusNotSave];
    //    [self saleTicketSafe];

    
    
//    self.greenView =[[UIView alloc]init];
//    self.greenView.backgroundColor = UIColor.greenColor;
//    [self.view addSubview:self.greenView];
//    [self.greenView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self.view);
//        // 这里通过mas_equalTo给size设置了基础数据类型的参数，参数为CGSize的结构体
//        make.size.mas_equalTo(CGSizeMake(300, 300));
//        make.width.equalTo(self.view).multipliedBy(0.2);
//    }];

//    // 为了更清楚的看出约束变化的效果，在显示两秒后更新约束。
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        // 指定更新size，其他约束不变。
//        [self.greenView mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.width.equalTo(self.view).priorityMedium();
//            make.width.mas_equalTo(20).priorityLow();
//            make.height.equalTo(self.view).priority(200);
//            make.height.mas_equalTo(100).priority(1000);
//        }];
//    });
//    [self.masonryViewArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:15 leadSpacing:10 tailSpacing:10];
//    [self.masonryViewArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:80 leadSpacing:10 tailSpacing:10];
//
//    [self.masonryViewArray mas_makeConstraints:^(MASConstraintMaker *make) {
//
//            make.top.equalTo(150);
//        make.height.equalTo(80);
//        }];

    
//    [self.masonryViewArray mas_distributeSudokuViewsWithFixedItemWidth:0.3*SCREENW fixedItemHeight:0.3*SCREENW warpCount:3 topSpacing:0.025*SCREENW bottomSpacing:0.025*SCREENW leadSpacing:0.025*SCREENW tailSpacing:0.025*SCREENW];
    
//    [self.masonryViewArray mas_distributeSudokuViewsWithFixedLineSpacing:0.05*SCREENW fixedInteritemSpacing:0.05*SCREENW warpCount:3 topSpacing:0.05*SCREENW bottomSpacing:0.05*SCREENW leadSpacing:0.05*SCREENW tailSpacing:0.05*SCREENW];
//
//    [self.masonryViewArray mas_distributeSudokuViewsWithFixedItemWidth:0.3*SCREENW fixedItemHeight:0.3*SCREENW fixedLineSpacing:0.025*SCREENW fixedInteritemSpacing:0.025*SCREENW warpCount:3 topSpacing:0.05*SCREENW bottomSpacing:0.05*SCREENW  leadSpacing:0.05*SCREENW tailSpacing:0.05*SCREENW];
    
//    AutoSudokuView *fcIView = [[AutoSudokuView alloc]initWithMaxWidth:SCREENW - 40];
//    [self.view addSubview:fcIView];
//    [fcIView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(20);
//        make.top.mas_equalTo(100);
//        make.right.mas_equalTo(self.view.mas_right).offset(-20);
//    }];
//    
//    fcIView.buttonCount = 5;
    
//    UIButton *friendCircle = [[UIButton alloc]initWithFrame:CGRectMake(0.25*SCREENW, 0.2*SCREENW, 0.5*SCREENW, 0.1*SCREENW)];
//    friendCircle.backgroundColor = UIColor.grayColor;
//    [friendCircle setTitle:@"仿朋友圈" forState:UIControlStateNormal];
//    [friendCircle addTarget:self action:@selector(toFriendCircle) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:friendCircle];
    
    //内容
//    CAKeyframeAnimation *keyframeAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//    //时间
//    keyframeAnim.duration = 5;
//    //变化规律
//    UIBezierPath *path = [[UIBezierPath alloc] init];
//    [path addArcWithCenter:CGPointMake(200, 300) radius:100 startAngle:0 endAngle:M_PI*2 clockwise:YES];
//    keyframeAnim.path = [path CGPath];
    //图形开始位置的动画
//    CABasicAnimation *startAnim = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
//    startAnim.duration = 5;
//    startAnim.fromValue = @(0);
//    startAnim.toValue = @(0.6);
//
//    //图形结束位置的动画
//    CABasicAnimation *endAnim = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
//    endAnim.duration = 5;
//    endAnim.fromValue = @(0.4);
//    endAnim.toValue = @(1);
//
//    //把两个动画合并，绘制的区域就会不断变动
//    CAAnimationGroup *group = [[CAAnimationGroup alloc] init];
//    group.animations = @[startAnim, endAnim];
//    group.duration = 5;
//    group.autoreverses = YES;
//
//    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
//    shapeLayer.frame = self.view.bounds;
//
//    //图形是一大一小两个圆相切嵌套
//    UIBezierPath *path = [[UIBezierPath alloc] init];
//    [path addArcWithCenter:CGPointMake(100, 300) radius:100 startAngle:0 endAngle:M_PI*2 clockwise:YES];
//    [path addArcWithCenter:CGPointMake(150, 300) radius:50 startAngle:0 endAngle:M_PI*2 clockwise:YES];
//    shapeLayer.path = [path CGPath];
//    shapeLayer.strokeColor = [UIColor redColor].CGColor;
//    shapeLayer.fillColor = [UIColor whiteColor].CGColor;
//
//    [shapeLayer addAnimation:group forKey:@"runningLine"];
//    [self.view.layer addSublayer:shapeLayer];
    

    
//    UIButton *button = [[UIButton alloc]init];
//    button.backgroundColor = UIColor.redColor;
//    button.frame = CGRectMake(200, 300, 100, 100);
//    [self.view  addSubview:button];
//    button.center = CGPointMake(0, 200);
//
//    CASpringAnimation *springAnim = [CASpringAnimation animationWithKeyPath:@"position"];
//    springAnim.toValue = [NSValue valueWithCGPoint:CGPointMake(220, 200)];
//    springAnim.duration = 100;
//    springAnim.mass = 10;
//    springAnim.stiffness = 50;
//    springAnim.damping = 1;
//    springAnim.initialVelocity = 0;
//    springAnim.delegate = self;
//
//    [button.layer addAnimation:springAnim forKey:@"spring"];
//
//    CABasicAnimation *basicAnim = [CABasicAnimation animationWithKeyPath:@"position"];
//
//    //mediaTiming
//    basicAnim.duration = 3;
//    basicAnim.repeatCount = 3;
//
//    //CAAnimation
//    basicAnim.removedOnCompletion = NO;
//    basicAnim.delegate = self;
//
//    //property
//    basicAnim.additive = NO;
//    basicAnim.cumulative = YES;
//
//    //basic
//    basicAnim.fromValue = [NSValue valueWithCGPoint:CGPointMake(100, 60)];
//    basicAnim.toValue = [NSValue valueWithCGPoint:CGPointMake(100, 200)];
//
//    [button.layer addAnimation:keyframeAnim forKey:@"move"];
    

}


- (void)toFriendCircle{
    HTFriendCircleVC *friend = [[HTFriendCircleVC alloc]init];
    [self presentViewController:friend animated:YES completion:^{}];
}


- (NSMutableArray *)masonryViewArray {
    

    if (!_masonryViewArray) {

        _masonryViewArray = [NSMutableArray array];
        for (int i = 0; i < 5; i ++) {

            UIView *view = [[UIView alloc] init];
            view.backgroundColor = [UIColor redColor];
            [self.view addSubview:view];
            [_masonryViewArray addObject:view];
        }
    }

    return _masonryViewArray;
}

-(void)GCDTest{
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC )), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    //
    //    });
    //
    //    static dispatch_once_t onceToken;
    //    dispatch_once(&onceToken, ^{
    //
    //    });
    
    //    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //    //串行队列
    //    dispatch_queue_t queue = dispatch_queue_create("com.test.testQueue",   DISPATCH_QUEUE_SERIAL);
    //    //你可以试试并发和串行的区别
    //    dispatch_apply(10, queue, ^(size_t index) {
    //        NSLog(@"执行第%zd次的任务,%@",index,[NSThread currentThread]);
    //        [NSThread sleepForTimeInterval:1];
    //    });
    //
    
    
    //    //创建队列组
    //    dispatch_group_t group = dispatch_group_create();
    //    //全局串行队列
    //    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //
    //    dispatch_group_enter(group);
    //    dispatch_async(queue, ^{
    //        // 第一个任务
    //        [NSThread sleepForTimeInterval:2];
    //        NSLog(@"执行第一个任务");
    //        dispatch_group_leave(group);
    //    });
    //
    //    dispatch_group_enter(group);
    //    dispatch_async(queue, ^{
    //        // 第二个任务
    //        [NSThread sleepForTimeInterval:2];
    //        NSLog(@"执行第二个任务");
    //        dispatch_group_leave(group);
    //    });
    //
    //    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
    //        [NSThread sleepForTimeInterval:2];
    //        NSLog(@"执行最后的汇总任务");
    //    });
    
    //    //创建信号量为2
    //    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
    //    //全局并发队列
    //    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //
    //    //任务1
    //    dispatch_async(queue, ^{
    //        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    //        NSLog(@"----开始执行第一个任务---");
    //        NSLog(@"执行第1次的任务,%@",[NSThread currentThread]);
    //        [NSThread sleepForTimeInterval:2];
    //        NSLog(@"----结束执行第一个任务---");
    //        dispatch_semaphore_signal(semaphore);
    //    });
    //
    //    //任务2
    //    dispatch_async(queue, ^{
    //        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    //        NSLog(@"----开始执行第二个任务---");
    //        NSLog(@"执行第2次的任务,%@",[NSThread currentThread]);
    //        [NSThread sleepForTimeInterval:1];
    //        NSLog(@"----结束执行第二个任务---");
    //        dispatch_semaphore_signal(semaphore);
    //    });
    //
    //    //任务3
    //    dispatch_async(queue, ^{
    //        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    //        NSLog(@"----开始执行第三个任务---");
    //        NSLog(@"执行第3次的任务,%@",[NSThread currentThread]);
    //        [NSThread sleepForTimeInterval:2];
    //        NSLog(@"----结束执行第三个任务---");
    //        dispatch_semaphore_signal(semaphore);
    //    });
    
    //    //全局并发队列
    //    dispatch_queue_t queue = dispatch_queue_create("com.test.testQueue", DISPATCH_QUEUE_CONCURRENT);
    //
    //    dispatch_async(queue, ^{
    //        [NSThread sleepForTimeInterval:3];
    //        NSLog(@"栅栏前的任务1");
    //    });
    //    dispatch_async(queue, ^{
    //        [NSThread sleepForTimeInterval:1];
    //        NSLog(@"栅栏前的任务2");
    //    });
    //
    //    //栅栏
    //    dispatch_barrier_async(queue, ^{
    //        // 等待处理
    //        [NSThread sleepForTimeInterval:2];
    //        NSLog(@"-栅栏等待-");
    //    });
    //
    //    dispatch_async(queue, ^{
    //        [NSThread sleepForTimeInterval:2];
    //        NSLog(@"栅栏后的任务3");
    //    });
    //    dispatch_async(queue, ^{
    //        [NSThread sleepForTimeInterval:2];
    //        NSLog(@"栅栏后的任务4");
    //    });
    
    
    //    //串行队列
    //    dispatch_queue_t queue = dispatch_queue_create("com.test.testQueue", DISPATCH_QUEUE_SERIAL);
    //
    //    dispatch_async(queue, ^{
    //        // 执行第一个任务
    //        NSLog(@"----执行第一个任务---");
    //    });
    //
    //    dispatch_async(queue, ^{
    //        // 执行第二个任务
    //        NSLog(@"开始执行第二个任务");
    //        [NSThread sleepForTimeInterval:5];
    //        NSLog(@"结束执行第二个任务");
    //    });
    //
    //    dispatch_async(queue, ^{
    //        // 执行第三个任务
    //        NSLog(@"开始执行第三个任务");
    //        [NSThread sleepForTimeInterval:4];
    //        NSLog(@"结束执行第三个任务");
    //    });
    //
    //    //此时发现意外情况，挂起队列
    //    NSLog(@"suspend");
    //    dispatch_suspend(queue);
    //
    //    //挂起3秒之后，恢复正常
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //        //恢复队列
    //        NSLog(@"3秒后恢复resume");
    //        dispatch_resume(queue);
    //    });
    
//         // 全局队列
//        dispatch_queue_t  queue = dispatch_get_global_queue(0, 0);
//
//        // 创建一个 timer 类型定时器 （ DISPATCH_SOURCE_TYPE_TIMER）
//        self.timer1 = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
//
//        //设置定时器的各种属性（何时开始，间隔多久执行）
//        // GCD 的时间参数一般为纳秒 （1 秒 = 10 的 9 次方 纳秒）
//        // 指定定时器开始的时间和间隔的时间
//        dispatch_source_set_timer(self.timer1, DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC, 0);
//
//        // 任务回调
//        dispatch_source_set_event_handler(self.timer1, ^{
//            NSLog(@"-----定时器-------");
//            NSLog(@"执行第3次的任务,%@",[NSThread currentThread]);
//        });
//
//        // 开始定时器任务（定时器默认开始是暂停的，需要复位开启）
//        dispatch_resume(self.timer1);

    
}

/**
 * 售卖火车票(线程安全)
 */
- (void)saleTicketSafe {
    while (1) {
        // 互斥锁
        @synchronized (self) {
            //如果还有票，继续售卖
            if (self.ticketSurplusCount > 0) {
                self.ticketSurplusCount --;
                NSLog(@"%@", [NSString stringWithFormat:@"剩余票数：%ld 窗口：%@", self.ticketSurplusCount, [NSThread currentThread].name]);
                [NSThread sleepForTimeInterval:0.2];
            }
            //如果已卖完，关闭售票窗口
            else {
                NSLog(@"所有火车票均已售完");
                break;
            }
        }
    }
}

- (void)initTicketStatusNotSave {
    // 1. 设置剩余火车票为 50
    self.ticketSurplusCount = 50;
    
    // 2. 设置北京火车票售卖窗口的线程
    self.ticketSaleWindow1 = [[NSThread alloc]initWithTarget:self selector:@selector(saleTicketSafe) object:nil];
    self.ticketSaleWindow1.name = @"北京火车票售票窗口";
    
    // 3. 设置上海火车票售卖窗口的线程
    self.ticketSaleWindow2 = [[NSThread alloc]initWithTarget:self selector:@selector(saleTicketSafe) object:nil];
    self.ticketSaleWindow2.name = @"上海火车票售票窗口";
    
    // 4. 开始售卖火车票
    [self.ticketSaleWindow1 start];
    [self.ticketSaleWindow2 start];
    
}

-(void) test11111 {
    AFHTTPSessionManager * manager =[AFHTTPSessionManager manager];
    NSString *baseUrl = [NSString stringWithFormat:@"https://way.jd.com/he/freeweather?city=shanghai&appkey=%@",JDAppKey];
    [manager GET:baseUrl parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *data = responseObject;
        //        NSLog(@"%@",data);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败");
    }];
    
    
    //   runtime 应用
    //  1. 方法交换
    Method ma = class_getInstanceMethod([self class], @selector(methodA));
    Method mb = class_getInstanceMethod([self class], @selector(methodB));
    method_exchangeImplementations(ma, mb);
    
    [self methodA];
    [self methodB];
    
    
    
    //UIFont 自适应
    
    UILabel  *text = [[UILabel alloc]initWithFrame:CGRectMake(0.2*SCREENW,0.3*SCREENW,0.6*SCREENW,0.2*SCREENW)];
    text.font = [UIFont systemFontOfSize:20];
    text.text =@"测试测试测试测试";
    [self.view addSubview:text];
    
    
    //创建操作队列
    NSOperationQueue *operationQueue=[[NSOperationQueue alloc]init];
    //创建最后一个操作
    NSBlockOperation *lastBlockOperation=[NSBlockOperation blockOperationWithBlock:^{
        sleep(1);
        NSLog(@"最后的任务");
    }];
    for (int i=0; i<5-1; ++i) {
        //创建多线程操作
        NSBlockOperation *blockOperation=[NSBlockOperation blockOperationWithBlock:^{
            sleep(i);
            NSLog(@"第%d个任务",i);
        }];
        //设置依赖操作为最后一个操作
        [blockOperation addDependency:lastBlockOperation];
        [operationQueue addOperation:blockOperation];
        
    }
    //将最后一个操作加入线程队列
    [operationQueue addOperation:lastBlockOperation];
}


- (void) methodA {
    NSLog(@"AAAAAAAA");
}

- (void) methodB {
    NSLog(@"BBBBBBBB");
}

////按需加载 - 如果目标行与当前行相差超过指定行数，只在目标滚动范围的前后指定3行加载。
//- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
//    NSIndexPath *ip = [self indexPathForRowAtPoint:CGPointMake(0, targetContentOffset->y)];
//    NSIndexPath *cip = [[self indexPathsForVisibleRows] firstObject];
//    NSInteger skipCount = 8;
//    if (labs(cip.row-ip.row)>skipCount) {
//        NSArray *temp = [self indexPathsForRowsInRect:CGRectMake(0, targetContentOffset->y, self.width, self.height)];
//        NSMutableArray *arr = [NSMutableArray arrayWithArray:temp];
//        if (velocity.y<0) {
//            NSIndexPath *indexPath = [temp lastObject];
//            if (indexPath.row+33) {
//                [arr addObject:[NSIndexPath indexPathForRow:indexPath.row-3 inSection:0]];
//                [arr addObject:[NSIndexPath indexPathForRow:indexPath.row-2 inSection:0]];
//                [arr addObject:[NSIndexPath indexPathForRow:indexPath.row-1 inSection:0]];
//            }
//        }
//        [needLoadArr addObjectsFromArray:arr];
//    }
//}
//在tableView:cellForRowAtIndexPath:方法中加入判断：
//if (needLoadArr.count>0&&[needLoadArr indexOfObject:indexPath]==NSNotFound) {
//    [cell clear];
//    return;
//}


@end
