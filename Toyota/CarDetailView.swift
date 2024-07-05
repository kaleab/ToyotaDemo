//
//  CarDetailView.swift
//  Toyota
//
//  Created by Kal Y on 7/4/24.
//

import SwiftUI

struct CarDetailView: View {
    let car: Car
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack {
            CarRemoteImage(urlString: car.imageURL)
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 225)
            
            HStack{
                VStack{
                    Text("Name")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(.green)
                        .padding(5)
                    Text(car.carName)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.secondary)
                }
                Spacer()
                VStack {
                    Text("Price")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(.green)
                        .padding(5)
                    
                    Text(car.price)
                        .font(.title2)
                        .foregroundStyle(.secondary)
                        .fontWeight(.semibold)
                }

            }
            .padding(50)
            
            Spacer()
            Button {
                print("Tapped")
            } label: {
                CarButton(title: "\(car.price) Add to Order ")
            }
            
            .padding(.bottom, 30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button {
            isShowingDetail = false
        } label: {
            XDismissButton()
            
        }, alignment: .topTrailing
        
        )
    }
}

#Preview {
    CarDetailView(car: MockData.sampleCar, isShowingDetail: .constant(true))
}
