//
//  ViewModelable.swift
//  STap
//
//  Created by 이호영 on 2023/10/05.
//

import SwiftUI
import Combine

protocol ViewModelable: ObservableObject {
  associatedtype Action
  associatedtype State
  
  var state: State { get }
  
  func action(_ action: Action)
}
