#import "KhipuPayPlugin.h"
#if __has_include(<khipu_pay/khipu_pay-Swift.h>)
#import <khipu_pay/khipu_pay-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "khipu_pay-Swift.h"
#endif

@implementation KhipuPayPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftKhipuPayPlugin registerWithRegistrar:registrar];
}
@end
