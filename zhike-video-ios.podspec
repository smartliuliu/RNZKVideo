
Pod::Spec.new do |s|

  s.name         = "zhike-video-ios"
  s.version      = "0.0.3"
  s.summary      = "video for iOS develop"

  s.homepage     = "https://github.com/smartliuliu/RNZKVideo"
  s.license      = "MIT"
  s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author        = { "liu" => "1172436954@qq.com" }
  s.platform     = :ios, '7.0'
  s.source       = { :git => "https://github.com/smartliuliu/RNZKVideo.git", :tag => s.version }
  s.source_files  = "zhike-video-ios/**/*.{h,m}",'Pods/**/*.{h,m}'
  #s.exclude_files = "zhike-video-ios/Exclude"
  s.public_header_files = "zhike-video-ios/**/*.h"

  s.dependency 'ZhikeVideo'
  s.dependency 'React'
  s.requires_arc = true

end
