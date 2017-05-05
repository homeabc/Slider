//
//  SPMainDetailViewController.m
//  Slider
//
//  Created by 洪福清 on 2017/5/5.
//  Copyright © 2017年 BJTYL. All rights reserved.
//

#import "SPMainDetailViewController.h"
#import "MJRefresh.h"
#import "SPMainDetailModel.h"
#import "SPMainTableViewCell.h"
#import "SPHttpManager.h"


@interface SPMainDetailViewController ()<UITableViewDelegate,UITableViewDataSource>

/**su*/
@property (strong, nonatomic) UITableView *tableView;


/**s*/
@property (copy, nonatomic) NSString *SelectIdString;


/**s*/
@property (strong, nonatomic) NSMutableArray *modelArray;



@end

@implementation SPMainDetailViewController

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    if (self = [super init]) {
        self.SelectIdString = [dictionary objectForKey:@"maincataroyid"];
        
    }
    return self;
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addController];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sameIndaata:) name:@"same" object:nil];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    [self.tableView.mj_header beginRefreshing];
    
    
    
}

- (void)sameIndaata:(NSNotification *)nofifa
{
    [self.tableView.mj_header beginRefreshing];
    
}


- (void)addController
{
    
    WS(ws);
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(ws.view);
        make.top.mas_equalTo(ws.view.mas_top).offset(0);
        make.bottom.mas_equalTo(0);
    }];
    
}




-(UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.bounces = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor colorWithRed:235/255.0 green:234/255.0 blue:241/255.0 alpha:1];
        _tableView.tableFooterView = [[UIView alloc] init];
        
    }
    return _tableView;
}


- (void)loadNewData
{
    
    NSString *postString = [NSString stringWithFormat:@"/DZDC/muser/getAllList.action?jsonString={\"pageIndex\":\"0\",\"pageSize\":\"20\",\"type\":\"%@\"}",self.SelectIdString];
    
    [SPHttpManager postWithPath:postString params:nil success:^(id responseObject) {
        
        self.modelArray = [NSMutableArray array];
        NSArray *array = [responseObject objectForKey:@"data"];
        for (NSDictionary *dict in array) {
            SPMainDetailModel *models = [[SPMainDetailModel alloc] initWithDictionary:dict];
            [self.modelArray addObject:models];
        }
        
        
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
        
    } failure:^(NSError *error) {
        [self.tableView.mj_header endRefreshing];
        
        NSLog(@"%@",error);
    }];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.modelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellId";
    SPMainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[SPMainTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    SPMainDetailModel *model = self.modelArray[indexPath.row];
    cell.models = model;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SPMainDetailModel *model = self.modelArray[indexPath.row];
    return model.cellHeights;
    
}


@end
