//
//  ClockModel.swift
//  Night Clock
//
//  Created by Oliver Curtis on 06/09/2020.
//  Copyright © 2020 Oliver Curtis. All rights reserved.
//

import Foundation

import Combine

class ClockModel {
  init() {
    setupTimer()
  }
  
  private(set) lazy var flipModels = { (0...5).map { _ in FlipModel() } }()
  
  // MARK: - Private
  private func setupTimer() {
      Timer.publish(every: 1, on: .main, in: .default)
          .autoconnect()
          .map { [timeFormatter] in timeFormatter.string(from: $0) }
          .removeDuplicates()
          .sink(receiveValue: { [weak self] in self?.setTimeInViewModels(time: $0) })
          .store(in: &cancellables)
  }
  
  private func setTimeInViewModels(time: String) {
      zip(time, flipModels).forEach { number, viewModel in
          viewModel.text = "\(number)"
      }
  }

  private var cancellables = Set<AnyCancellable>()
  private let timeFormatter = DateFormatter.timeFormatter
}
