#import "RotationDetectorPlugin.h"
#if __has_include(<rotation_detector/rotation_detector-Swift.h>)
#import <rotation_detector/rotation_detector-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "rotation_detector-Swift.h"
#endif

@implementation RotationDetectorPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftRotationDetectorPlugin registerWithRegistrar:registrar];
}
@end
