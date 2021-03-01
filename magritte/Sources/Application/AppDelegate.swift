//
//  AppDelegate.swift
//  magritte
//
//  Created by KIHYUN SO on 2021/03/01.
//

import UIKit
import Then
import SnapKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
    window = UIWindow(frame: UIScreen.main.bounds).then {
      $0.rootViewController = CanvasViewController()
      $0.makeKeyAndVisible()
    }
    
    return true
  }
  
}

