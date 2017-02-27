//
//  KokyVideoPlayViewController.h
//  TestAVPlayer
//
//  Created by xujing on 16/11/18.
//  Copyright © 2016年 xujing. All rights reserved.
//

@import UIKit;
//#import <UIKit/UIKit.h>
#import "KokyVideoPlayer.h"

@interface KokyVideoPlayViewController : UIViewController

/** 用于存放视频播放器的view */
@property (strong,nonatomic) UIView * videoView;
@property (strong,nonatomic) KokyVideoPlayer * videoPlayer;

@end
