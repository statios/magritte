//
//  Int.swift
//  magritte
//
//  Created by KIHYUN SO on 2021/03/02.
//

import Foundation
import UIKit

extension Int {
  var color: UIColor {
    let red = CGFloat(self as Int >> 16 & 0xff) / 255
    let green = CGFloat(self >> 8 & 0xff) / 255
    let blue  = CGFloat(self & 0xff) / 255
    return UIColor(red: red, green: green, blue: blue, alpha: 1)
  }
}
