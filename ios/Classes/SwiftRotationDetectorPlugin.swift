import Flutter
import UIKit

public class SwiftRotationDetectorPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "rotation_detector", binaryMessenger: registrar.messenger())
    let instance = SwiftRotationDetectorPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if ("getRotationStatus" == call.method) {
        result(false)
    } else {
        result(FlutterMethodNotImplemented)
    }
  }
}
