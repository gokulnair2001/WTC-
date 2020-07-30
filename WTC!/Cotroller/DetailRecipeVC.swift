//
//  DetailRecipeVC.swift
//  WTC!
//
//  Created by Gokul Nair on 07/07/20.
//  Copyright © 2020 Gokul Nair. All rights reserved.
//

import UIKit

class DetailRecipeVC: UIViewController {
    
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var healthLabel: UILabel!
    @IBOutlet weak var ingredientLabel: UILabel!
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nutritionBook: UIButton!
    @IBOutlet weak var layer1: UIImageView!
    @IBOutlet weak var layer2: UIImageView!
    
    
    
    let haptic = haptickFeedback()
    var recipe = recipeManager()
    var image = UIImage()
    var model: jsonModel?
    
    var modelC: infoC?
    var modelF: infoF?
    var modelP: infoP?
    var modelW: infoW?
    var modelE: info?
    var modelS: infoS?
    
    
    weak var main = MainViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        healthLabel.text = model?.healthLabels.joined(separator: "\n + ")
        ingredientLabel.text = model?.ingredientLines.joined(separator: "\n - " )
        recipeName.text = model!.label
        recipeImage.kf.setImage(with: URL(string: (model?.image)!))
        
        recipeImage.layer.cornerRadius = 10
        recipeImage.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        recipeImage.layer.borderWidth = 1
        
        layer1.layer.cornerRadius = 10
        layer2.layer.cornerRadius = 10
        
        layer1.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer2.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        layer1.layer.borderWidth = 1
        layer2.layer.borderWidth = 1
        
        
    }
    
    @IBAction func imageTap(_ sender: Any) {
        performSegue(withIdentifier: "popUp", sender: nil)
        haptic.haptiFeedback1()
    }
    
    
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nutretion(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "nutri", sender: self)
        haptic.haptiFeedback1()
    }
    
    
    @IBAction func graphBtn(_ sender: Any) {
        performSegue(withIdentifier: "graph", sender: nil)
        self.present(GraphViewController(), animated: true)
        haptic.haptiFeedback1()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if (segue.identifier == "nutri") {
         
            let vc = segue.destination as! detailNutriVC
            
            vc.energy = modelE?.quantity
            vc.fat = modelF?.quantity
            vc.water = modelW?.quantity
            vc.cholesterol = modelC?.quantity
            vc.sugar = modelS?.quantity
            vc.protein = modelP?.quantity
            
            vc.sugarUnit = modelS?.unit
            vc.cholesterolUnit = modelC?.unit
            vc.fatUnit = modelF?.unit
            vc.energyUnit = modelE?.unit
            vc.proteinUnit = modelP?.unit
            vc.waterUnit = modelW?.unit
        }
        else {return}
        
        guard let vc1 = segue.destination as? PopupViewController else {return}
        
        vc1.imageString = model?.image
    }
}


