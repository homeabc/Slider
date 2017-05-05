//
//  SPHelpDetailModel.h
//  EarthInfomation
//
//  Created by 洪福清 on 2017/3/22.
//  Copyright © 2017年 BJTYL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPModel.h"
#import <UIKit/UIKit.h>



@interface SPMainDetailModel : SPModel


/**id*/
@property (copy, nonatomic) NSString *myid;


/**链接*/
@property (copy, nonatomic) NSString *url;

/**标题*/
@property (copy, nonatomic) NSString *title;

/**时间*/
@property (copy, nonatomic) NSString *time;

/**介绍*/
@property (copy, nonatomic) NSString *intro;

/** 作者*/
@property (copy, nonatomic) NSString *editor;



@property (nonatomic, assign) CGFloat cellHeights;

@end
