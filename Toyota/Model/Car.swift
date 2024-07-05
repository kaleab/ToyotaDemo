//
//  Car.swift
//  Toyota
//
//  Created by Kal Y on 7/3/24.
//

import Foundation

struct Car: Decodable {
    let id: Int
    let carName: String
    let imageURL: String
    let price: String
}

struct CarResponse: Decodable {
    let request: [Car]
}

struct MockData {
    static let sampleCar = Car(id: 01,
                               carName: "Supra",
                               imageURL: "https://bytelinkimage.s3.us-west-1.amazonaws.com/Supra.png",
                               price: "$46,440")
    
    let cars = [sampleCar, sampleCar, sampleCar, sampleCar, sampleCar, sampleCar]
}

