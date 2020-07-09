#import "FlutterYdFreshchatPlugin.h"
#import <flutter_yd_freshchat/flutter_yd_freshchat-Swift.h>

@implementation FlutterYdFreshchatPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterYdFreshchatPlugin registerWithRegistrar:registrar];
}
@end

