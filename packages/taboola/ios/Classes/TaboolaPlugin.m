#import "TaboolaPlugin.h"
#if __has_include(<taboola/taboola-Swift.h>)
#import <taboola/taboola-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "taboola-Swift.h"
#endif

@implementation TaboolaPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftTaboolaPlugin registerWithRegistrar:registrar];
}
@end
