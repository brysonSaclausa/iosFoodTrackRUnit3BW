//
//  MockController.swift
//  iosFoodTruckTrackR
//
//  Created by BrysonSaclausa on 10/15/20.
//

import Foundation

class MockOperatorController {
    var operatorArray = [FoodtruckOperator]()
    
    init() {
        let truck1 = FoodtruckOperator(id: 1, name: "Worlds Best Taco Truck, Period", truckImage: "ft1", cuisineType: "Tacos", latitude: 0, longitude: 0, operatorId: 1)
        let truck2 = FoodtruckOperator(id: 2, name: "Corndogs On The Run", truckImage: "ft2", cuisineType: "Carnival", latitude: 0, longitude: 0, operatorId: 2)
        let truck3 = FoodtruckOperator(id: 3, name: "Pho Wheels", truckImage: "ft3", cuisineType: "Asain", latitude: 0, longitude: 0, operatorId: 3)
     
        
        
        
        [truck1, truck2, truck3].forEach {
            operatorArray.append($0)
        }
    }
    
}
