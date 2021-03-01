//
//  BaseReactor.swift
//  magritte
//
//  Created by KIHYUN SO on 2021/03/02.
//

import ReactorKit
import RxSwift

class BaseReactor {
  
  var disposeBag = DisposeBag()
  
  init() {
    Log.verbose(String(describing: Self.self))
  }
  
  deinit {
    Log.verbose(String(describing: Self.self))
  }
  
}
