
//  Created by 洪福清 on 2017/5/5.
//  Copyright © 2017年 BJTYL. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface NSString (SPGetSize)

- (CGSize)spSizeWithFont:(UIFont *)font;

- (CGSize)spSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;

- (CGSize)spSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode;

- (CGSize)spSizeWithFont:(UIFont *)font maxSize:(CGSize)size lineBreakMode:(NSLineBreakMode)mode;


@end
