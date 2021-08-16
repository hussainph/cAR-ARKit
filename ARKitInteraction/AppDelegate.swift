/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Application's delegate.
*/

import UIKit
import ARKit
import ARVideoKit
import Flutter
import FlutterPluginRegistrant

@UIApplicationMain
class AppDelegate: FlutterAppDelegate {
    lazy var flutterEngine = FlutterEngine(name: "cARFlutter")
    override func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        flutterEngine.run()
        GeneratedPluginRegistrant.register(with: self.flutterEngine)
        guard ARWorldTrackingConfiguration.isSupported else {
            fatalError("""
                ARKit is not available on this device. For apps that require ARKit
                for core functionality, use the `arkit` key in the key in the
                `UIRequiredDeviceCapabilities` section of the Info.plist to prevent
                the app from installing. (If the app can't be installed, this error
                can't be triggered in a production scenario.)
                In apps where AR is an additive feature, use `isSupported` to
                determine whether to show UI for launching AR experiences.
            """) // For details, see https://developer.apple.com/documentation/arkit
        }

        return true
    }
    
    override func applicationWillResignActive(_ application: UIApplication) {
        if let viewController = self.window?.rootViewController as? ViewController {
            viewController.blurView.isHidden = false
        }
    }
    
    override func applicationDidBecomeActive(_ application: UIApplication) {
        if let viewController = self.window?.rootViewController as? ViewController {
            viewController.blurView.isHidden = true
        }
    }
    
    override func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
    return ViewAR.orientation
    }

}
