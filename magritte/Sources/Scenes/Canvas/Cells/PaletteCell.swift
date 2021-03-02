//
//  PaletteCell.swift
//  magritte
//
//  Created by KIHYUN SO on 2021/03/02.
//

import UIKit
import RxSwift
import RxCocoa

final class PaletteCell: BaseCollectionViewCell {
  
  override var isSelected: Bool {
    didSet { updateSelectedState() }
  }
  
  func configure(_ color: UIColor) {
    contentView.do {
      $0.backgroundColor = color
      $0.layer.borderColor = UIColor.black.withAlphaComponent(0.2).cgColor
    }
  }
  
}

extension PaletteCell {
  
  override func setupUI() {
    contentView.do {
      $0.layer.cornerRadius = 16
    }
  }
  
  func updateSelectedState() {
    contentView.layer.borderWidth = isSelected ? 6 : 0
  }
  
}
