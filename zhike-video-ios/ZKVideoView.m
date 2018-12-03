//
//  ZKVideoView.m
//  RNZhikeAVVideo
//
//  Created by liu on 2018/11/27.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import "ZKVideoView.h"

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

@end
