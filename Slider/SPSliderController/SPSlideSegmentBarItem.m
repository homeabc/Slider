
//  Created by 洪福清 on 2017/5/5.
//  Copyright © 2017年 BJTYL. All rights reserved.
//


#import "SPSlideSegmentBarItem.h"
#import "UIColor+SPAddition.h"

@interface SPSlideSegmentBarItem()


@end

@implementation SPSlideSegmentBarItem

#pragma mark - life cycle
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    [self.contentView addSubview:self.titleLabel];
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    if (selected) {
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textColor = [UIColor whiteColor];
    } else {
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textColor = [UIColor colorWithHexString:@"b5d0eb"];
    }
}

#pragma mark - getter and setter
- (UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] initWithFrame:self.contentView.bounds];
        _titleLabel.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textColor = [UIColor colorWithHexString:@"b5d0eb"];
        _titleLabel.backgroundColor = [UIColor clearColor];
    }
    return _titleLabel;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
}



@end
