//
//  BrushColorPickerView.swift
//  magritte
//
//  Created by KIHYUN SO on 2021/03/02.
//

import UIKit
import RxSwift
import RxCocoa

final class BrushColorPickerView: BaseView {
  let collectionView = BaseCollectionView()
}

extension BrushColorPickerView {
  override func setupUI() {
    collectionView.do {
      $0.add(to: self)
      $0.snp.makeConstraints { (make) in
        make.edges.equalToSuperview()
      }
      $0.register(PaletteCell.self, forCellWithReuseIdentifier: "PaletteCell")
      $0.backgroundColor = .clear
      $0.flowLayout?.minimumLineSpacing = 8
      $0.flowLayout?.minimumInteritemSpacing = 8
      $0.flowLayout?.itemSize = .init(width: 32, height: 32)
    }
  }
  
  override var intrinsicContentSize: CGSize {
    return .init(width: 32 * 4 + 3 * 8, height: 32 + 8 + 32)
  }
  
  func configure(_ colors: [UIColor]) {
    Observable.just(colors)
      .bind(
        to: collectionView.rx.items(
          cellIdentifier: "PaletteCell", cellType: PaletteCell.self
        )
      ) { (index, color, cell) in
        cell.configure(color)
      }.disposed(by: disposeBag)
  }
}
