//
//  ListViewController.m
//  PlyerPlyer
//
//  Created by 老李 on 15-10-15.
//  Copyright (c) 2015年 Li. All rights reserved.
//

#import "ListViewController.h"

@interface ListViewController ()

@end

@implementation ListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    songTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, 320, 460)];
    songTable.dataSource = self;//数据源协议代理
    songTable.delegate = self;  //代理协议代理
    
    
    [self.view addSubview:songTable];
    
    songArray = [[NSArray alloc]initWithObjects:@"Call Me Maybe - Carly Rae Jepsen",@"Moves Like Jagger - Maroon 5,Christina Aguilera",@"下雨天 - 南拳妈妈",@"关不上的窗 - 周传雄",@"明年今日 - 陈奕迅",@"李白 - 李荣浩",@"王妃 - 萧敬腾", nil];


}
#pragma mark 数据源协议方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"123");
    
    return songArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * cellIdentifier = @"cell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        NSLog(@"321");
        
    }
    cell.textLabel.text = [songArray objectAtIndex:indexPath.row];
    return cell;
}
#pragma mark 代理协议方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"258");
    [self dismissViewControllerAnimated:YES completion:nil];
    
    if ([self.delegate respondsToSelector:@selector(jieshouIndex:)])//判断协议方法是否响应 respondsToSelector:判断
    {
        [self.delegate jieshouIndex:indexPath.row];//row:行
    }
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
