//
//  CarButton.swift
//  Toyota
//
//  Created by Kal Y on 7/4/24.
//

import SwiftUI

struct CarButton: View {
    let title: LocalizedStringKey
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundColor(.white)
            .background(Color.brandPrimary)
            .cornerRadius(10)
    }
}

#Preview {
    CarButton(title: "Car Title")
}
