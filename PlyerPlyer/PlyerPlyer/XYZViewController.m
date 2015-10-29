//
//  XYZViewController.m
//  PlyerPlyer
//
//  Created by 老李 on 15-10-15.
//  Copyright (c) 2015年 Li. All rights reserved.
//

#import "XYZViewController.h"

#import "ListViewController.h"
#define RADIUS 120   //define:定义

@interface XYZViewController ()

@end

@implementation XYZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    //设置背景图片
    //self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"musicBg.png"]];
    UIImageView * backgound = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
    backgound.image = [UIImage imageNamed:@"musicBg.png"];
    backgound.alpha = 0.8;
    [self.view addSubview:backgound];
    
    songArray = [[NSMutableArray alloc]initWithObjects:@"Call Me Maybe - Carly Rae Jepsen",@"Moves Like Jagger - Maroon 5,Christina Aguilera",@"下雨天 - 南拳妈妈",@"关不上的窗 - 周传雄",@"明年今日 - 陈奕迅",@"李白 - 李荣浩",@"王妃 - 萧敬腾", nil];
    
    photoArray = [[NSMutableArray alloc]initWithObjects:@"Carly1.jpg",@"maroon5 1.jpg",@"下雨天1.jpg",@"周传雄1.jpg",@"陈奕迅1.jpg",@"李荣浩1.jpg",@"萧敬腾1.jpg", nil];
    
    dipanPhoto = [[NSArray alloc]initWithObjects:@"Carly22.png",@"maroon5 22.png",@"下雨天22.png",@"周传雄22.png",@"陈奕迅22.png",@"李荣浩22.png",@"萧敬腾22.png", nil];
    //标题视图
    UIView * topView = [[UIView alloc]initWithFrame:CGRectMake(0, 20, 320, 40)];
    topView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:topView];
    //标题
    UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(130, 5, 60, 30)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.text = @"音乐";
    titleLabel.textAlignment = YES;
    [topView addSubview:titleLabel];
    //音乐按钮
    UIButton * soundBtn = [[UIButton alloc]initWithFrame:CGRectMake(280, 5, 30, 30)];
    soundBtn.backgroundColor = [UIColor clearColor];
    [soundBtn setBackgroundImage:[UIImage imageNamed:@"more_icon_nightmode.png"] forState:UIControlStateNormal];
    [soundBtn setBackgroundImage:[UIImage imageNamed:@"discover_icon_music_circle.png"] forState:UIControlStateHighlighted];
    [soundBtn addTarget:self action:@selector(yingCang) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:soundBtn];
    
    
    //底图视图
    UIView * middleView = [[UIView alloc]initWithFrame:CGRectMake(0, 60, 320, 320)];
    middleView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:middleView];
    //底图
    middleDiTu = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 320)];
    middleDiTu.image = [UIImage imageNamed:[photoArray objectAtIndex:0]];
    [middleView addSubview:middleDiTu];
    
        //转盘
    middleZhuanPan = [[UIImageView alloc]initWithFrame:CGRectMake(40, 40, 2*RADIUS, 2*RADIUS)];
    
    //设置圆角属性
    middleZhuanPan.layer.masksToBounds = YES;
    middleZhuanPan.layer.cornerRadius = RADIUS;
    middleZhuanPan.layer.borderWidth = 5;
    middleZhuanPan.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [middleView addSubview:middleZhuanPan];
    
    //转盘的中心小转盘
    xiaoquanImageView = [[UIImageView alloc]initWithFrame:CGRectMake(90, 90, 60, 60)];
    xiaoquanImageView.backgroundColor = [UIColor lightGrayColor];
    //设置圆角属性
    xiaoquanImageView.layer.masksToBounds = YES;
    xiaoquanImageView.layer.cornerRadius = 30;
    xiaoquanImageView.layer.borderWidth = 5;
    xiaoquanImageView.layer.borderColor = [UIColor darkGrayColor].CGColor;
    xiaoquanImageView.alpha = 0.5;
    [middleZhuanPan addSubview:xiaoquanImageView];
    
    play1 = [[UIButton alloc]initWithFrame:CGRectMake(5, 5, 50, 50)];
    [play1 setBackgroundImage:[UIImage imageNamed:@"player_btn_play_normal.png"] forState:UIControlStateNormal];
    [play1 addTarget:self action:@selector(playMusic) forControlEvents:UIControlEventTouchUpInside];//点击方法
    
    [xiaoquanImageView addSubview:play1];
    
    //歌名
    songNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 5, 320, 30)];
    songNameLabel.backgroundColor = [UIColor clearColor];
    songNameLabel.text = @"Call Me Maybe - Carly Rae Jepsen";
    songNameLabel.textColor = [UIColor orangeColor];
    songNameLabel.textAlignment = YES;
    [middleView addSubview:songNameLabel];
    
    
    middleViewTimer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(zhuandong) userInfo:nil repeats:YES];
    //开始时计时器暂停
    [middleViewTimer setFireDate:[NSDate distantFuture]];
    
    [self musicSong];
    //音乐暂停
    [musicPlyer pause];//    pause:暂停
    [musicPlyer prepareToPlay];   //预加载
    
    //创建低栏
    UIView * bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, 380, 320, 100)];
    bottomView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:bottomView];
    //播放按钮
    play = [[UIButton alloc]initWithFrame:CGRectMake(135, 15, 50, 50)];
    [play setBackgroundImage:[UIImage imageNamed:@"player_btn_play_normal.png"] forState:UIControlStateNormal];
    [play addTarget:self action:@selector(playMusic) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:play];
    
    //左边按钮
    UIButton * lastBtn = [[UIButton alloc]initWithFrame:CGRectMake(50, 5, 70, 70)];
    lastBtn.backgroundColor = [UIColor clearColor];
    [lastBtn setBackgroundImage:[UIImage imageNamed:@"hp_player_btn_pre_normal.png"] forState:UIControlStateNormal];
    [lastBtn addTarget:self action:@selector(lastSong) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:lastBtn];
    //右边按钮
    UIButton * nextBtn = [[UIButton alloc]initWithFrame:CGRectMake(200, 5, 70, 70)];
    nextBtn.backgroundColor = [UIColor clearColor];
    [nextBtn setBackgroundImage:[UIImage imageNamed:@"hp_player_btn_next_normal.png"] forState:UIControlStateNormal];
    [nextBtn addTarget:self action:@selector(nextSong) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:nextBtn];
    //歌曲列表
    UIButton * songList = [[UIButton alloc]initWithFrame:CGRectMake(270, 20, 40, 40)];
    [songList setBackgroundImage:[UIImage imageNamed:@"icon_manage_downloadingView.png"] forState:UIControlStateNormal];
    [songList addTarget:self action:@selector(songlist) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:songList];
    
    //滑竿
    slider = [[UISlider alloc]initWithFrame:CGRectMake(225, 80, 150, 20)];
    //设置滑点左右边颜色                                         
    slider.minimumTrackTintColor = [UIColor cyanColor];
    slider.maximumTrackTintColor =[UIColor yellowColor];
    slider.thumbTintColor = [UIColor redColor];
    
    [slider addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventValueChanged];//滑动方法
    //设置最小值最大值
    slider.minimumValue = 0.0;
    slider.maximumValue = 1.0;
    slider.maximumValueImage = [UIImage imageNamed:@"volumeBiggestSelected.tiff"];
    slider.value = musicPlyer.volume;//volume:音量  音乐音量赋给滑竿
    
    slider.transform = CGAffineTransformMakeRotation(M_PI_2);//逆时针旋转90度
    //让滑竿隐藏
    Cang = YES;
    //透明度为0;
    slider.alpha = 0.0;
    [middleView addSubview:slider];
    
                        //svChange = NO;//隐藏
                        //svChangeTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(svChangeTimerMethod) userInfo:nil repeats:YES];
    [svChangeTimer setFireDate:[NSDate distantFuture]];
    
    //进度条
    progress = [[UIProgressView alloc]initWithFrame:CGRectMake(50, 370, 220, 20)];
    progress.progressViewStyle = UIProgressViewStyleBar;//进度条风格
    progress.progressTintColor = [UIColor redColor];//进度条划过颜色
    progress.backgroundColor = [UIColor cyanColor];//背景颜色
    progress.trackTintColor = [UIColor lightGrayColor];//未划过颜色
    //progress.progress = 0.3;
    
    //progress.progress = musicPlyer.duration;//把音乐时间赋给进度条
    [self.view addSubview:progress];
    
    //进度条计时器:每0.5秒刷新一次进度条
    progressTimer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(refreshProgress) userInfo:nil repeats:YES];
    
    //NSString * duration = [NSString stringWithFormat:@"%f.2",musicPlyer.duration];
    
    UILabel * durationLabel = [[UILabel alloc]initWithFrame:CGRectMake(250, 380,50, 15)];
    durationLabel.text = @"03:13";
    [self.view addSubview:durationLabel];
    
    UILabel * stratLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 380,50, 15)];
    stratLabel.text = @"00:00";
    [self.view addSubview:stratLabel];
    
    //给主视图创建一个点击方法
    UITapGestureRecognizer * tapgesture  = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(lesspress:)];
    [self.view addGestureRecognizer:tapgesture];
}
//如果音量出现 点击任意位置消失
-(void)lesspress:(id)sender
{
    [self performSelector:@selector(hideSlider) withObject:nil afterDelay:0.5];//延迟1秒执行

}
-(void)hideSlider
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.0];
    //改变透明度
    slider.alpha = 0.0;
    Cang = YES;
    [UIView commitAnimations];
    
}

- (void)setProgress:(float)progress animated:(BOOL)animated
{
    
}
//刷新进度条
-(void)refreshProgress
{
                //    //取得歌曲总长度,以及当前播放进度,计算出进度
                //    float currentProgress = musicPlyer.currentTime/musicPlyer.duration;
                //    [progress setProgress:currentProgress animated:YES];
                //    //设置进度条当前显示
    
    progress.progress = musicPlyer.currentTime/musicPlyer.duration;//简写方式
}
-(void)yingCang
{
    NSLog(@"11111");
    if (Cang == YES) {
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:1.0];
        //改变透明度
        slider.alpha = 1.0;
        Cang = NO;
        [UIView commitAnimations];
    }
    else
    {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:1.0];
        //改变透明度
        slider.alpha = 0.0;
        Cang = YES;
        [UIView commitAnimations];
    }
}
//调节音量
-(void)valueChange:(UISlider *)temslider
{
    svChange = YES;
    //把音乐音量属性赋给滑竿
    musicPlyer.volume = temslider.value;
}
            //-(void)svChangeTimerMethod
            //{
            //    NSLog(@"256");
            //    if (svChange == YES) {
            //        //[self performSelector:@selector(hideSlider) withObject:nil afterDelay:3.0];//延迟3秒执行
            //        svChange = NO;
            //    }
            //    else
            //    {
            //        [self hideSlider];
            //    }
            //}
-(void)jieshouIndex:(int)cellIndex//协议方法
{
    dijishouge = cellIndex;
    [self musicSong];
    
}
-(void)musicSong
{
    middleZhuanPan.image = [UIImage imageNamed:[dipanPhoto objectAtIndex:dijishouge]];
    songNameLabel.text = [songArray objectAtIndex:dijishouge];
    //默认播放第一首歌
    
    //创建路径找路径
    NSString * payh = [[NSBundle mainBundle]pathForResource:[songArray objectAtIndex:dijishouge] ofType:@"mp3"];
    //把路径转化为url
    NSURL * url = [[NSURL alloc]initFileURLWithPath:payh];
    
    //把url给播放器
    musicPlyer = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
    //代理
    musicPlyer.delegate = self;
    [musicPlyer play];
    //改变背景图片
    middleDiTu.image = [UIImage imageNamed:[photoArray objectAtIndex:dijishouge]];
}
-(void)songlist//  传值方法
{
    ListViewController * listVC = [[ListViewController alloc]init];
    listVC.delegate = self;
    [self presentViewController:listVC animated:YES completion:nil];
    
}
-(void)playMusic
{
    if ([musicPlyer isPlaying]) {//如果音乐播放器播放 点击后音乐播放器暂停
        [musicPlyer pause];
        [play setBackgroundImage:[UIImage imageNamed:@"player_btn_pause_normal.png"] forState:UIControlStateNormal];
        [play1 setBackgroundImage:[UIImage imageNamed:@"player_btn_pause_normal.png"] forState:UIControlStateNormal];
        //计时器开始
        [middleViewTimer setFireDate:[NSDate distantFuture]];
    }
    else//否则 音乐播放器开始
    {
        [musicPlyer play];
        [play setBackgroundImage:[UIImage imageNamed:@"player_btn_play_normal.png"] forState:UIControlStateNormal];
        [play1 setBackgroundImage:[UIImage imageNamed:@"player_btn_play_normal.png"] forState:UIControlStateNormal];
        //计时器暂停
        [middleViewTimer setFireDate:[NSDate distantPast]];

    }
}
-(void)zhuandong
{
    angle = angle + 5;
    middleZhuanPan.transform = CGAffineTransformMakeRotation(angle * M_PI/180);
    //转到180度的时候,转盘翻转
    if (angle%180 == 0 ) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:1.0];
        middleZhuanPan.image = [UIImage imageNamed:[dipanPhoto objectAtIndex:dijishouge]];
        //让转盘翻转
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:middleZhuanPan cache:YES];
        
        [UIView commitAnimations];
    }
    
}

-(void)lastSong
{
    if (dijishouge == 0) {
        
        //当已经到了第一首歌,那么就需要从最后一首歌重新开始
        dijishouge = songArray.count - 1;
        middleZhuanPan.image = [UIImage imageNamed:[dipanPhoto objectAtIndex:dijishouge]];
    }
    else
    {
        dijishouge = dijishouge - 1;
        middleZhuanPan.image = [UIImage imageNamed:[dipanPhoto objectAtIndex:dijishouge]];
    }
    //调用转盘方法
    [self zhuandong];
    [self musicSong];

}
-(void)nextSong
{
    if (dijishouge == (songArray.count - 1)) {
        
        //当已经到了第一首歌,那么就需要从第一首歌重新开始
        dijishouge = 0;
        middleZhuanPan.image = [UIImage imageNamed:[dipanPhoto objectAtIndex:dijishouge]];
    }
    else
    {
        dijishouge = dijishouge + 1;
        middleZhuanPan.image = [UIImage imageNamed:[dipanPhoto objectAtIndex:dijishouge]];
    }
    //调用转盘方法
    [self zhuandong];
    //创建路径找路径
    [self musicSong];
    

}
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    //播放结束之后继续播放下一首
    if (flag == YES) {
        flag = YES;
        [self nextSong];

    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
