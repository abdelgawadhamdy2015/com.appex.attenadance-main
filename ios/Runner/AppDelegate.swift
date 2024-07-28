import Flutter
import UIKit
import GoogleMaps                                          // Add this import

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
   
// TODO: Add your Google Maps API key
    GMSServices.provideAPIKey("AIzaSyDcOtmHQ11CTjw_s6DFXH8dwFCOux6CYr8")               // Add this line
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
