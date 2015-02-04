//
//  FavoriteThingsViewController.m
//  FavoriteThings-Objc
//
//  Created by Jordan Nelson on 2/4/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "FavoriteThingsViewController.h"

@interface FavoriteThingsViewController () <UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@end

@implementation FavoriteThingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // ** TableView initialization **
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    
    // ** Set TableViewDataSource as self **
    self.tableView.dataSource = self;
    
    //** DataSource Implementation **
    
    [self.view addSubview:self.tableView];
    
    // ** Allocation for default Cell via TableView with identifier "cell" **
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
}


#pragma mark - UITableVIew DataSource Methods


// ** 1. # of Rows - FavoriteThings Array.count
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self favoriteThings].count;
}

// ** 2. CellForRowAtIndexPath
// ** Initialize Cell to tableView dequesReusableCell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if(!cell){
        cell = [UITableViewCell new];
    }

    cell.textLabel.text = [self favoriteThings][indexPath.row];
    return cell;
}

-(NSArray *)favoriteThings
{
    return @[@"Breakfast", @"Lunch", @"Dinner", @"DevMtn"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
