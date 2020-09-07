//
//  HTFriendCircleVC.m
//  learning
//
//  Created by 王守允 on 2020/8/30.
//  Copyright © 2020 ives. All rights reserved.
//

#import "HTFriendCircleVC.h"
#import "Masonry.h"
#import "FriendCircleCell.h"

@interface HTFriendCircleVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *circleTableView;
@end

@implementation HTFriendCircleVC{
    NSArray *datas;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.circleTableView.rowHeight = UITableViewAutomaticDimension;
    self.circleTableView.estimatedRowHeight = 100;
    [self.view addSubview:self.circleTableView];
    
    [_circleTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(44, 0, 34, 0));
    }];
    
    datas =@[
        @{@"header":@"panda.jpg",@"name":@"王大拿",@"content":@"一片叶子跟毛毛虫交朋友，整棵树都要遭殃。",@"imgs":@[@"panda.jpg",@"panda.jpg",@"panda.jpg",@"panda.jpg"]},
        @{@"header":@"panda.jpg",@"name":@"王大拿",@"content":@"秋天是美丽的，在曼妙的韵律中舞着她的裙摆。",@"imgs":@[@"panda.jpg",@"panda.jpg"]},
        @{@"header":@"panda.jpg",@"name":@"王大拿",@"content":@"真诚都会有一点瑕疵，只有圆滑才能滴水不漏。",@"imgs":@[@"panda.jpg",@"panda.jpg",@"panda.jpg"]},
        @{@"header":@"panda.jpg",@"name":@"王大拿",@"content":@"风行水上，原来只是路过。那些不朽的传奇，在诞生的那一刻，并不是为了流传。",@"imgs":@[@"panda.jpg",@"panda.jpg",@"panda.jpg",@"panda.jpg",@"panda.jpg",@"panda.jpg",@"panda.jpg",@"panda.jpg",@"panda.jpg"]},
        @{@"header":@"panda.jpg",@"name":@"王大拿",@"content":@"越是没有能力选择自己生活的人，越是庸碌无知的人，越喜欢嘲笑那些有勇气去承受压力的人。",@"imgs":@[@"panda.jpg",@"panda.jpg",@"panda.jpg",@"panda.jpg",@"panda.jpg",@"panda.jpg"]},
        @{@"header":@"panda.jpg",@"name":@"王大拿",@"content":@"因爱生忧，因爱生怖；若离于爱着，无忧亦无怖。",@"imgs":@[@"panda.jpg",@"panda.jpg",@"panda.jpg",@"panda.jpg",@"panda.jpg",@"panda.jpg",@"panda.jpg"]},
        @{@"header":@"panda.jpg",@"name":@"王大拿",@"content":@"如果你不放弃等待，生活总会升起一轮红日照亮你。",@"imgs":@[@"panda.jpg",@"panda.jpg",@"panda.jpg",@"panda.jpg",@"panda.jpg",@"panda.jpg",@"panda.jpg",@"panda.jpg",@"panda.jpg"]},
        @{@"header":@"panda.jpg",@"name":@"王大拿",@"content":@"现代人并无自怜的时间，不能倒下来，只得学习刚强。",@"imgs":@[@"panda.jpg"]},
        @{@"header":@"panda.jpg",@"name":@"王大拿",@"content":@"无法安定的感觉不是回家，而是不断流浪与持续漂泊。",@"imgs":@[@"panda.jpg",@"panda.jpg",@"panda.jpg"]},
        @{@"header":@"panda.jpg",@"name":@"王大拿",@"content":@"人之所以痛苦，一是因为求之不得，二是因为舍之不得。",@"imgs":@[@"panda.jpg",@"panda.jpg",@"panda.jpg",@"panda.jpg",@"panda.jpg"]},
        @{@"header":@"panda.jpg",@"name":@"王大拿",@"content":@"给自己，给他人，给更多事物多一点原谅、信任和理解。",@"imgs":@[@"panda.jpg",@"panda.jpg",@"panda.jpg",@"panda.jpg",@"panda.jpg",@"panda.jpg",@"panda.jpg"]},
        @{@"header":@"panda.jpg",@"name":@"王大拿",@"content":@"匍匐是条长路，我在岁月的这端，企图触摸你斑驳的温暖。",@"imgs":@[@"panda.jpg",@"panda.jpg",@"panda.jpg",@"panda.jpg",@"panda.jpg"]},
    ];
    [_circleTableView reloadData];
    
}

#pragma mark TableView Datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FriendCircleCell *cell = [FriendCircleCell cellWithTableView:tableView];
    NSDictionary *dic = datas[indexPath.row];
    [cell fillWithItem:dic];
    return cell;
}


- (UITableView *)circleTableView{
    if (!_circleTableView) {
        _circleTableView =[[UITableView alloc]init];
        _circleTableView.delegate = self;
        _circleTableView.dataSource = self;
    }
    return _circleTableView;
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
