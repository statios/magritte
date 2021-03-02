//
//  CanvasControllerView.swift
//  magritte
//
//  Created by KIHYUN SO on 2021/03/02.
//

import Foundation
import UIKit

final class CanvasControllerView: BaseView {
  private var undoButton = UIButton()
  private var redoButton = UIButton()
  private var clearButton = UIButton()
  
  override var intrinsicContentSize: CGSize {
    return .init(width: 40 * 3 + 8 * 2, height: 40)
  }
}

extension CanvasControllerView {
  override func setupUI() {
    undoButton.do {
      $0.add(to: self)
      $0.snp.makeConstraints { (make) in
        make.leading.centerY.equalToSuperview()
        make.size.equalTo(40)
      }
      $0.styledToolKitButton(.white)
      $0.setImage(UIImage(systemName: "arrow.turn.up.left"), for: .normal)
    }
    
    redoButton.do {
      $0.add(to: self)
      $0.snp.makeConstraints { (make) in
        make.leading.equalTo(undoButton.snp.trailing).offset(8)
        make.size.centerY.equalTo(undoButton)
      }
      $0.styledToolKitButton(.white)
      $0.setImage(UIImage(systemName: "arrow.turn.up.right"), for: .normal)
    }
    
    clearButton.do {
      $0.add(to: self)
      $0.snp.makeConstraints { (make) in
        make.leading.equalTo(redoButton.snp.trailing).offset(8)
        make.size.centerY.equalTo(undoButton)
      }
      $0.styledToolKitButton(.white)
      $0.setImage(UIImage(systemName: "arrow.clockwise"), for: .normal)
    }
  }
}
