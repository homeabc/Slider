//
//  SPMainModel.h
//  Slider
//
//  Created by 洪福清 on 2017/5/5.
//  Copyright © 2017年 BJTYL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPModel.h"

@interface SPMainModel : SPModel

/** 分类的id */
@property (nonatomic, strong) NSString *categoryId;


/** 分类名称 */
@property (nonatomic, strong) NSString *showName;

@end
