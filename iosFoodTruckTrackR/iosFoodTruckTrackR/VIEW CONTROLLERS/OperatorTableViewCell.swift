//
//  OperatorTableViewCell.swift
//  iosFoodTruckTrackR
//
//  Created by BrysonSaclausa on 10/15/20.
//

import UIKit

class OperatorTableViewCell: UITableViewCell {
    
    var foodtruckOperator: FoodtruckOperator? {
        didSet {
            updateViews()
        }
    }

// MARK: - IBOUTLETS
    
    @IBOutlet weak var operatorImage: UIImageView!
    @IBOutlet weak var operatorNameLabel: UILabel!
    
//MARK: - FUNCTIONS
    
    func updateViews() {
        guard let foodtruckOperator = foodtruckOperator else { return }
        operatorNameLabel.text = foodtruckOperator.name
        operatorImage.image = UIImage(named: foodtruckOperator.truckImage)
        
        
        
    }
    
    @IBAction func addTapped(_ sender: Any) {
    }
    
}
