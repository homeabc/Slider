//
//  SPHelpDetailModel.m
//  EarthInfomation
//
//  Created by 洪福清 on 2017/3/22.
//  Copyright © 2017年 BJTYL. All rights reserved.
//

#import "SPMainDetailModel.h"




@implementation SPMainDetailModel

+(JSONKeyMapper *)keyMapper
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:@"myid" forKey:@"id"];

    [dict setObject:@"url" forKey:@"url"];
    [dict setObject:@"Title" forKey:@"title"];
    [dict setObject:@"CreatTime" forKey:@"time"];
    [dict setObject:@"Abstract" forKey:@"intro"];
    [dict setObject:@"Author" forKey:@"editor"];
    
    return [[JSONKeyMapper alloc] initWithDictionary:dict];
    
}


//计算高度
-(CGFloat)cellHeights
{
    if (_cellHeights) {
        return _cellHeights;
    }
    
    //第一个view的高度
    //距离上10间距
    _cellHeights +=10;
    
    //标题文字高度
    CGSize textMaxSize = CGSizeMake(SP_SCREEN_WIDTH-50, MAXFLOAT);
    _cellHeights += [self.title boundingRectWithSize:textMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName :[UIFont boldSystemFontOfSize:16]} context:nil].size.height;
    
    //时间文字高度
    _cellHeights += [self.time boundingRectWithSize:textMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName :[UIFont boldSystemFontOfSize:12]} context:nil].size.height;
    
    // 时间和内容距离
    _cellHeights +=5;
    
    //详细内容高度
    CGSize contentMaxSize = CGSizeMake(SP_SCREEN_WIDTH-60, MAXFLOAT);
    _cellHeights += [self.intro boundingRectWithSize:contentMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName :[UIFont systemFontOfSize:14]} context:nil].size.height;
    
    //距离上下共10；
    _cellHeights +=10;
    //查看全文
    CGSize findLabel = CGSizeMake(SP_SCREEN_WIDTH, MAXFLOAT);
    _cellHeights += [@"查看全文" boundingRectWithSize:findLabel options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName :[UIFont systemFontOfSize:12]} context:nil].size.height;
    
    
    _cellHeights +=1;
    return _cellHeights;
    
    
}



@end
