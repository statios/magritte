//
//  Brush.swift
//  magritte
//
//  Created by KIHYUN SO on 2021/03/02.
//

import UIKit
import SwiftyDraw

extension Brush {
  var image: UIImage? {
    switch self {
    case .marker:
      return UIImage(systemName: "highlighter")
    case .eraser:
      return UIImage(systemName: "bandage")
    default:
      return UIImage(systemName: "pencil")
    }
  }
}

extension Brush {
  static var normal: Brush {
    return Brush(color: .black, width: 5, opacity: 1)
  }
  
  static var eraser: Brush {
    return Brush(width: 9, adjustedWidthFactor: 5, blendMode: .clear)
  }
}
