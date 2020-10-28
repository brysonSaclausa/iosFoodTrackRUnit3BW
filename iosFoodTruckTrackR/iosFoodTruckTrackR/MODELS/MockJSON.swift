//
//  MockJSON.swift
//  iosFoodTruckTrackR
//
//  Created by BrysonSaclausa on 10/15/20.
//

import Foundation

let foodTruckOeratorJSON = """
{
    "resultCount: 3",
    "results": [
        { "operatorName" : "Worlds Best Taco Truck, Period.",
          "cuisineType" : "Tacos",
          "longitude" : "",
          "latitude" : "",
        },
        { "operatorName" : "Corndogs On The Run",
          "cuisineType" : "American",
          "xCoordinate" : "",
          "yCoordinate" : "",
        },
        { "operatorName" : "Pho Wheels",
          "cuisineType" : "Asian",
          "xCoordinate" : "",
          "yCoordinate" : "",
        }
    ]
}











""".data(using: .utf8)
