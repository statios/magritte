//
//  BrushPickerView.swift
//  magritte
//
//  Created by KIHYUN SO on 2021/03/02.
//

import UIKit
import SwiftyDraw
import RxSwift
import RxCocoa

final class BrushPickerView: BaseView {
  let collectionView = BaseCollectionView()
  
  override var intrinsicContentSize: CGSize {
    return .init(width: 40 * 3 + 2 * 8, height: 40 + 8 + 40)
  }
}

extension BrushPickerView {
  override func setupUI() {
    collectionView.do {
      $0.add(to: self)
      $0.snp.makeConstraints { (make) in
        make.edges.equalToSuperview()
      }
      $0.register(BrushCell.self, forCellWithReuseIdentifier: "BrushCell")
      $0.backgroundColor = .clear
      $0.isScrollEnabled = false
      $0.flowLayout?.minimumLineSpacing = 8
      $0.flowLayout?.minimumInteritemSpacing = 8
      $0.flowLayout?.itemSize = .init(width: 40, height: 40)
    }
  }
  
  func configure(_ brushs: [Brush]) {
    Observable.just(brushs)
      .bind(
        to: collectionView.rx.items(
          cellIdentifier: "BrushCell", cellType: BrushCell.self
        )
      ) { (index, brush, cell) in
        cell.configure(brush)
      }.disposed(by: disposeBag)
  }
}
