//
//  detailNutriVC.swift
//  
//
//  Created by Gokul Nair on 10/07/20.
//

import UIKit

class detailNutriVC: UIViewController {
    
    @IBOutlet weak var energyLabel: UILabel!
    @IBOutlet weak var fatLabel: UILabel!
    @IBOutlet weak var proteinlbl: UILabel!
    @IBOutlet weak var cholLbl: UILabel!
    @IBOutlet weak var sugarLbl: UILabel!
    @IBOutlet weak var waterLbl: UILabel!
    @IBOutlet weak var energyU: UILabel!
    @IBOutlet weak var fatU: UILabel!
    @IBOutlet weak var proU: UILabel!
    @IBOutlet weak var choU: UILabel!
    @IBOutlet weak var sugarU: UILabel!
    @IBOutlet weak var waterU: UILabel!
    
    
    @IBOutlet weak var layer1: UIImageView!
    @IBOutlet weak var layer2: UIImageView!
    @IBOutlet weak var layer3: UIImageView!
    @IBOutlet weak var layer4: UIImageView!
    @IBOutlet weak var layer5: UIImageView!
    @IBOutlet weak var layer6: UIImageView!
    
    
    var recipe = recipeManager()
    var pass = DetailRecipeVC()
    
    var energy:String!
    var protein:String!
    var fat:String!
    var water:String!
    var sugar:String!
    var cholesterol:String!
    
    
    var energyUnit:String!
    var proteinUnit:String!
    var fatUnit:String!
    var waterUnit:String!
    var sugarUnit:String!
    var cholesterolUnit:String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        energyLabel.text = energy
        fatLabel.text = fat
        proteinlbl.text = protein
        cholLbl.text = cholesterol
        sugarLbl.text = sugar
        waterLbl.text = water
        
        energyU.text = energyUnit
        proU.text = proteinUnit
        fatU.text = fatUnit
        waterU.text = waterUnit
        choU.text = cholesterolUnit
        sugarU.text = sugarUnit
        
        
        layer1.layer.cornerRadius = 10
        layer2.layer.cornerRadius = 10
        layer3.layer.cornerRadius = 10
        layer4.layer.cornerRadius = 10
        layer5.layer.cornerRadius = 10
        layer6.layer.cornerRadius = 10
        
        layer1.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer1.layer.borderWidth = 1
        
        layer2.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer2.layer.borderWidth = 1
        
        layer3.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer3.layer.borderWidth = 1
        
        layer4.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer4.layer.borderWidth = 1
        
        layer5.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer5.layer.borderWidth = 1
        
        layer6.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer6.layer.borderWidth = 1
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
}
