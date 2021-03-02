//
//  BaseCollectionView.swift
//  magritte
//
//  Created by KIHYUN SO on 2021/03/02.
//

import UIKit

class BaseCollectionView: UICollectionView {
  
  init() {
    super.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
