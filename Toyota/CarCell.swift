//
//  CarCell.swift
//  Toyota
//
//  Created by Kal Y on 7/3/24.
//

import SwiftUI

struct CarCell: View {
    
    let cars: Car
    
    var body: some View {
        HStack{
            CarRemoteImage(urlString: cars.imageURL)
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack(alignment: .leading, spacing: 5) {
                Text(cars.carName)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    
                
                Text(cars.price)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.cyan)
                
            }
            .padding(.leading)
        }
    }
}

#Preview {
    CarCell(cars: MockData.sampleCar)
}
