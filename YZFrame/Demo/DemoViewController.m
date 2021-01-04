/************************************************************
 Class    : DemoViewController.m
 Describe : 示例代码
 Company  : Micyo
 Author   : Yanzheng
 Date     : 2018-10-30
 Version  : 1.0
 Declare  : Copyright © 2018 Yanzheng. All rights reserved.
 ************************************************************/

#import "DemoViewController.h"

#import "YZFrame.h"

@interface DemoViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) YZPermission *yzPermission;   // 权限访问控制类

@property (nonatomic, strong) UILabel *titleLabel;          // 标题标签
@property (nonatomic, strong) UITableView *tableView;       // 自定义表格列表视图
@property (nonatomic, strong) NSArray *data;                // 数据

@end

@implementation DemoViewController

static NSString *const cellReuseIdentifier = @"cellReuseIdentifier";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Demo";
    self.view.backgroundColor = UIColor.whiteColor;
    
    //if (@available(iOS 13.0, *))
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
                  @{@"code" : @"2", @"name" : @"加解密（请查看控制台）"},
                  @{@"code" : @"3", @"name" : @"HUD提示框"},
                  @{@"code" : @"4", @"name" : @"YZAuthID指纹ID/面容ID"},
                  @{@"code" : @"5", @"name" : @"YZPermission权限访问"},
                  @{@"code" : @"6", @"name" : @"YZJsonUtil转换"},
                  @{@"code" : @"7", @"name" : @"YZSandBoxUtil存储读取"},
                  @{@"code" : @"8", @"name" : @"YZVerify校验方法"},
                  @{@"code" : @"9", @"name" : @"YZLocationConverterUtil经纬度转换"},
                  @{@"code" : @"10", @"name" : @"YZIPAddressUtil获取IP地址"},
                  @{@"code" : @"11", @"name" : @"YZRoundedBorder自定义多圆角视图标签"},
                  @{@"code" : @"12", @"name" : @"YZUserDefaule存储读取"},
                  @{@"code" : @"13", @"name" : @"YZDate日期类型格式转换"}
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
    cell.textLabel.textColor = UIColor.whiteColor;
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
        NSString *str = @"Yanzheng";
        NSString *key = @"https://github.com/micyo202";
        DLog(@"原始字符串：%@", str);
        DLog(@"Salt撒盐：%@", [YZSalt encryptString:str length:2]);
        DLog(@"Base64编码：%@", [YZBase64 encodeString:str]);
        DLog(@"Base64解码：%@", [YZBase64 decodeString:@"WWFuemhlbmc="]);
        DLog(@"AES加密：%@", [YZAES encryptString:str key:key]);
        DLog(@"AES解密：%@", [YZAES decryptString:@"YgdQb8aHUwy+6mzuHEMdkA==" key:key]);
        DLog(@"MD5加密：%@", [YZMD5 encryptString:str]);
    }
    if(3 == code){
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction *showTipMessageInView = [UIAlertAction actionWithTitle:@"showTipMessageInView" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [MBProgressHUD showTipMessageInView:@"提示信息"];
        }];
        UIAlertAction *showSuccessMessage = [UIAlertAction actionWithTitle:@"showSuccessMessage" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [MBProgressHUD showSuccessMessage:@"提示信息"];
        }];
        UIAlertAction *showInfoMessage = [UIAlertAction actionWithTitle:@"showInfoMessage" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [MBProgressHUD showInfoMessage:@"提示信息"];
        }];
        UIAlertAction *showWarnMessage = [UIAlertAction actionWithTitle:@"showWarnMessage" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [MBProgressHUD showWarnMessage:@"提示信息"];
        }];
        UIAlertAction *showErrorMessage = [UIAlertAction actionWithTitle:@"showErrorMessage" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [MBProgressHUD showErrorMessage:@"提示信息"];
        }];
        UIAlertAction *showTopTipMessage = [UIAlertAction actionWithTitle:@"showTopTipMessage" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [MBProgressHUD showTopTipMessage:@"提示信息" isWindow:YES];
        }];
        UIAlertAction *showActivityMessageInView = [UIAlertAction actionWithTitle:@"showActivityMessageInView" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [MBProgressHUD showActivityMessageInView:@"加载中..." delay:2.f];
        }];
        UIAlertAction *showActivity = [UIAlertAction actionWithTitle:@"showActivity" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [SVProgressHUD showActivityDelay:2.f];
        }];
        UIAlertAction *showActivityMessage = [UIAlertAction actionWithTitle:@"showActivityMessage" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [SVProgressHUD showActivityMessage:@"加载中..." delay:2.f];
        }];
        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"Default" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            DLog(@"Default");
        }];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            DLog(@"Cancel");
        }];
        UIAlertAction *destructiveAction = [UIAlertAction actionWithTitle:@"Destructive" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
            DLog(@"Destructive");
        }];
        
        [alertController addAction:showTipMessageInView];
        [alertController addAction:showSuccessMessage];
        [alertController addAction:showInfoMessage];
        [alertController addAction:showWarnMessage];
        [alertController addAction:showErrorMessage];
        [alertController addAction:showTopTipMessage];
        [alertController addAction:showActivityMessageInView];
        [alertController addAction:showActivity];
        [alertController addAction:showActivityMessage];
        [alertController addAction:defaultAction];
        [alertController addAction:cancelAction];
        [alertController addAction:destructiveAction];
        
        [self presentViewController:alertController animated:YES completion:nil];

    }
    if(4 == code){
        [[YZAuthID alloc] yz_showAuthIDWithDescribe:nil block:^(YZAuthIDState state, NSError *error) {
            if (state == YZAuthIDStateSuccess) {    // TouchID/FaceID验证成功
                DLog(@"验证成功");
            }else{
                DLog(@"验证失败");
            }
        }];
    }
    if(5 == code){
        // 所有权限需在info.plist文件中添加
        self.yzPermission = [[YZPermission alloc] init];
        [self.yzPermission checkLocationWithStatus:^(PermissionStatus status) {
            NSLog(@"%ld", status);
        }];
        /*
        [YZPermission checkCalendarsWithStatus:^(PermissionStatus status) {
            NSLog(@"%ld", status);
        }];
        */
    }
    if(6 == code){
        NSArray *obj = @[@{@"id" : @"1", @"name" : @"Java"}, @{@"id" : @"2", @"name" : @"Scala"}, @{@"id" : @"3", @"name" : @"Objective-C"}];
        NSString *jsonStr = [YZJsonUtil JSONStringWithDictionaryOrArray:obj];
        DLog(@"%@", jsonStr);
    }
    if(7 == code){
        YZSandBoxUtil *yzSandBoxUtil = [[YZSandBoxUtil alloc] init];
        [yzSandBoxUtil writeData:@{@"uuid" : @"xxx"} fileName:@"testFile"]; // 写入
        DLog(@"%@", [yzSandBoxUtil readDataWithFileName:@"testFile"]);                   // 读取
        [yzSandBoxUtil removeFileName:@"testFile"];                         // 删除
    }
    if(8 == code){
        DLog(@"%@", [YZVerify checkEmoji:@"嘻嘻☺️哈哈"] ? @"包含表情返回YES" : @"没有表情返回NO");
    }
    if(9 == code){
        CLLocationCoordinate2D locationCoordinate2D = CLLocationCoordinate2DMake(34.229047, 108.953198);
        NSLog(@"bd09: latitude=%f, longitude=%f", locationCoordinate2D.latitude, locationCoordinate2D.longitude);
        CLLocationCoordinate2D coverterLocationCoordinate2D = [YZLocationConverterUtil bd09ToGcj02:locationCoordinate2D];
        DLog(@"gcj02: latitude=%f, longitude=%f", coverterLocationCoordinate2D.latitude, coverterLocationCoordinate2D.longitude);
    }
    if(10 == code){
        YZIPAddressUtil *ipUtil = [[YZIPAddressUtil alloc] init];
        DLog(@"IP地址为%@", [ipUtil getIPAddress:YES]);
    }
    if(11 == code){
        [self presentViewController:[[NSClassFromString(@"DemoRoundedBorderViewController") alloc] init] animated:YES completion:nil];
    }
    if(12 == code){
        [YZUserDefault saveUserDefaultObject:@{@"username" : @"Micyo", @"password" : @"123456"} key:@"UserInfo"];
        NSDictionary *userInfo = [YZUserDefault getUserDefaultObjectByKey:@"UserInfo"];
        DLog(@"%@", userInfo);
        [YZUserDefault removeObjectWithKey:@"UserInfo"];
        NSDictionary *userInfoAfter = [YZUserDefault getUserDefaultObjectByKey:@"UserInfo"];
        DLog(@"%@", userInfoAfter);
    }
    if(13 == code){
        NSDate *now = [NSDate date];
        NSString *timestamp = [NSString stringWithFormat:@"%ld", (long)[now timeIntervalSince1970]];
        DLog(@"%@", timestamp);
        DLog(@"%ld", [now year]);
        DLog(@"%ld", [now month]);
        DLog(@"%ld", [now day]);
        DLog(@"%ld", [now hour]);
        DLog(@"%ld", [now minute]);
        DLog(@"%ld", [now seconds]);
        DLog(@"%ld", [now weekday]);
        
        DLog(@"%@", [NSDate yz_dateWithFormat_yyyy_MM_string:@"2021-01-03 16:19:08"]);
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
