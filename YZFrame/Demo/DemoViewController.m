/************************************************************
 Class    : DemoViewController.m
 Describe : 实例代码
 Company  : Micyo
 Author   : Yanzheng
 Date     : 2018-10-30
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import "DemoViewController.h"

#import "YZFrame.h"

@interface DemoViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UILabel *titleLabel;      // 标题标签
@property (nonatomic, strong) UITableView *tableView;   // 自定义表格列表视图
@property (nonatomic, strong) NSArray *data;            // 数据

@end

@implementation DemoViewController

static NSString *const cellReuseIdentifier = @"cellReuseIdentifier";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Demo";
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self.view addSubview:self.titleLabel];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellReuseIdentifier];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

#pragma mark - 懒加载各组件
- (UILabel *)titleLabel {
    if(!_titleLabel){
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.frame = CGRectMake(0, HEIGTH_STATUS_BAR, WIDTH_SCREEN, HEIGHT_NAVIGATION_BAR);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = UIColor.blackColor;
        _titleLabel.font = FontBoldSize(15.f);
        _titleLabel.text = @"Demo";
    }
    return _titleLabel;
}

- (UITableView *)tableView {
    
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, HEIGHT_TOP, WIDTH_SCREEN, HEIGHT_SCREEN - HEIGHT_TOP) style:UITableViewStylePlain];
        _tableView.backgroundColor = RgbColor(239, 239, 244, 1);
        _tableView.separatorInset = UIEdgeInsetsZero;   // 设置分割线位置，UIEdgeInsetsZero：左侧右侧没有间距
        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;// 拖动时隐藏键盘
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];// 去除底部多余分割线
        // 关闭默认的预估高度效果
        _tableView.estimatedRowHeight = 0;// 行高度
        _tableView.estimatedSectionHeaderHeight = 0;// 头视图高度
        _tableView.estimatedSectionFooterHeight = 0;// 脚视图高度
    }
    
    return _tableView;
    
}

- (NSArray *)data {
    if(!_data){
        _data = @[
                  @{@"code" : @"1", @"name" : @"DLog日志输出（请查看控制台）"},
                  @{@"code" : @"2", @"name" : @"asd"},
                  @{@"code" : @"3", @"name" : @"dsa"},
                  @{@"code" : @"4", @"name" : @"dsa"},
                  @{@"code" : @"5", @"name" : @"das"},
                  @{@"code" : @"6", @"name" : @"das"},
                  @{@"code" : @"7", @"name" : @"das"},
                  @{@"code" : @"8", @"name" : @"s"},
                  @{@"code" : @"9", @"name" : @"s"},
                  @{@"code" : @"10", @"name" : @"s"},
                  @{@"code" : @"11", @"name" : @"s"},
                  @{@"code" : @"12", @"name" : @"s"},
                  @{@"code" : @"13", @"name" : @"s"},
                  @{@"code" : @"14", @"name" : @"s"},
                  @{@"code" : @"15", @"name" : @"s"},
                  @{@"code" : @"16", @"name" : @"s"}
                  ];
    }
    return _data;
}

#pragma mark - <UITableView>表格数据代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseIdentifier];
    cell.backgroundColor = RandomColor;
    NSString *name = [self.data[indexPath.row] objectForKey:@"name"];
    cell.textLabel.text = name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    //UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath]; // 获取当前点击cell
    NSInteger code = [[self.data[indexPath.row] objectForKey:@"code"] integerValue];
    if(1 == code){
        DLog(@"测试输出日志...");
    }
    if(2 == code){
        
    }
    if(3 == code){
        
    }
    if(4 == code){
        
    }
    if(5 == code){
        
    }
    if(6 == code){
        
    }
    if(7 == code){
        
    }
    if(8 == code){
        
    }
    if(9 == code){
        
    }
    if(10 == code){
        
    }
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
