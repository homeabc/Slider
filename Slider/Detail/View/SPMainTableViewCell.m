//
//  SPHelpTableViewCell.m
//  EarthInfomation
//
//  Created by 洪福清 on 2017/3/22.
//  Copyright © 2017年 BJTYL. All rights reserved.
//

#import "SPMainTableViewCell.h"
#import "SPMainDetailModel.h"




@interface SPMainTableViewCell ()

@property (strong, nonatomic) UIImageView *icoImageView;

/**名称*/
@property (strong, nonatomic) UILabel *nameLabel;

/**时间*/
@property (strong, nonatomic) UILabel *timeLabel;

/**内容*/
@property (strong, nonatomic) UILabel *contentLabels;

@property (strong, nonatomic) UILabel *findLabel;


@end

@implementation SPMainTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    frame.size.height -=1;
    [super setFrame:frame];    
}

- (void)setup
{
    WS(ws);
    [self.contentView addSubview:self.icoImageView];
    [self.icoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(ws.contentView).offset(10);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    [self.contentView addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws.icoImageView.mas_right).offset(10);
        make.top.mas_equalTo(ws.mas_top).offset(10);
        make.right.mas_equalTo(ws.contentView);
    }];
    
    [self.contentView addSubview:self.timeLabel];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws.icoImageView.mas_right).offset(10);
        make.top.mas_equalTo(ws.nameLabel.mas_bottom).offset(0);
        make.right.mas_equalTo(ws.contentView);
    }];
    
    [self.contentView addSubview:self.contentLabels];
    [self.contentLabels mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws.mas_left).offset(60);
        make.top.mas_equalTo(ws.timeLabel.mas_bottom).offset(5);
        make.right.mas_equalTo(ws.contentView);
    }];
    
    [self.contentView addSubview:self.findLabel];
    [self.findLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ws.mas_left).offset(0);
        make.top.mas_equalTo(ws.contentLabels.mas_bottom).offset(5);
        make.right.mas_equalTo(ws.contentView);
    }];
    
    
}


-(void)setModels:(SPMainDetailModel *)models
{
    _models = models;
    
    self.nameLabel.text = models.title;
    self.timeLabel.text = [NSString stringWithFormat:@"%@    %@",models.time,models.time];
    self.contentLabels.text = models.intro;
    
    
}


-(UIImageView *)icoImageView
{
    if (_icoImageView == nil) {
        _icoImageView = [[UIImageView alloc] init];
        NSString *type = [[NSUserDefaults standardUserDefaults] objectForKey:@"HELPTYPE"];        
        NSString *imageStr = [NSString stringWithFormat:@"help_%@",type];
        _icoImageView.image = [UIImage imageNamed:imageStr];
    }
    return _icoImageView;
}

-(UILabel *)nameLabel
{
    if (_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont boldSystemFontOfSize:16];
        _nameLabel.numberOfLines = 0;
        _nameLabel.textColor = [UIColor colorWithHexString:@"#323232"];
    }
    return _nameLabel;
}

-(UILabel *)timeLabel
{
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.font = [UIFont systemFontOfSize:12];
        _timeLabel.textColor = [UIColor colorWithHexString:@"#343434"];
        
    }
    return _timeLabel;
}

-(UILabel *)contentLabels
{
    if (_contentLabels == nil) {
        _contentLabels = [[UILabel alloc] init];
        _contentLabels.font = [UIFont systemFontOfSize:14];
        _contentLabels.numberOfLines = 0;
        _contentLabels.textColor = [UIColor colorWithHexString:@"#2f2f2f"];

    }
    return _contentLabels;
}

-(UILabel *)findLabel
{
    if (_findLabel == nil) {
        _findLabel = [[UILabel alloc] init];
        _findLabel.font = [UIFont systemFontOfSize:12];
        _findLabel.textAlignment = NSTextAlignmentCenter;
        _findLabel.text = @"查看全文";
    }
    return _findLabel;
}










@end
