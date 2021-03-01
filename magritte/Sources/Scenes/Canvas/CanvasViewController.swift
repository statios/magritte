//
//  CanvasViewController.swift
//  magritte
//
//  Created by KIHYUN SO on 2021/03/02.
//

import ReactorKit
import UIKit
import SwiftyDraw
import RxSwift
import RxCocoa

final class CanvasViewController: BaseViewController {
  private var canvasView = SwiftyDrawView()
  private var toolKitView = UIView()
  private var whiteBackgroundColorButton = UIButton()
  private var blackBackgroundColorButton = UIButton()
  private var paletteCollectionView = UICollectionView(
    frame: .zero,
    collectionViewLayout: UICollectionViewFlowLayout()
  )
  private var undoButton = UIButton()
  private var redoButton = UIButton()
  private var clearButton = UIButton()
  
  override func configure() {
    reactor = CanvasViewReactor()
  }
}

// MARK: - SetupUI
extension CanvasViewController {
  
  override func setupUI() {
    
    view.do {
      $0.backgroundColor = .white
    }
    
    canvasView.do {
      $0.add(to: view)
      $0.snp.makeConstraints { (make) in
        make.edges.equalToSuperview()
      }
      $0.brush = .marker
    }
    
    toolKitView.do {
      $0.backgroundColor = 0xF7F4F1.color
      $0.add(to: view)
      $0.snp.makeConstraints { (make) in
        make.leading.equalToSuperview().offset(32)
        make.trailing.equalToSuperview().offset(-32)
        make.bottom.equalToSuperview()
        make.height.equalTo(128)
      }
      $0.layer.cornerRadius = 16
    }
    
    whiteBackgroundColorButton.do {
      $0.add(to: toolKitView)
      $0.snp.makeConstraints { (make) in
        make.centerY.equalToSuperview()
        make.leading.equalToSuperview().offset(32)
        make.size.equalTo(40)
      }
      $0.styledToolKitButton(.white)
    }
    
    blackBackgroundColorButton.do {
      $0.add(to: toolKitView)
      $0.snp.makeConstraints { (make) in
        make.centerY.equalToSuperview()
        make.leading.equalTo(whiteBackgroundColorButton.snp.trailing).offset(8)
        make.size.equalTo(40)
      }
      $0.styledToolKitButton(.black)
    }
    
    paletteCollectionView.do {
      $0.add(to: toolKitView)
      $0.snp.makeConstraints { (make) in
        make.leading.equalTo(blackBackgroundColorButton.snp.trailing).offset(32)
        make.centerY.equalToSuperview()
        make.height.equalTo(32 + 8 + 32)
        make.width.equalTo(32 * 4 + 3 * 8)
      }
      $0.register(PaletteCell.self, forCellWithReuseIdentifier: "PaletteCell")
      $0.backgroundColor = .clear
      $0.flowLayout?.minimumLineSpacing = 8
      $0.flowLayout?.minimumInteritemSpacing = 8
      $0.flowLayout?.itemSize = .init(width: 32, height: 32)
    }
    
    clearButton.do {
      $0.add(to: toolKitView)
      $0.snp.makeConstraints { (make) in
        make.trailing.equalToSuperview().offset(-32)
        make.size.equalTo(40)
        make.centerY.equalToSuperview()
      }
      $0.styledToolKitButton(.white)
      $0.setImage(UIImage(systemName: "arrow.clockwise"), for: .normal)
    }
    
    redoButton.do {
      $0.add(to: toolKitView)
      $0.snp.makeConstraints { (make) in
        make.trailing.equalTo(clearButton.snp.leading).offset(-8)
        make.centerY.size.equalTo(clearButton)
      }
      $0.styledToolKitButton(.white)
      $0.setImage(UIImage(systemName: "arrow.turn.up.right"), for: .normal)
    }
    
    undoButton.do {
      $0.add(to: toolKitView)
      $0.snp.makeConstraints { (make) in
        make.trailing.equalTo(redoButton.snp.leading).offset(-8)
        make.centerY.size.equalTo(clearButton)
      }
      $0.styledToolKitButton(.white)
      $0.setImage(UIImage(systemName: "arrow.turn.up.left"), for: .normal)
    }
    
  }
  
}

// MARK:- View
extension CanvasViewController: View {
  
  func bind(reactor: CanvasViewReactor) {
    // Action
    
    // State
    reactor.state.map { $0.paletteColors }
      .bind(
        to: paletteCollectionView.rx.items(
          cellIdentifier: "PaletteCell",
          cellType: PaletteCell.self
        )
      ) { (index, color, cell) in
        cell.configure(color)
      }.disposed(by: disposeBag)
    
    // View
    paletteCollectionView.rx.modelSelected(UIColor.self)
      .subscribe(onNext: { [weak self] in
        self?.canvasView.brush.color = Color($0)
      }).disposed(by: disposeBag)
    
    Observable.merge(
      whiteBackgroundColorButton.rx.tap.map { UIColor.white },
      blackBackgroundColorButton.rx.tap.map { UIColor.black }
    ).bind(to: view.rx.backgroundColor)
    .disposed(by: disposeBag)
    
    clearButton.rx.tap
      .subscribe(onNext: { [weak self] in self?.canvasView.clear() })
      .disposed(by: disposeBag)
    
    redoButton.rx.tap
      .subscribe(onNext: { [weak self] in self?.canvasView.redo() })
      .disposed(by: disposeBag)
    
    undoButton.rx.tap
      .subscribe(onNext: { [weak self] in self?.canvasView.undo() })
      .disposed(by: disposeBag)
  }
  
}

// MARK:- Helpers
extension UIView {
  fileprivate func styledToolKitButton(_ color: UIColor) {
    backgroundColor = color
    layer.cornerRadius = 20.00
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOpacity = 0.10
    layer.shadowOffset = .zero
    layer.shadowRadius = 2.00
  }
}
