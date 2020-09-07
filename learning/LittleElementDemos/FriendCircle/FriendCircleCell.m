//
//  FriendCircleCell.m
//  learning
//
//  Created by 王守允 on 2020/8/30.
//  Copyright © 2020 ives. All rights reserved.
//

#import "FriendCircleCell.h"
#import "AutoSudokuView.h"
#import "Masonry.h"

@interface FriendCircleCell ()
@property (nonatomic, strong) UIImageView *headerImg;
@property (nonatomic, strong) UILabel *nameLbl;
@property (nonatomic, strong) UILabel *contentLbl;
@property (nonatomic, strong) AutoSudokuView *sudokuView;
@end

@implementation FriendCircleCell

+(instancetype) cellWithTableView:(UITableView *)tableView{
    static NSString *reuseId = @"AddressBookYear";
    FriendCircleCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];;
    if (cell == nil) {
        cell = [[FriendCircleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
    }
    
    return cell;
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    [self addSubViews];
    return self;
}

- (void)addSubViews {
    [self.contentView addSubview:self.headerImg];
    [self.contentView addSubview:self.nameLbl];
    [self.contentView addSubview:self.contentLbl];
    [self.contentView addSubview:self.sudokuView];
    
    [_headerImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@(0.12*SCREENW));
        make.top.equalTo(self.contentView.mas_top).offset(0.05*SCREENW);
        make.left.equalTo(self.contentView.mas_left).offset(0.05*SCREENW);
    }];
    
    [_nameLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(0.65*SCREENW));
        make.height.equalTo(@(0.05*SCREENW));
        make.left.equalTo(_headerImg.mas_right).offset(0.03*SCREENW);
        make.top.equalTo(self.contentView.mas_top).offset(0.05*SCREENW);
    }];
    
    [_contentLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(0.75*SCREENW));
        make.height.greaterThanOrEqualTo(@10);
        make.left.equalTo(_headerImg.mas_right).offset(0.03*SCREENW);
        make.top.equalTo(_nameLbl.mas_bottom).offset(0.02*SCREENW);
    }];
    
    [_sudokuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(0.7*SCREENW));
        make.height.greaterThanOrEqualTo(@10);
        make.left.equalTo(_headerImg.mas_right).offset(0.03*SCREENW);
        make.top.equalTo(_contentLbl.mas_bottom).offset(0.05*SCREENW);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-0.05*SCREENW);
    }];
}


- (void)fillWithItem:(NSDictionary *)item{
    _headerImg.image =[UIImage imageNamed:@"fire.png"];
    _nameLbl.text = item[@"name"];
    _contentLbl.text = item[@"content"];
    

    
        NSArray *arr = [item objectForKey:@"imgs"];
        _sudokuView.buttonCount = arr.count;
        _sudokuView.imgs = arr;
    
}


#pragma mark -- 懒加载 --

- (UIImageView *)headerImg {
    if (!_headerImg) {
        _headerImg = [[UIImageView alloc]init];
        _headerImg.layer.cornerRadius = 10;
    }
    return _headerImg;
}

- (UILabel *)nameLbl {
    if (!_nameLbl) {
        _nameLbl = [[UILabel alloc]init];
        _nameLbl.font = [UIFont boldSystemFontOfSize:15];
        _nameLbl.textColor = UIColor.blackColor;
    }
    return _nameLbl;
}

- (UILabel *)contentLbl {
    if (!_contentLbl) {
        _contentLbl = [[UILabel alloc]init];
        _contentLbl.numberOfLines = 0;
        _contentLbl.font = [UIFont systemFontOfSize:13];
        _contentLbl.textColor = UIColor.lightGrayColor;
    }
    return _contentLbl;
}

- (AutoSudokuView *)sudokuView {
    if (!_sudokuView) {
        _sudokuView = [[AutoSudokuView alloc]initWithMaxWidth:SCREENW*0.7];
    }
    return _sudokuView;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
