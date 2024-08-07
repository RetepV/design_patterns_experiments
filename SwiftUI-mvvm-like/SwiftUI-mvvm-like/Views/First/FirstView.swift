//
//  FirstView.swift
//  SwiftUI-mvvm-like
//
//  Created by Peter de Vroomen on 01/07/2024.
//

import SwiftUI

struct FirstView: View {
    // MARK: - State
    
    @State
    var model = ViewModel() as ViewModelProtocol

    // MARK: - View
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(model.titleLabel)
                    .font(Font.system(size: 36, weight: .bold))
                Spacer()
                    .frame(height: 64)
                NavigationLink(model.firstPushVCButtonLabel) {
                    model.firstPushVCButtonTapped()
                }
                Spacer()
                    .frame(height:16)
                NavigationLink(model.secondPushVCButtonLabel) {
                    model.secondPushVCButtonTapped()
                }
                Spacer()
            }
            .navigationBarTitle(model.title)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    FirstView()
}
