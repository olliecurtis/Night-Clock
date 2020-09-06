//
//  FlipView.swift
//  Night Clock
//
//  Created by Oliver Curtis on 06/09/2020.
//  Copyright © 2020 Oliver Curtis. All rights reserved.
//

import SwiftUI

struct FlipView: View {

    init(viewModel: FlipModel) {
        self.viewModel = viewModel
    }

    @ObservedObject var viewModel: FlipModel

    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                SingleFlipView(text: viewModel.newValue ?? "", type: .top)
                SingleFlipView(text: viewModel.oldValue ?? "", type: .top)
                    .rotation3DEffect(.init(degrees: self.viewModel.animateTop ? -90 : .zero),
                                      axis: (1, 0, 0),
                                      anchor: .bottom,
                                      perspective: 0.5)
            }
            Color.separator
                .frame(height: 1)
            ZStack {
                SingleFlipView(text: viewModel.oldValue ?? "", type: .bottom)
                SingleFlipView(text: viewModel.newValue ?? "", type: .bottom)
                    .rotation3DEffect(.init(degrees: self.viewModel.animateBottom ? .zero : 90),
                                      axis: (1, 0, 0),
                                      anchor: .top,
                                      perspective: 0.5)
            }
        }
            .fixedSize()
    }

}
