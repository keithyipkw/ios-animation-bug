//
//  TodayViewController.m
//  today
//
//  Created by Keith Yip on 3/4/2016.
//  Copyright © 2016 test. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

static BOOL oneItem = NO;

@interface TodayViewController ()
<
NCWidgetProviding,
UITableViewDelegate,
UITableViewDataSource
>
{
    NSArray *_items;
    UITableView *_tableView;
    BOOL _firstViewWillAppear;
}

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _firstViewWillAppear = YES;
    
    _items = [[NSMutableArray alloc] init];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.rowHeight = 44;
    [self.view addSubview:_tableView];
    
    [self reloadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    oneItem = !oneItem;
    
    if (!_firstViewWillAppear)
        [self reloadData];
    _firstViewWillAppear = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets {
    
    return UIEdgeInsetsMake(defaultMarginInsets.top, 0, 0, defaultMarginInsets.right);
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

//    [self reloadData];
    
    completionHandler(NCUpdateResultNewData);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.textLabel.textColor = [UIColor whiteColor];
    }
    cell.textLabel.text = _items[indexPath.row];
    return cell;
}

- (void)reloadData {
    if (oneItem)
        _items = @[@"Test 0", @"Test 1"];
    else
        _items = @[@"Test 0"];
    
    [_tableView reloadData];
    self.preferredContentSize = CGSizeMake(0, _items.count * _tableView.rowHeight);
}

@end
