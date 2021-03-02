//
//  BackgroundColorPickerView.swift
//  magritte
//
//  Created by KIHYUN SO on 2021/03/02.
//

import UIKit

class CanvasColorPickerView: BaseView {
  private let whiteColorButton = UIButton()
  private let blackColorButton = UIButton()
}

extension CanvasColorPickerView {
  override func setupUI() {
    whiteColorButton.do {
      $0.add(to: self)
      $0.snp.makeConstraints { (make) in
        make.size.equalTo(40)
        make.leading.equalToSuperview()
        make.centerY.equalToSuperview()
      }
      $0.styledToolKitButton(.white)
    }
    
    blackColorButton.do {
      $0.add(to: self)
      $0.snp.makeConstraints { (make) in
        make.size.centerY.equalTo(whiteColorButton)
        make.leading.equalTo(whiteColorButton.snp.trailing).offset(8)
      }
      $0.styledToolKitButton(.black)
    }
  }
  
  override var intrinsicContentSize: CGSize {
    return .init(width: 40 + 8 + 40, height: 40)
  }
}
