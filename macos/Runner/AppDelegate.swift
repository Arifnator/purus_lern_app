import Cocoa
import FlutterMacOS

@main
class AppDelegate: FlutterAppDelegate {
  
  // Ensure the app terminates when the last window is closed
  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return true
  }
  
  // Opt-in to secure state restoration
  override func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
    return true
  }
}