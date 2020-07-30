//
//  nutrientsViewController.swift
//  WTC!
//
//  Created by Gokul Nair on 15/07/20.
//  Copyright © 2020 Gokul Nair. All rights reserved.
//

import UIKit

class nutrientsViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var healthLabel: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var energyLbl: UILabel!
    @IBOutlet weak var fatLbl: UILabel!
    @IBOutlet weak var protLbl: UILabel!
    @IBOutlet weak var choLbl: UILabel!
    @IBOutlet weak var sugarLbl: UILabel!
    @IBOutlet weak var waterLbl: UILabel!
    @IBOutlet weak var dietLbl: UILabel!
    @IBOutlet weak var cautionLbl: UILabel!
   
    //MARK:-  symbol outlets
    
    @IBOutlet weak var calSymbol: UIButton!
    @IBOutlet weak var eneSym: UIButton!
    @IBOutlet weak var choSym: UIButton!
    @IBOutlet weak var sugaSym: UIButton!
    @IBOutlet weak var fatSym: UIButton!
    @IBOutlet weak var proSym: UIButton!
    @IBOutlet weak var watSym: UIButton!
    
    
    //MARK:- Outlets for Units
    
    @IBOutlet weak var energyU: UILabel!
    @IBOutlet weak var fatU: UILabel!
    @IBOutlet weak var proteinU: UILabel!
    @IBOutlet weak var choU: UILabel!
    @IBOutlet weak var sugarU: UILabel!
    @IBOutlet weak var waterU: UILabel!
    @IBOutlet weak var calU: UILabel!
    
    //MARK:- background outlets
    
    @IBOutlet weak var layer1: UIImageView!
    @IBOutlet weak var layer2: UIImageView!
    @IBOutlet weak var layer3: UIImageView!
    @IBOutlet weak var layer4: UIImageView!
    @IBOutlet weak var layer5: UIImageView!
    @IBOutlet weak var layer6: UIImageView!
    @IBOutlet weak var layer7: UIImageView!
    @IBOutlet weak var layer8: UILabel!
    @IBOutlet weak var layer9: UILabel!
    @IBOutlet weak var layer10: UILabel!
    
    var recipe = recipeManager()
    var haptick = haptickFeedback()
    
    
    var model: HlthLabel?
    var dataE: NutriEnergy?
    var dataF: NutriFat?
    var dataP: NutriPro?
    var dataC: NutriCho?
    var dataW: NutriWater?
    var dataCal: calories?
    var dataCaut: cautions?
    var dataDiet: dietLabels?
    var dataS: NutriSugar?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        self.backgroundItems()
        
        
    }
    
}


extension nutrientsViewController {
    
    @IBAction func Searchutton(_ sender: Any) {
        searchBar.endEditing(true)
        relodeData()
        haptick.haptiFeedback1()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        searchBar.endEditing(true)
        
        return true
        
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        if textField.text != "" {
            return true
        }else{
            textField.placeholder = "Type Something"
            return false
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let Item = searchBar.text {
            self.recipe.jsonParsingNutrition(ingredient: Item)
        }
        
        searchBar.text = ""
    }
}

extension nutrientsViewController: RecipeManagerDelegate {
    
    func didUpdateRecipe(_ RecipeManager: recipeManager, model: jsonModel, Info: info) {
        
        //  self.caloriesLbl.text = dataCal?.calories
        // self.energyLbl.text = dataE?.quantity
        
    }
    
    func didFailWithError(error: Error) {
        
        
        
        DispatchQueue.main.async {
            let alertControl = UIAlertController(title:"Error", message: "Lost Connection", preferredStyle: .actionSheet)
            alertControl.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertControl, animated: true,completion: nil)
        }
    }
}


extension nutrientsViewController{
    
    func relodeData() {
       
            self.energyLbl.text = dataE?.quantity
            self.choLbl.text = dataC?.quantity
            self.fatLbl.text = dataF?.quantity
            self.protLbl.text = dataP?.quantity
            self.waterLbl.text = dataW?.quantity
            self.sugarLbl.text = dataS?.quantity
            //self.dietLbl.text = dataDiet?.dietLabels
            self.cautionLbl.text = dataCaut?.cautions
            self.healthLabel.text = model?.healthLabels.joined(separator: "\n + ")
            self.caloriesLbl.text = dataCal?.calories
            
            self.choU.text = dataC?.unit
            self.proteinU.text = dataP?.unit
            self.waterU.text = dataW?.unit
            self.energyU.text = dataE?.unit
            self.sugarU.text = dataS?.unit
            self.fatU.text = dataF?.unit
            
    }
}

//MARK:- symbols for nutrients

extension nutrientsViewController{
    
    
}

//MARK:-  UI Related Codes
extension nutrientsViewController {
    func backgroundItems() {
        
        layer1.layer.cornerRadius = 10
        layer2.layer.cornerRadius = 10
        layer3.layer.cornerRadius = 10
        layer4.layer.cornerRadius = 10
        layer5.layer.cornerRadius = 10
        layer6.layer.cornerRadius = 10
        layer7.layer.cornerRadius = 10
        layer8.layer.cornerRadius = 10
        layer9.layer.cornerRadius = 10
        layer10.layer.cornerRadius = 10
        
        
        
        
        calSymbol.layer.cornerRadius = 10
        calSymbol.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        calSymbol.layer.borderWidth = 1
        
        eneSym.layer.cornerRadius = 10
        eneSym.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        eneSym.layer.borderWidth = 1
        
        choSym.layer.cornerRadius = 10
            choSym.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        choSym.layer.borderWidth = 1
        
        watSym.layer.cornerRadius = 10
        watSym.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        watSym.layer.borderWidth = 1
        
        sugaSym.layer.cornerRadius = 10
        sugaSym.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        sugaSym.layer.borderWidth = 1
        
        fatSym.layer.cornerRadius = 10
        fatSym.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        fatSym.layer.borderWidth = 1
        
        proSym.layer.cornerRadius = 10
        proSym.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        proSym.layer.borderWidth = 1
        
       /* layer1.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer2.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer3.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer4.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer5.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer6.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer7.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer8.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer9.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer10.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        layer1.layer.borderWidth = 1.5
        layer2.layer.borderWidth = 1.5
        layer3.layer.borderWidth = 1.5
        layer4.layer.borderWidth = 1.5
        layer5.layer.borderWidth = 1.5
        layer6.layer.borderWidth = 1.5
        layer7.layer.borderWidth = 1.5
        layer8.layer.borderWidth = 1.5
        layer9.layer.borderWidth = 1.5
        layer10.layer.borderWidth = 1.5
        
       //UI features for labels
        
        caloriesLbl.layer.shadowColor = UIColor.black.cgColor
        caloriesLbl.layer.shadowRadius = 0.25
        caloriesLbl.layer.shadowOpacity = 0.5
        caloriesLbl.layer.masksToBounds = false
        
        protLbl.layer.shadowColor = UIColor.black.cgColor
        protLbl.layer.shadowRadius = 0.25
        protLbl.layer.shadowOpacity = 0.5
        protLbl.layer.masksToBounds = false
        
        choLbl.layer.shadowColor = UIColor.black.cgColor
        choLbl.layer.shadowRadius = 0.25
        choLbl.layer.shadowOpacity = 0.5
        choLbl.layer.masksToBounds = false
        
        waterLbl.layer.shadowColor = UIColor.black.cgColor
        waterLbl.layer.shadowRadius = 0.25
        waterLbl.layer.shadowOpacity = 0.5
        waterLbl.layer.masksToBounds = false
        
        sugarLbl.layer.shadowColor = UIColor.black.cgColor
        sugarLbl.layer.shadowRadius = 0.25
        sugarLbl.layer.shadowOpacity = 0.5
        sugarLbl.layer.masksToBounds = false
        
        energyLbl.layer.shadowColor = UIColor.black.cgColor
        energyLbl.layer.shadowRadius = 0.25
        energyLbl.layer.shadowOpacity = 0.5
        energyLbl.layer.masksToBounds = false
        
        fatLbl.layer.shadowColor = UIColor.black.cgColor
        fatLbl.layer.shadowRadius = 0.25
        fatLbl.layer.shadowOpacity = 0.5
        fatLbl.layer.masksToBounds = false
        
        healthLabel.layer.shadowColor = UIColor.black.cgColor
        healthLabel.layer.shadowRadius = 0.25
        healthLabel.layer.shadowOpacity = 0.5
        healthLabel.layer.masksToBounds = false
        
        cautionLbl.layer.shadowColor = UIColor.black.cgColor
        cautionLbl.layer.shadowRadius = 0.25
        cautionLbl.layer.shadowOpacity = 0.5
        cautionLbl.layer.masksToBounds = false
        
        dietLbl.layer.shadowColor = UIColor.black.cgColor
        dietLbl.layer.shadowRadius = 0.25
        dietLbl.layer.shadowOpacity = 0.5
        dietLbl.layer.masksToBounds = false
        
        
        
        //for units label
        
        proteinU.layer.shadowColor = UIColor.black.cgColor
        proteinU.layer.shadowRadius = 0.25
        proteinU.layer.shadowOpacity = 0.5
        proteinU.layer.masksToBounds = false
        
        calU.layer.shadowColor = UIColor.black.cgColor
        calU.layer.shadowRadius = 0.25
        calU.layer.shadowOpacity = 0.5
        calU.layer.masksToBounds = false
        
        choU.layer.shadowColor = UIColor.black.cgColor
        choU.layer.shadowRadius = 0.25
        choU.layer.shadowOpacity = 0.5
        choU.layer.masksToBounds = false
        
        energyU.layer.shadowColor = UIColor.black.cgColor
        energyU.layer.shadowRadius = 0.25
        energyU.layer.shadowOpacity = 0.5
        energyU.layer.masksToBounds = false
        
        waterU.layer.shadowColor = UIColor.black.cgColor
        waterU.layer.shadowRadius = 0.25
        waterU.layer.shadowOpacity = 0.5
        waterU.layer.masksToBounds = false
        
        fatU.layer.shadowColor = UIColor.black.cgColor
        fatU.layer.shadowRadius = 0.25
        fatU.layer.shadowOpacity = 0.5
        fatU.layer.masksToBounds = false
        
        sugarU.layer.shadowColor = UIColor.black.cgColor
        sugarU.layer.shadowRadius = 0.25
        sugarU.layer.shadowOpacity = 0.5
        sugarU.layer.masksToBounds = false */
        
    }
}
