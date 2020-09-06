//
//  ContentView.swift
//  Night Clock
//
//  Created by Oliver Curtis on 06/09/2020.
//  Copyright © 2020 Oliver Curtis. All rights reserved.
//

import SwiftUI

import Foundation

extension DateFormatter {
  static var timeFormatter: DateFormatter {
      let formatter = DateFormatter()
      formatter.dateFormat = "HHmmss"
      return formatter
  }
}

//Here I’m creating the calendar instance that we will operate with:

let calendar = NSCalendar.init(calendarIdentifier: NSCalendar.Identifier.gregorian)
let currentDayInt = (calendar?.component(NSCalendar.Unit.day, from: Date()))!
let currentMonthInt = (calendar?.component(NSCalendar.Unit.month, from: Date()))!
let currentYearInt = (calendar?.component(NSCalendar.Unit.year, from: Date()))!

struct ContentView: View {
  
  let viewModel = ClockModel()
  
  
  
  var body: some View {
    VStack(){
      HStack(spacing: 15) {
          HStack(spacing: 5) {
              FlipView(viewModel: viewModel.flipModels[0])
              FlipView(viewModel: viewModel.flipModels[1])
          }
          HStack(spacing: 5) {
              FlipView(viewModel: viewModel.flipModels[2])
              FlipView(viewModel: viewModel.flipModels[3])
          }
          HStack(spacing: 5) {
              FlipView(viewModel: viewModel.flipModels[4])
              FlipView(viewModel: viewModel.flipModels[5])
          }
      }
      Text("\(currentYearInt)/\(currentMonthInt)/\(currentDayInt)")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
