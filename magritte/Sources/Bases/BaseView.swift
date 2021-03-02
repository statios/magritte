//
//  BaseView.swift
//  magritte
//
//  Created by KIHYUN SO on 2021/03/02.
//

import Foundation
import UIKit
import RxSwift

class BaseView: UIView {
  
  var disposeBag = DisposeBag()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  @objc dynamic func setupUI() {
    
  }
  
}
