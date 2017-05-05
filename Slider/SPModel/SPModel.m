//
//  SPModel.m
//  Slider
//
//  Created by 洪福清 on 2017/5/5.
//  Copyright © 2017年 BJTYL. All rights reserved.
//

#import "SPModel.h"

@implementation SPModel

+ (BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}

- (instancetype)initWithData:(NSData *)data
{
    return [self initWithData:data error:nil];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    return [self initWithDictionary:dict error:nil];
}

- (instancetype)initWithString:(NSString *)string
{
    return [self initWithString:string error:nil];
}




@end
