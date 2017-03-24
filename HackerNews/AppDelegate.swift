//
//  AppDelegate.swift
//  HackerNews
//
//  Copyright (c) 2015 Amit Burstein. All rights reserved.
//  See LICENSE for licensing information.
//

import UIKit
import MobileCenter
import MobileCenterAnalytics
import MobileCenterCrashes
import MobileCenterDistribute

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  // MARK: Properties
  
  let GlobalTintColor = UIColor(red: 1.0, green: 0.4, blue: 0.0, alpha: 1.0)
  
  var window: UIWindow?
  
  // MARK: UIApplicationDelegate
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    configureUI()
    MSMobileCenter.start("288cea35-bef6-4ea0-978e-9cce93eca4b9", withServices:[
      MSAnalytics.self,
      MSCrashes.self,
      MSDistribute.self
      ])
    MSAnalytics.trackEvent("My application launched", withProperties: ["Category" : "start"])
    return true
  }
  
  func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
    
    // Pass the URL to MSDistribute.
    MSDistribute.open(url as URL!)
    return true
  }
  
  
  
  // MARK: Functions
  
  func configureUI() {
    window?.tintColor = GlobalTintColor
  }
}
