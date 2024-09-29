import Flutter
import UIKit
import GoogleMaps                                          // Add this import

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
    let apiChannel = FlutterMethodChannel(name: "com.ttech.attendance/api", binaryMessenger: controller.binaryMessenger)
    
 
apiChannel.setMethodCallHandler({ (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      if call.method == "setApiKeys" {
        if let args = call.arguments as? [String: Any],
           let iosApiKey = args["iosApiKey"] as? String {
          // Initialize Google Maps API key for iOS
          GMSServices.provideAPIKey(iosApiKey)
          result("iOS API key set successfully")
        } else {
          result(FlutterError(code: "ERROR", message: "iOS API key not provided", details: nil))
        }
      } else {
        result(FlutterMethodNotImplemented)
      }
    })
   

    GeneratedPluginRegistrant.register(with: self)

       // Provide the API key
      // GMSServices.provideAPIKey("AIzaSyDcOtmHQ11CTjw_s6DFXH8dwFCOux6CYr8")
          return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
