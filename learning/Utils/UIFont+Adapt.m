//
//  UIFont+Adapt.m
//  learning
//
//  Created by 王守允 on 2020/7/25.
//  Copyright © 2020 ives. All rights reserved.
//

#import "UIFont+Adapt.h"

@implementation UIFont (Adapt)

+ (UIFont *)ht_systemFontOfSize:(CGFloat)fontSize{
    CGFloat width =[[UIScreen mainScreen] bounds].size.width;
    CGFloat scale = width / 375.0;
    return [UIFont ht_systemFontOfSize:fontSize * scale];
}

+ (void)load{
    Method systemMethod = class_getClassMethod([UIFont class], @selector(systemFontSize:));
    
    Method htMethod = class_getClassMethod([UIFont class], @selector(ht_systemFontOfSize:));
    
    method_exchangeImplementations(systemMethod, htMethod);
}

@end
