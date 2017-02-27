//
//  ViewController.m
//  TestAVPlayer
//
//  Created by xujing on 16/11/18.
//  Copyright © 2016年 xujing. All rights reserved.
//
#import "ViewController.h"
#import "KokyVideoPlayer.h"
#import "KokyVideoPlayViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)playVideo:(id)sender {
    
    //加载本地视频
    NSString * urlString = [[NSBundle mainBundle] pathForResource:@"fqcpoCRD53~eOgnQL~jn9A__.mp4" ofType:nil];
    NSURL * url = [NSURL fileURLWithPath:urlString];
    
    KokyVideoPlayViewController *playerVC = [[KokyVideoPlayViewController alloc]init];

    KokyVideoPlayer *player = [[KokyVideoPlayer alloc]initKokyVideoPlayer];
    playerVC.videoPlayer = player;

    player.playerItem = [AVPlayerItem playerItemWithURL:url];
    
    player.frame = CGRectMake(0, 0, playerVC.view.frame.size.width, playerVC.view.frame.size.width);
    [playerVC.videoView addSubview:player];
    
    [self.navigationController pushViewController:playerVC animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
