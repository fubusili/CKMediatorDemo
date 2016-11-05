//
//  ViewController.m
//  CKMediatorDemo
//
//  Created by Clark on 2016/11/5.
//  Copyright © 2016年 CK. All rights reserved.
//

#import "ViewController.h"
#import "CKMediator+TargetActionA.h"

NSString * const kCellIdentifier = @"kCellIdentifier";

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSource;

@end


@implementation ViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"ck";
    [self.view addSubview:self.tableView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        UIViewController *viewController = [[CKMediator sharedInstance] fetchViewController];
        
        // 获得view controller之后，在这种场景下，到底push还是present，其实是要由使用者决定的，mediator只要给出view controller的实例就好了
        [self presentViewController:viewController animated:YES completion:nil];
    }
    
    if (indexPath.row == 1) {
        UIViewController *viewController = [[CKMediator sharedInstance] fetchViewController];
        [self.navigationController pushViewController:viewController animated:YES];
    }
    
    if (indexPath.row == 2 ) {
        [[CKMediator sharedInstance] presentViewControllerToShowInfo:nil];
    }
    
    if (indexPath.row == 3 ) {
        [[CKMediator sharedInstance] presentViewCotrollerToShowImage:[UIImage imageNamed:@"ios_10_wallpaper"]];

    }
    
    if (indexPath.row == 4) {
        [[CKMediator sharedInstance] showAlertWithMessage:@"ck" cancelAction:nil confirmAction:^(NSDictionary *info) {
            // 做你想做的事
            NSLog(@"%@", info);
        }];
    }
}

#pragma mark - getters and setters
- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellIdentifier];
    }
    return _tableView;
}

- (NSArray *)dataSource
{
    if (_dataSource == nil) {
        _dataSource = @[@"present view controller", @"push view controller", @"present view controller action not found",@"present view controller to show image", @"show alert"];
    }
    return _dataSource;
}



@end
