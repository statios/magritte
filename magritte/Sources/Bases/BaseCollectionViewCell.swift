//
//  BaseCollectionViewCell.swift
//  magritte
//
//  Created by KIHYUN SO on 2021/03/02.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupUI()
  }
  
  @objc dynamic func setupUI() {
    
  }
  
}
