//
//  ZKVideoView.h
//  RNZhikeAVVideo
//
//  Created by liu on 2018/11/27.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import <React/RCTView.h>
#import "ZhikePlayerContainView.h"

@interface ZKVideoView : ZhikePlayerContainView

@property (nonatomic, copy) RCTBubblingEventBlock onVideoBack;
@property (nonatomic, copy) RCTBubblingEventBlock onVideoEnd;
@property (nonatomic, copy) RCTBubblingEventBlock onVideoBuffer;
@property (nonatomic, copy) RCTBubblingEventBlock onVideoError;
@property (nonatomic, copy) RCTBubblingEventBlock onVideoProgress;
@property (nonatomic, copy) RCTBubblingEventBlock onVideoDuration;
@property (nonatomic, copy) RCTBubblingEventBlock onVideoEnterFullScreen;
@property (nonatomic, copy) RCTBubblingEventBlock onVideoEnterPortrait;

/** 填充模式 */
@property (nonatomic, strong) NSString *videoScale;
/** 开始播放 */
@property (nonatomic, assign) BOOL startPlay;
/** 重新播放 */
@property (nonatomic, assign) BOOL replay;
/** 暂停播放 */
@property (nonatomic, assign) BOOL pausedPlay;
/** 关闭播放器 */
@property (nonatomic, assign) BOOL teardownPlay;


@end

