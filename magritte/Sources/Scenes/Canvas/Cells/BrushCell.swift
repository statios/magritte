//
//  PencilCell.swift
//  magritte
//
//  Created by KIHYUN SO on 2021/03/02.
//

import UIKit
import RxSwift
import RxCocoa
import SwiftyDraw

final class BrushCell: BaseCollectionViewCell {
  
  private let titleLabel = UILabel()
  private let pencilImageView = UIImageView()
  
  override var isSelected: Bool {
    didSet { updateSelectedState() }
  }
  
  func configure(_ brush: Brush) {
    titleLabel.text = "\(brush.width)"
    pencilImageView.image = brush.image
  }
  
}

extension BrushCell {
  
  override func setupUI() {
    
    pencilImageView.do {
      $0.add(to: contentView)
      $0.snp.makeConstraints { (make) in
        make.edges.equalToSuperview()
      }
      $0.tintColor = .lightGray
    }
    
    titleLabel.do {
      $0.add(to: contentView)
      $0.snp.makeConstraints { (make) in
        make.center.equalTo(pencilImageView)
      }
      $0.textColor = .black
      $0.font = UIFont.systemFont(ofSize: 8)
      $0.clipsToBounds = true
      $0.backgroundColor = .white
    }
    
  }
  
  func updateSelectedState() {
    pencilImageView.tintColor = isSelected ? .darkGray : .lightGray
  }
  
}


