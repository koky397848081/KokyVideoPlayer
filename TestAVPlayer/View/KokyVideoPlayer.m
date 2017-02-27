
//
//  KokyVideoPlayer.m
//  TestAVPlayer
//
//  Created by xujing on 16/11/18.
//  Copyright © 2016年 xujing. All rights reserved.
//

#import "KokyVideoPlayer.h"

@interface KokyVideoPlayer()

@property (weak,nonatomic) AVPlayerLayer * playerLayer;
@property (weak,nonatomic) UIImageView * imageView;
@property (weak,nonatomic) UIProgressView * progressView; // 进度条
@property (weak,nonatomic) UIButton * pauseButton; // 暂停按钮

@end

@implementation KokyVideoPlayer

- (instancetype)initKokyVideoPlayer
{
    self = [super init];
    if (self) {
        
        [self interfaceUI];
    }
    return self;
}

- (void)interfaceUI{
    // imageView
    UIImageView * imageView = [[UIImageView alloc] init];
    imageView.userInteractionEnabled = YES;
    self.imageView = imageView;
    [self addSubview:imageView];
    
    // 进度条
    UIProgressView * progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
    progressView.trackTintColor = [UIColor lightGrayColor];
    progressView.progressTintColor = [UIColor redColor];
    [self addSubview:progressView];
    
    self.progressView = progressView;
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(videoPlayerDidPause)];
    [imageView addGestureRecognizer:tap];
    
    //imageView.backgroundColor = [UIColor greenColor];
    
    // 创建播放器
    self.player = [[AVPlayer alloc] init];
    self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    [imageView.layer addSublayer:self.playerLayer];
    
    // 暂停按钮
    UIButton * pauseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.pauseButton = pauseButton;
    // 默认隐藏
    pauseButton.hidden = YES;
    [pauseButton setImage:[UIImage imageNamed:@"video_btn_pause_big"] forState:UIControlStateNormal];
    //pause.backgroundColor = [UIColor purpleColor];
    pauseButton.adjustsImageWhenHighlighted = NO;
    [pauseButton addTarget:self action:@selector(startPlay) forControlEvents:UIControlEventTouchDown];
    [self addSubview:pauseButton];
    
    [self removeTimer];
    
    // 添加定时器
    [self addTimer];
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.imageView.frame = self.bounds;
    
    // 进度条
    CGFloat w = self.frame.size.width;
    CGFloat h = 3;
    CGFloat x = 0;
    CGFloat y = self.imageView.frame.size.height - h;
    
    self.progressView.frame = CGRectMake(x, y  , w, h);
    self.progressView.backgroundColor = [UIColor yellowColor];
    self.playerLayer.frame = self.bounds;
    
    // 暂停按钮
    CGFloat pauseWidth = 50;
    CGFloat pauseHeight = pauseWidth;
    CGFloat pauseX = (self.frame.size.width - pauseWidth) * 0.5;
    CGFloat pauseY = (self.frame.size.height - pauseHeight) * 0.5;
    self.pauseButton.frame = CGRectMake(pauseX, pauseY, pauseWidth, pauseHeight);
    
}

/************开始播放****************/
- (void)startPlay{
    
    [self.player play];
    
    [self addTimer];
    self.pauseButton.hidden = YES;
}

/*************添加定时器****************/
- (void)addTimer{
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(update) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)update{
    
    CGFloat currentTime = CMTimeGetSeconds(self.player.currentTime);
    CGFloat durationTime = CMTimeGetSeconds(self.player.currentItem.duration);
    
    CGFloat percent = currentTime / durationTime;
    
    // 进度条replaceCurrentItemWithPlayerItem
    self.progressView.transform = CGAffineTransformMakeScale(1.0f,3.0f);
    self.progressView.progress = percent;
    [self.progressView setProgress:percent animated:YES];
    //    [self bringSubviewToFront:self.progressView];
    
    // 如果视频播放完，则关闭定时器
    if (currentTime == durationTime ) {
        
        [self removeTimer];
    }
}

/************暂停播放****************/
- (void)videoPlayerDidPause{
    
    [self.player pause];
    // 移除定时器
    [self removeTimer];
    self.pauseButton.hidden = NO;
}

/*************移除定时器****************/
- (void)removeTimer{
    
    [self.timer invalidate];
    self.timer = nil;
}

#pragma mark
#pragma mark  setter and getter

-(void)setPlayerItem:(AVPlayerItem *)playerItem{
    _playerItem = playerItem;
    [self.player replaceCurrentItemWithPlayerItem:playerItem];
    [self.player play];
}


@end
