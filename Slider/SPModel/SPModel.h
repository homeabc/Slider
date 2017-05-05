//
//  SPModel.h
//  Slider
//
//  Created by 洪福清 on 2017/5/5.
//  Copyright © 2017年 BJTYL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPModel : JSONModel


- (instancetype)initWithDictionary:(NSDictionary *)dict;

- (instancetype)initWithData:(NSData *)data;

- (instancetype)initWithString:(NSString *)string;



@end
