//
//  XYZViewController.h
//  PlyerPlyer
//
//  Created by 老李 on 15-10-15.
//  Copyright (c) 2015年 Li. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface XYZViewController : UIViewController<AVAudioPlayerDelegate>
{
    UIImageView * middleDiTu;
    UIImageView * middleZhuanPan;
    UIImageView * xiaoquanImageView;
    NSTimer * middleViewTimer;
    
    int angle;
    
    UILabel * songNameLabel;
    int imageCount;
    AVAudioPlayer * musicPlyer;
    UIButton * play;
    UIButton * play1;
    
    NSMutableArray * songArray;
    int dijishouge;
    
    NSMutableArray * photoArray;
    
    UISlider * slider;
    BOOL Cang;
    
    BOOL svChange;
    NSTimer * svChangeTimer;
    
    UIProgressView * progress;//进度条
    NSTimer * progressTimer;
    NSArray * dipanPhoto;
}
@end
