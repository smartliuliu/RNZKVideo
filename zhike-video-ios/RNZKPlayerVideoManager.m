//
//  RNZKPlayerVideoManager.m
//  RNZhikeAVVideo
//
//  Created by liu on 2018/11/27.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import "RNZKPlayerVideoManager.h"
#import "ZKVideoView.h"

@interface RNZKPlayerVideoManager()<ZhikePlayerViewDelegate>
@end

@implementation RNZKPlayerVideoManager

RCT_EXPORT_MODULE();


- (UIView *)view {
  ZKVideoView *view =  [[ZKVideoView alloc] init];
  view.isRN = YES;
  view.delegate = self;
  return view;
}


RCT_EXPORT_VIEW_PROPERTY(coverImageUrl, NSString);
RCT_EXPORT_VIEW_PROPERTY(smoothArray,NSArray);
RCT_EXPORT_VIEW_PROPERTY(smoothIndex, NSInteger);
RCT_EXPORT_VIEW_PROPERTY(urlString, NSString);
RCT_EXPORT_VIEW_PROPERTY(ratesArray, NSArray);
RCT_EXPORT_VIEW_PROPERTY(rateIndex, NSInteger);
RCT_EXPORT_VIEW_PROPERTY(videoTitle, NSString);
RCT_EXPORT_VIEW_PROPERTY(playInBackground, BOOL);
RCT_EXPORT_VIEW_PROPERTY(isOnlyFullScreen, BOOL);
RCT_EXPORT_VIEW_PROPERTY(shouldAutorotate, BOOL);
RCT_EXPORT_VIEW_PROPERTY(muted, BOOL);
RCT_EXPORT_VIEW_PROPERTY(seekTime, CGFloat);

/************* RN 独有 属性***********************/

RCT_EXPORT_VIEW_PROPERTY(startPlay, BOOL);
RCT_EXPORT_VIEW_PROPERTY(replay, BOOL);
RCT_EXPORT_VIEW_PROPERTY(teardownPlay, BOOL);
RCT_EXPORT_VIEW_PROPERTY(pausedPlay, BOOL);
RCT_EXPORT_VIEW_PROPERTY(videoScale, NSString);
RCT_EXPORT_VIEW_PROPERTY(changeOrientation, NSInteger);

RCT_EXPORT_VIEW_PROPERTY(onVideoBack, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onVideoEnd, RCTBubblingEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onVideoBuffer, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onVideoError, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onVideoProgress, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onVideoDuration, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onVideoEnterFullScreen, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onVideoEnterPortrait, RCTBubblingEventBlock);
/************* RN 独有 属性***********************/

//RCT_EXPORT_METHOD(playVideo) {
//  NSLog(@"1111");
//}
//- (NSDictionary *)constantsToExport
//{
//  return @{@"QYKPlayerStopState": @(QYKPlayerStopState),
//           @"QYKPlayerStartState": @(QYKPlayerStartState),
//           @"QYKPlayertearDownState": @(QYKPlayertearDownState),
//           };
//}


- (void)zhikePlayerBack:(id)sender {
  ZKVideoView *view = (ZKVideoView *)sender;
  view.onVideoBack(@{@"target": view.reactTag});
}

/** 播放进度 */
- (void)zhikePlayerCurrentTime:(NSTimeInterval)currentTime sender:(id)sender {
  ZKVideoView *view = (ZKVideoView *)sender;
  view.onVideoProgress(@{@"currentTime": [NSNumber numberWithFloat:currentTime],
                         @"target": view.reactTag});
}
/** 播放总时间 */
- (void)zhikePlayerDurationTime:(NSTimeInterval)duration sender:(id)sender {
  ZKVideoView *view = (ZKVideoView *)sender;
  view.onVideoDuration(@{@"duration": [NSNumber numberWithFloat:duration],
                         @"target": view.reactTag});
}
/** 缓存进度 */
- (void)zhikePlayerBufferTime:(NSTimeInterval)bufferTime sender:(id)sender {
  ZKVideoView *view = (ZKVideoView *)sender;
  view.onVideoBuffer(@{@"bufferTime": [NSNumber numberWithFloat:bufferTime],
                         @"target": view.reactTag});
}
/** 播放结束 */
- (void)zhikePlayerPlayEnded:(id)sender {
  ZKVideoView *view = (ZKVideoView *)sender;
  view.onVideoEnd(@{@"target": view.reactTag});
}

/** 播放出现错误 */
- (void)zhikePlayerPlayFailed:(id)sender {
  ZKVideoView *view = (ZKVideoView *)sender;
  view.onVideoError(@{@"target": view.reactTag});
}

/** 横屏播放（根据自己业务处理， 如存在导航条，那么横屏需要隐藏） */
- (void)zhikePlayerEnterFullScreen:(id)sender {
  ZKVideoView *view = (ZKVideoView *)sender;
  view.onVideoEnterFullScreen(@{@"target": view.reactTag});
}
/** 竖屏播放 */
- (void)zhikePlayerEnterPortrait:(id)sender {
  ZKVideoView *view = (ZKVideoView *)sender;
  view.onVideoEnterPortrait(@{@"target": view.reactTag});
}


@end
