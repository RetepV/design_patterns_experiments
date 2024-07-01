//
//  ThirdView.swift
//  SwiftUI-mvvm-like
//
//  Created by Peter de Vroomen on 01/07/2024.
//

import SwiftUI

struct ThirdView: View {
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
            }
            .navigationBarTitle(model.title)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    FirstView()
}
