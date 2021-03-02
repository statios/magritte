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
  private var stackView = UIStackView()
  private var canvasColorPirckerView = CanvasColorPickerView()
  private var brushColorPickerView = BrushColorPickerView()
  private var canvasControllerView = CanvasControllerView()
  private var brushPickerView = BrushPickerView()
  
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
    
    stackView.do {
      $0.add(to: toolKitView)
      $0.snp.makeConstraints { (make) in
        make.leading.equalToSuperview().offset(32)
        make.trailing.equalToSuperview().offset(-32)
        make.top.bottom.equalToSuperview()
      }
      $0.axis = .horizontal
      $0.alignment = .center
      $0.distribution = .equalSpacing
      $0.addArrangedSubview(canvasColorPirckerView)
      $0.addArrangedSubview(brushColorPickerView)
      $0.addArrangedSubview(brushPickerView)
      $0.addArrangedSubview(canvasControllerView)
    }
    
    brushPickerView.do {
      $0.collectionView.selectItem(at: .init(row: 1, section: 0))
    }
    
    brushColorPickerView.do {
      $0.collectionView.selectItem(at: .init(row: 7, section: 0))
    }
  }
  
}

// MARK:- View
extension CanvasViewController: View {
  
  func bind(reactor: CanvasViewReactor) {
    // Action
    
    // State
    reactor.state.map { $0.paletteColors }
      .subscribe(onNext: { [weak self] in
        self?.brushColorPickerView.configure($0)
      }).disposed(by: disposeBag)
    
    reactor.state.map { $0.burshs }
      .subscribe(onNext: { [weak self] in
        self?.brushPickerView.configure($0)
      }).disposed(by: disposeBag)
    
    // Views
    Observable.combineLatest(
      brushColorPickerView.collectionView.rx
        .modelSelected(UIColor.self)
        .startWith(.black),
      brushPickerView.collectionView.rx
        .modelSelected(Brush.self)
        .startWith(.normal)
    ).subscribe(onNext: { [weak self] in
      self?.canvasView.brush = $0.1
      self?.canvasView.brush.color = Color($0.0)
    }).disposed(by: disposeBag)
    
    canvasControllerView.undoButton.rx.tap
      .subscribe(onNext: { [weak self] in
        self?.canvasView.undo()
      }).disposed(by: disposeBag)
    
    canvasControllerView.redoButton.rx.tap
      .subscribe(onNext: { [weak self] in
        self?.canvasView.redo()
      }).disposed(by: disposeBag)
    
    canvasControllerView.clearButton.rx.tap
      .subscribe(onNext: { [weak self] in
        self?.canvasView.clear()
      }).disposed(by: disposeBag)
    
    Observable.merge(
      canvasColorPirckerView.whiteColorButton.rx.tap .map { UIColor.white },
      canvasColorPirckerView.blackColorButton.rx.tap .map { UIColor.black }
    ).subscribe(onNext: { [weak self] in
      self?.canvasView.backgroundColor = $0
    }).disposed(by: disposeBag)
  }
  
}
