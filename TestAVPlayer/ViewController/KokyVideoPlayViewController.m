//
//  KokyVideoPlayViewController.m
//  TestAVPlayer
//
//  Created by xujing on 16/11/18.
//  Copyright © 2016年 xujing. All rights reserved.
//

#import "KokyVideoPlayViewController.h"

@interface KokyVideoPlayViewController ()

@property (assign,nonatomic) NSTimer * timer;
@property (strong,nonatomic) NSMutableArray * danmu;

@end

@implementation KokyVideoPlayViewController
- (UIView *)videoView{
    
    UIView * videoView = [[UIView alloc] init];
    CGFloat w = self.view.frame.size.width;
    CGFloat h = w;
    CGFloat x = 0;
    CGFloat y = 104;
    videoView.backgroundColor = [UIColor blackColor];
    videoView.frame = CGRectMake(x, y, w, h);
    
    [self.view addSubview:videoView];
    return videoView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
}

-(void)viewWillDisappear:(BOOL)animated{
   
    [self.videoPlayer.player pause];
    [self.videoPlayer.timer invalidate];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
