//
//  ListViewController.h
//  PlyerPlyer
//
//  Created by 老李 on 15-10-15.
//  Copyright (c) 2015年 Li. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ChuanZhi<NSObject>//写协议

-(void)jieshouIndex:(int)cellIndex;//协议方法
@end

@interface ListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>//导入表视图协议
{
    UITableView * songTable;
    
    NSArray * songArray;
}
@property(nonatomic,assign)id<ChuanZhi>delegate;//设定协议代理
@end
