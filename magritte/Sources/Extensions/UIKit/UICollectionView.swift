//
//  UICollectionView.swift
//  magritte
//
//  Created by KIHYUN SO on 2021/03/02.
//

import UIKit

extension UICollectionView {
  var flowLayout: UICollectionViewFlowLayout? {
    return collectionViewLayout as? UICollectionViewFlowLayout
  }
  
  func selectItem(
    at: IndexPath
  ) {
    selectItem(at: at, animated: false, scrollPosition: .bottom)
  }
}
