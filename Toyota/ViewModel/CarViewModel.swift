//
//  CarViewModel.swift
//  Toyota
//
//  Created by Kal Y on 7/3/24.
//

import SwiftUI

class CarViewModel: ObservableObject {
    
    @Published var cars: [Car] = []
    @Published var isShowingDetail = false
    @Published var selectedCar: Car?
    
    func getCars() {
        
        Task{
            do {
                let carList = try await NetworkManager().getCarInfo()
                DispatchQueue.main.async { [self] in
                    self.cars = carList
                }
            }catch {
                print("Not able to load")
            }
        }
    }
}

