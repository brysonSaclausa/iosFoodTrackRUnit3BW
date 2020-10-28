//
//  OperatorDetailViewController.swift
//  iosFoodTruckTrackR
//
//  Created by BrysonSaclausa on 10/15/20.
//

import UIKit
import MapKit

class OperatorDetailViewController: UIViewController {

    //MARK: - IBOUTLETS
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var cuisineLabel: UILabel!
    @IBOutlet weak var boxview: UIView!
    
    //MARK: - Properties
    var foodtruckOperator: FoodtruckOperator?
    var mockController: MockOperatorController?
    
    let latitude = Double()
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        addButton.layer.cornerRadius = 8
        boxview.layer.cornerRadius = 8
        
        
        
        
    }
    
    func updateViews() {
        guard let foodtruckOperator = foodtruckOperator else { return }
        nameLabel.text = foodtruckOperator.name
        imageView.image = UIImage(named: foodtruckOperator.truckImage)
        imageView.layer.cornerRadius = 8
        cuisineLabel.text = foodtruckOperator.cuisineType
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
