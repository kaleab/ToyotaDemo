//
//  ContentView.swift
//  Toyota
//
//  Created by Kal Y on 7/3/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CarViewModel()
    var body: some View {
        
        ZStack {
            NavigationStack {
                List(viewModel.cars, id: \.id) { car in
                    CarCell.init(cars: car)
                        .onTapGesture {
                            viewModel.selectedCar = car
                            viewModel.isShowingDetail = true
                        }
                }
                .navigationTitle("Toyota Cars")
                .disabled(viewModel.isShowingDetail)
            }
            .onAppear {
                viewModel.getCars()
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            
            if viewModel.isShowingDetail {
                CarDetailView(car: viewModel.selectedCar ?? MockData.sampleCar, isShowingDetail: $viewModel.isShowingDetail)
            }
        }
    }
    
}

#Preview {
    ContentView()
}

