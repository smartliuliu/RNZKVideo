import PropTypes from 'prop-types';
import React, { Component } from 'react';
import { requireNativeComponent } from 'react-native';


class ZKVideoView extends Component {
  componentWillUnmount() {
    this.tearDownPlayer();
  }

  // rn 调用 ios 属性
  setNativeProps(nativeProps) {
    this.video.setNativeProps(nativeProps);
  }

  // 开始播放
  startPlayer = () => {
    this.setNativeProps({ startPlay: true });
  };

  // 关闭播放器
  tearDownPlayer = () => {
    this.setNativeProps({ teardownPlay: true });
  };

  // 暂停
  pausedPlay = () => {
    this.setNativeProps({ pausedPlay: true });
  };

  // 重播
  replay = () => {
    this.setNativeProps({ replay: true });
  };

  // oc 回调给 rn
  _onEnd = (event) => {
    if (this.props.onEnd) {
      this.props.onEnd(event.nativeEvent);
    }
  };

  _onBuffer = (event) => {
    if (this.props.onBuffer) {
      this.props.onBuffer(event.nativeEvent);
    }
  };

  _onError = (event) => {
    if (this.props.onError) {
      this.props.onError(event.nativeEvent);
    }
  };

  _onProgress = (event) => {
    if (this.props.onProgress) {
      this.props.onProgress(event.nativeEvent);
    }
  };

  _onDuration = (event) => {
    if (this.props.onDuration) {
      this.props.onDuration(event.nativeEvent);
    }
  };

  _onBack = (event) => {
    if (this.props.onBack) {
      this.props.onBack(event.nativeEvent);
    }
  };

  _onEnterFullScreen = (event) => {
    if (this.props.onEnterFullScreen) {
      this.props.onEnterFullScreen(event.nativeEvent);
    }
  };

  _onEnterPortrait = (event) => {
    if (this.props.onEnterPortrait) {
      this.props.onEnterPortrait(event.nativeEvent);
    }
  };

  render() {
    return (
      <RNVideo
        ref={(video) => { this.video = video; }}
        onVideoEnd={this._onEnd}
        onVideoBuffer={this._onBuffer}
        onVideoError={this._onError}
        onVideoProgress={this._onProgress}
        onVideoDuration={this._onDuration}
        onVideoBack={this._onBack}
        onVideoEnterFullScreen={this._onEnterFullScreen}
        onVideoEnterPortrait={this._onEnterPortrait}
        {...this.props}
      />);
  }
}

ZKVideoView.propTypes = {
  /* Native only */
  coverImageUrl: PropTypes.string,
  smoothArray: PropTypes.array,
  smoothIndex: PropTypes.number,
  urlString: PropTypes.string,
  ratesArray: PropTypes.array,
  rateIndex: PropTypes.number,
  videoTitle: PropTypes.string,
  seekTime: PropTypes.number,
  playInBackground: PropTypes.bool,
  isOnlyFullScreen: PropTypes.bool,
  shouldAutorotate: PropTypes.bool,
  muted: PropTypes.bool,
  videoScale: PropTypes.string, // contain, cover, stretch

  /* Wrapper component */
  onEnd: PropTypes.func,
  onBuffer: PropTypes.func,
  onError: PropTypes.func,
  onProgress: PropTypes.func,
  onDuration: PropTypes.func,
  onBack: PropTypes.func,
  onEnterFullScreen: PropTypes.func,
  onEnterPortrait: PropTypes.func,
};

const RNVideo = requireNativeComponent('RNZKPlayerVideo', ZKVideoView);
// const Constants = UIManager.RNQYKPlayerVideo.Constants;

export default ZKVideoView;
