//
//  ZKVideoView.m
//  RNZhikeAVVideo
//
//  Created by liu on 2018/11/27.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import "ZKVideoView.h"
#import "ZhikeOrientation.h"

@implementation ZKVideoView

- (void)setStartPlay:(BOOL)startPlay {
    _startPlay = startPlay;
    [self playVideo];
}

- (void)setTeardownPlay:(BOOL)teardownPlay {
    _teardownPlay = teardownPlay;
    [self teardownPlayer];
}

- (void)setPausedPlay:(BOOL)pausedPlay {
    _pausedPlay = pausedPlay;
    [self pausedVideo];
}

- (void)setReplay:(BOOL)replay {
    _replay = replay;
    [self replayVideo];
}

- (void)setVideoScale:(NSString *)videoScale {
    _videoScale = videoScale;
    if ([videoScale isEqualToString:@"cover"]) {
        self.scalingMode = AVLayerVideoGravityResizeAspectFill;
    } else if ([videoScale isEqualToString:@"stretch"]) {
        self.scalingMode = AVLayerVideoGravityResize;
    } else {
        self.scalingMode = AVLayerVideoGravityResizeAspect;
    }
}

- (void)setChangeOrientation:(NSInteger)changeOrientation {
    
    UIInterfaceOrientation orientation = UIInterfaceOrientationPortrait;
    
    if(changeOrientation == 1) {
        orientation = UIInterfaceOrientationLandscapeLeft;
    } else if (changeOrientation == 2) {
        orientation = UIInterfaceOrientationLandscapeRight;
    }
    
    // 当前屏幕的方向
    UIInterfaceOrientation nowOrientation = [UIApplication sharedApplication].statusBarOrientation;
    // 如果相同，则不需要强制旋转
    if (orientation == nowOrientation) {
        return;
    }
    
    _changeOrientation = changeOrientation;
    
    UIInterfaceOrientationMask type = (changeOrientation == 1 || changeOrientation == 2) ? UIInterfaceOrientationMaskLandscape : UIInterfaceOrientationMaskPortrait;
    [ZhikeOrientation setOrientation:type];
    [ZhikeOrientation changeOrientation:orientation];
}

@end
