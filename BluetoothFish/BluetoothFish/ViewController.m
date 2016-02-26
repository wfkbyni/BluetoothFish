//
//  ViewController.m
//  BluetoothFish
//
//  Created by Mac on 15/11/23.
//  Copyright © 2015年 舒永超. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    // 电量
    UIImageView *batteryView;
    
    // 蓝牙
    UIButton *bluetoothBtn;
    
    //
    UIButton *eyesBtn;
    
    //
    UIButton *earBtn;
    
    // 设置
    UIButton *settingBtn;
    
    // 白天 夜晚背景图
    UIImageView *backgroundView;
    
    // 水view
    UIImageView *waterView;
    
    // 鱼浮漂
    UIImageView *bouyView;
    
    // 太阳还是月亮
    UIImageView *moonOrSun;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initActionView];
    
    //NSArray *picArray = @[@"background_night",@"moon",@"water_night",@"buoy_night"];
    NSArray *picArray = @[@"background_day",@"sun",@"water_day",@"buoy_day"];
    
    [self initContentView:picArray];
    
}

/**
 *  初始化View
 *  
 *  -- 最上部分view
 */
- (void)initActionView{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
    
    batteryView = [[UIImageView alloc] initWithFrame:CGRectMake(32, 10, 56, 25)];
    [batteryView setImage:[UIImage imageNamed:@"battery3"]];
    [view addSubview:batteryView];
    
    bluetoothBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [bluetoothBtn setFrame:CGRectMake(CGRectGetMaxX(batteryView.frame) + 12, CGRectGetMinY(batteryView.frame), 18, 25)];
    [bluetoothBtn setImage:[UIImage imageNamed:@"bluetooth"] forState:UIControlStateNormal];
    [view addSubview:bluetoothBtn];
    
    eyesBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [eyesBtn setFrame:CGRectMake(CGRectGetMaxX(bluetoothBtn.frame) + 12, 12 , 36, 20)];
    [eyesBtn setImage:[UIImage imageNamed:@"eyes1"] forState:UIControlStateNormal];
    [view addSubview:eyesBtn];
    
    earBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [earBtn setFrame:CGRectMake(CGRectGetMaxX(eyesBtn.frame) + 12, 9 , 17, 26)];
    [earBtn setImage:[UIImage imageNamed:@"ear1"] forState:UIControlStateNormal];
    [view addSubview:earBtn];
    
    settingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [settingBtn setFrame:CGRectMake(CGRectGetMaxX(view.frame) - 25, 9 , 25, 26)];
    [settingBtn setImage:[UIImage imageNamed:@"setting"] forState:UIControlStateNormal];
    [view addSubview:settingBtn];
    
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithCustomView:view];
    self.navigationItem.rightBarButtonItem = item1;
}

/**
 *  初始化view内的UI(背景图，鱼漂等）
 */
- (void)initContentView:(NSArray *)array{
    
    CGRect frame = self.view.frame;
    frame.origin.y = 64;
    
    backgroundView = [[UIImageView alloc] initWithFrame:frame];
    backgroundView.image = [UIImage imageNamed:array[0]];
    [self.view addSubview:backgroundView];
    
    moonOrSun = [[UIImageView alloc] initWithFrame:CGRectMake(12, frame.origin.y + 10, 78, 78)];
    moonOrSun.image = [UIImage imageNamed:array[1]];
    [self.view addSubview:moonOrSun];
    
    frame = self.view.frame;
    bouyView = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - 19) / 2, (frame.size.height - 180 - 30 - 40), 19, 180)];
    bouyView.image = [UIImage imageNamed:array[3]];
    [self.view addSubview:bouyView];
    
    frame = CGRectMake(0, frame.size.height - 145 - 40, frame.size.width, 145);
    waterView = [[UIImageView alloc] initWithFrame:frame];
    waterView.image = [UIImage imageNamed:array[2]];
    [self.view addSubview:waterView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
