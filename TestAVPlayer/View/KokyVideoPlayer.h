//
//  KokyVideoPlayer.h
//  TestAVPlayer
//
//  Created by xujing on 16/11/18.
//  Copyright © 2016年 xujing. All rights reserved.
//

@import AVFoundation;
@import UIKit;
//
//#import <AVFoundation/AVFoundation.h>
//#import <UIKit/UIKit.h>

@interface KokyVideoPlayer : UIView

/** 播放器 */
@property (strong,nonatomic) AVPlayer * player;
/** 定时器 */
@property (assign,nonatomic) NSTimer * timer;
@property (strong,nonatomic) AVPlayerItem * playerItem;

- (instancetype)initKokyVideoPlayer;

@end
