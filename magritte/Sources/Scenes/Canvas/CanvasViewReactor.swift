//
//  CanvasViewReactor.swift
//  magritte
//
//  Created by KIHYUN SO on 2021/03/02.
//

import ReactorKit
import UIKit

final class CanvasViewReactor: BaseReactor {
  
  enum Action {
    
  }
  
  enum Mutation {
    
  }
  
  struct State {
    var paletteColors: [UIColor]
  }
  
  var initialState = State(
    paletteColors: [
      .systemRed,
      .systemOrange,
      .systemYellow,
      .systemGreen,
      .systemTeal,
      .systemBlue,
      .systemIndigo,
      .black
    ]
  )
  
}

extension CanvasViewReactor: Reactor {
  
  func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    }
  }
  
  func reduce(state: State, mutation: Mutation) -> State {
    var newState = state
    switch mutation {
    }
    return newState
  }
  
}
