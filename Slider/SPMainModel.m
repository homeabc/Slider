//
//  SPMainModel.m
//  Slider
//
//  Created by 洪福清 on 2017/5/5.
//  Copyright © 2017年 BJTYL. All rights reserved.
//

#import "SPMainModel.h"

@implementation SPMainModel

+(JSONKeyMapper*)keyMapper
{
    NSMutableDictionary *keyDict = [[NSMutableDictionary alloc] init];
    [keyDict setObject:@"categoryId" forKey:@"id"];
    [keyDict setObject:@"showName" forKey:@"show_name"];
    
    return [[JSONKeyMapper alloc] initWithDictionary:keyDict];
}



@end
