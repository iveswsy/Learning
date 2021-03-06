//
//  FriendCircleCell.h
//  learning
//
//  Created by 王守允 on 2020/8/30.
//  Copyright © 2020 ives. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FriendCircleCell : UITableViewCell

- (void)fillWithItem:(NSDictionary *)item;
+(instancetype) cellWithTableView:(UITableView *)tableView;
@end

NS_ASSUME_NONNULL_END
