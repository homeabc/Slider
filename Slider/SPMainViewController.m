//
//  SPMainViewController.m
//  Slider
//
//  Created by 洪福清 on 2017/5/5.
//  Copyright © 2017年 BJTYL. All rights reserved.
//

#import "SPMainViewController.h"
#import "SPSliderViewController.h"
#import "SPMainModel.h"
#import "SPMainDetailViewController.h"

@interface SPMainViewController ()<SPSlideViewControllerDelegate>


@property (strong, nonatomic) UIView *topMenuContainerView;

@property (strong, nonatomic) UIView *containerView;

@property (strong, nonatomic) UICollectionView *mySegmentBar;


@property (strong, nonatomic) SPSliderViewController *slideViewController;


@property (copy, nonatomic) NSString *selectedId;


@property (strong, nonatomic) NSMutableArray *modelArr;

@property (strong, nonatomic) NSMutableArray *vcArr;

@property (assign, nonatomic) NSInteger previousIndex;




@end


@implementation SPMainViewController


- (void)viewDidLoad
{
    
    [super viewDidLoad];
    [self initDatas];
    self.previousIndex = -1;
    
    
    
    [self requestSecondMenuCategotyData];
    
    self.view.backgroundColor = [UIColor colorWithRed:235/255.0 green:234/255.0 blue:241/255.0 alpha:1];
    
    
}

//之前数据
- (void)initDatas
{
    WS(ws);
    [self.view addSubview:self.topMenuContainerView];
    [self.topMenuContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(40.0);
        make.left.right.mas_equalTo(ws.view);
    }];
    
    [self.view addSubview:self.containerView];
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.topMenuContainerView.mas_bottom);
        make.left.right.bottom.mas_equalTo(ws.view);
    }];
    
    [self.topMenuContainerView addSubview:self.mySegmentBar];
    [self.mySegmentBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(ws.topMenuContainerView);
        make.height.mas_equalTo(self.mySegmentBar.frame.size.height);
    }];
}


-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    NSLog(@"topMenuContainerView:%@",NSStringFromCGRect(self.topMenuContainerView.frame));
    
    NSLog(@"containerView:%@",NSStringFromCGRect(self.containerView.frame));
    
    NSLog(@"mySegmentBar:%@",NSStringFromCGRect(self.mySegmentBar.frame));
}



#pragma mark - slideViewController delegate
- (void)slideViewController:(SPSliderViewController *)slideViewController didSelectViewIndex:(NSInteger)selectViewIndex
{
    SPMainModel *model = [self.modelArr objectAtIndex:selectViewIndex];
    self.selectedId = model.categoryId;
    
    if ([self.selectedId integerValue] == self.previousIndex) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"same" object:self.selectedId];
    }
    
    self.previousIndex = [self.selectedId integerValue];
    
}



#pragma mark - private even
- (void)addViewControllerToSliderViewControllr
{
    [self.vcArr removeAllObjects];
    
    for (NSUInteger indexValue = 0; indexValue < self.modelArr.count; indexValue ++) {
        SPMainModel *model = [self.modelArr objectAtIndex:indexValue];
        UIViewController *vc = nil;
        
        NSMutableDictionary *tempDic = [[NSMutableDictionary alloc] init];
        [tempDic setObject:model.categoryId forKey:@"maincataroyid"];
        vc = [[SPMainDetailViewController alloc] initWithDictionary:tempDic];
        
        if (vc) {
            vc.title = model.showName;
            [self.vcArr addObject:vc];
        }
    }
    self.slideViewController.viewControllers = self.vcArr;
    
    
}

- (void)requestSecondMenuCategotyData
{
    
    WS(ws);
    
    NSString *filePath  = [[NSBundle mainBundle] pathForResource:@"data.json" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:filePath];//获取指定路径的data文件
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
    NSArray *menuCategorysArr = [dict objectForKey:@"menu_categorys"];
    for (NSDictionary *tempDic in menuCategorysArr) {
        SPMainModel *model = [[SPMainModel alloc] initWithDictionary:tempDic];
        [ws.modelArr addObject:model];
    }
    
    SPMainModel *model = ws.modelArr[0];
    ws.selectedId = model.categoryId;
    
    
    [ws addViewControllerToSliderViewControllr];
    
    
}

- (UIView *)topMenuContainerView
{
    if (_topMenuContainerView == nil) {
        _topMenuContainerView = [[UIView alloc] init];
        _topMenuContainerView.backgroundColor = SPColor(36, 149, 207);
        
    }
    return _topMenuContainerView;
}

- (UIView *)containerView
{
    if (_containerView == nil) {
        self.slideViewController = [[SPSliderViewController alloc] initWithViewControllers:@[]];
        self.slideViewController.indicatorInsets = UIEdgeInsetsMake(0, 10, 0, 10);
        self.slideViewController.segmentBarType = SPSegmentBarTypeDynamicWidth;
        self.slideViewController.segmentBarHeight = 40.0f;
        //        self.slideViewController.hideSegmentBar = YES;//以前是这个
        self.slideViewController.hideSegmentBar = YES;//这个设置为no的话下面就多了一个
        self.slideViewController.delegate = self;
        [self addChildViewController:self.slideViewController];
        _containerView = self.slideViewController.view;
        _mySegmentBar = self.slideViewController.segmentBar;
        
    }
    return _containerView;
}


-(NSMutableArray *)modelArr
{
    if (_modelArr == nil) {
        _modelArr = [[NSMutableArray alloc] init];
    }
    return _modelArr;
}


- (NSMutableArray *)vcArr
{
    if (_vcArr == nil) {
        _vcArr = [NSMutableArray array];
    }
    return _vcArr;
}

- (NSString *)selectedId
{
    if (_selectedId == nil) {
        _selectedId = [[NSString alloc] init];
    }
    return _selectedId;
}

@end
