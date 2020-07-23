#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_yd_freshchat.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_yd_freshchat'
  s.version          = '1.0.0'
  s.summary          = 'A Flutter plugin for integrating Freshchat in your mobile app.'
  s.description      = <<-DESC
A Flutter plugin for integrating Freshchat in your mobile app.
                       DESC
  s.homepage         = 'https://github.com/yesdoctor/flutter_yd_freshchat'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Tint Naing Win' => 'tnw.yesdoctor@gmail.com' }
  s.source           = { :git => "https://github.com/freshdesk/freshchat-ios.git", :tag => "3.7.2" }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.dependency 'FreshchatSDK'
  s.resources        = "Classes/FreshchatSDK/FCResources.bundle", "Classes/FreshchatSDK/FreshchatModels.bundle", "Classes/FreshchatSDK/FCLocalization.bundle"
  s.ios.vendored_library = "Classes/FreshchatSDK/libFDFreshchatSDK.a"
  s.frameworks 			 = "Foundation", "AVFoundation", "AudioToolbox", "CoreMedia", "CoreData", "ImageIO", "Photos", "SystemConfiguration", "Security", "WebKit", "CoreServices"
  s.requires_arc     = true
  s.static_framework = true
  s.platform = :ios, '8.0'


  # Flutter.framework does not contain a i386 slice. Only x86_64 simulators are supported.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64' }
end
