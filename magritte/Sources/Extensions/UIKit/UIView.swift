//
//  UIView.swift
//  magritte
//
//  Created by KIHYUN SO on 2021/03/02.
//

import Foundation
import UIKit

extension UIView {
  func add(to: UIView) {
    to.addSubview(self)
  }
}

extension UIView {
  func styledToolKitButton(_ color: UIColor) {
    backgroundColor = color
    layer.cornerRadius = 20.00
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOpacity = 0.10
    layer.shadowOffset = .zero
    layer.shadowRadius = 2.00
  }
}
